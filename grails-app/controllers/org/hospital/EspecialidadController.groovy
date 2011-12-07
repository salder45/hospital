package org.hospital

import org.springframework.dao.DataIntegrityViolationException

class EspecialidadController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "lista", params: params)
    }

    def lista() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [especialidadList: Especialidad.list(params), especialidadTotal: Especialidad.count()]
    }

    def crear() {
        [especialidad: new Especialidad(params)]
    }

    def guardar() {
        def especialidad = new Especialidad(params)
        if (!especialidad.save(flush: true)) {
            render(view: "crear", model: [especialidad: especialidad])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'especialidad.label', default: 'Especialidad'), especialidad.id])
        redirect(action: "ver", id: especialidad.id)
    }

    def ver() {
        log.debug "Show Especialidad ${params}"
        def especialidad = Especialidad.get(params.id)
        if (!especialidad) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'especialidad.label', default: 'Especialidad'), params.id])
            redirect(action: "lista")
            return
        }
        
        log.debug "Lista de Doctores ${especialidad.usuariosDoctores}"
        [especialidad: especialidad]
    }

    def editar() {
        def especialidad = Especialidad.get(params.id)
        if (!especialidad) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'especialidad.label', default: 'Especialidad'), params.id])
            redirect(action: "lista")
            return
        }

        [especialidad: especialidad]
    }

    def actualizar() {
        def especialidad = Especialidad.get(params.id)
        if (!especialidad) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'especialidad.label', default: 'Especialidad'), params.id])
            redirect(action: "lista")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (especialidad.version > version) {
                especialidad.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'especialidad.label', default: 'Especialidad')] as Object[],
                          "Another user has updated this Especialidad while you were editing")
                render(view: "editar", model: [especialidad: especialidad])
                return
            }
        }

        especialidad.properties = params

        if (!especialidad.save(flush: true)) {
            render(view: "editar", model: [especialidad: especialidad])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'especialidad.label', default: 'Especialidad'), especialidad.id])
        redirect(action: "ver", id: especialidad.id)
    }

    def eliminar() {
        def especialidad = Especialidad.get(params.id)
        if (!especialidad) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'especialidad.label', default: 'Especialidad'), params.id])
            redirect(action: "lista")
            return
        }

        try {
            especialidad.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'especialidad.label', default: 'Especialidad'), params.id])
            redirect(action: "lista")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'especialidad.label', default: 'Especialidad'), params.id])
            redirect(action: "ver", id: params.id)
        }
    }
}
