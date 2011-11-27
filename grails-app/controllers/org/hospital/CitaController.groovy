package org.hospital
import hospital.commons.Constantes
import org.springframework.dao.DataIntegrityViolationException
import grails.plugins.springsecurity.Secured
@Secured(['ROLE_ASISTENTE'])
class CitaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def springSecurityService

    def index() {
        redirect(action: "lista", params: params)
    }

    def lista() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [citaList: Cita.list(params), citaTotal: Cita.count()]
    }

    def crear() {
        [cita: new Cita(params)]
    }

    def guardar() {
        log.debug "parametros Crear ${params}"
        def cita = new Cita(params)
        cita.status=Constantes.STATUS_CITA_OTORGADA
        cita.userCreated=springSecurityService.currentUser
        if (!cita.save(flush: true)) {
            render(view: "crear", model: [cita: cita])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'cita.label', default: 'Cita'), cita.id])
        redirect(action: "ver", id: cita.id)
    }

    def ver() {
        def cita = Cita.get(params.id)
        if (!cita) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'cita.label', default: 'Cita'), params.id])
            redirect(action: "lista")
            return
        }

        [cita: cita]
    }

    def editar() {
        def cita = Cita.get(params.id)
        if (!cita) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'cita.label', default: 'Cita'), params.id])
            redirect(action: "lista")
            return
        }

        [cita: cita]
    }

    def actualizar() {
        def cita = Cita.get(params.id)
        if (!cita) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'cita.label', default: 'Cita'), params.id])
            redirect(action: "lista")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (cita.version > version) {
                cita.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'cita.label', default: 'Cita')] as Object[],
                          "Another user has updated this Cita while you were editing")
                render(view: "editar", model: [cita: cita])
                return
            }
        }

        cita.properties = params

        if (!cita.save(flush: true)) {
            render(view: "editar", model: [cita: cita])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'cita.label', default: 'Cita'), cita.id])
        redirect(action: "ver", id: cita.id)
    }

    def eliminar() {
        def cita = Cita.get(params.id)
        if (!cita) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'cita.label', default: 'Cita'), params.id])
            redirect(action: "lista")
            return
        }

        try {
            cita.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'cita.label', default: 'Cita'), params.id])
            redirect(action: "lista")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'cita.label', default: 'Cita'), params.id])
            redirect(action: "ver", id: params.id)
        }
    }
}
