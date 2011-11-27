package general

import org.springframework.dao.DataIntegrityViolationException
import grails.plugins.springsecurity.Secured
import hospital.commons.Constantes
import grails.converters.JSON
class UsuarioController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def springSecurityService
    def usuarioService

    def index() {
        redirect(action: "lista", params: params)
    }

    def lista() {
        log.debug "Lista Usuario $params"
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [usuarioList: Usuario.list(params), usuarioTotal: Usuario.count()]
    }

    def crear() {
        log.debug "Crear Usuario $params"
        def listaRoles=new ArrayList()
        def user=springSecurityService.currentUser
        if(user){     
            listaRoles=usuarioService.getListaValida(user.rol)
        }
        [usuario: new Usuario(params),flag:Constantes.CREAR,listaRoles:listaRoles]
    }

    def guardar() {
        log.debug "Guardar Usuario $params"
        def usuario = new Usuario(params)
        def rol=Rol.findByAuthority("ROLE_PACIENTE");
        if(params.rolN!=null){
            log.debug "Trae Un Rol"
            rol=Rol.get(params.rolN)            
        }
        usuario.tipoUsuario=usuarioService.asignaTipoUsuario(rol)
        log.debug rol
        if (!usuario.save(flush: true)) {
            render(view: "crear", model: [usuario: usuario])
            return
        }
        UsuarioRol.create(usuario,rol)

        flash.message = message(code: 'default.created.message', args: [message(code: 'usuario.label', default: 'Usuario'), usuario.id])
        redirect(action: "ver", id: usuario.id)
    }

    def ver() {
        log.debug "Ver Usuario $params"
        def usuario = Usuario.get(params.id)
        if (!usuario) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'usuario.label', default: 'Usuario'), params.id])
            redirect(action: "lista")
            return
        }

        [usuario: usuario]
    }
    @Secured(['ROLE_PACIENTE'])
    def editar() {
        log.debug "Editar Usuario $params"
        def usuario = Usuario.get(params.id)        
        if (!usuario) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'usuario.label', default: 'Usuario'), params.id])
            redirect(action: "lista")
            return
        }
        
        def usuarioLogeado=springSecurityService.currentUser
        if(!usuarioService.checaRoles(usuarioLogeado,usuario)){
            log.debug "NO debe Modificar"
            flash.message = message(code: 'sin.permiso.usuario', args: [usuarioLogeado.username])
            render(view: "editar", model: [usuario: usuarioLogeado])
            return 
        }
        
        def listaRoles=new ArrayList()
        if(usuarioLogeado){     
            listaRoles=usuarioService.getListaValida(usuarioLogeado.rol)
        }
        [usuario: usuario,flag:Constantes.EDITAR,listaRoles:listaRoles]
    }

    @Secured(['ROLE_PACIENTE'])
    def actualizar() {
        log.debug "Actualizar Usuario $params"
        def usuario = Usuario.get(params.id)
        if (!usuario) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'usuario.label', default: 'Usuario'), params.id])
            redirect(action: "lista")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (usuario.version > version) {
                usuario.errors.rejectValue("version", "default.optimistic.locking.failure",
                    [message(code: 'usuario.label', default: 'Usuario')] as Object[],
                          "Another user has updated this Usuario while you were editing")
                render(view: "editar", model: [usuario: usuario])
                return
            }
        }

        usuario.properties = params

        if (!usuario.save(flush: true)) {
            render(view: "editar", model: [usuario: usuario])
            return
        }
        if(params.rolN!=null){
            log.debug "Trae Un Rol"
            def rol=Rol.get(params.rolN)
            UsuarioRol.removeAll(usuario)
            UsuarioRol.create(usuario,rol)
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'usuario.label', default: 'Usuario'), usuario.id])
        redirect(action: "ver", id: usuario.id)
    }

    @Secured(['ROLE_PACIENTE'])
    def eliminar() {
        log.debug "Eliminar Usuario $params"
        def usuario = Usuario.get(params.id)
        if (!usuario) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'usuario.label', default: 'Usuario'), params.id])
            redirect(action: "lista")
            return
        }

        try {
            usuario.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'usuario.label', default: 'Usuario'), params.id])
            redirect(action: "lista")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'usuario.label', default: 'Usuario'), params.id])
            redirect(action: "ver", id: params.id)
        }
    }
    
    
    def buscaUsuariosDoctor(){
        log.debug "Busca Usuarios ${params}"
        def filtro="%${params.term}%"        
        def usuarios=Usuario.buscarNombreCompleto(filtro,Constantes.DOCTOR)        
        log.debug "Usuarios --> ${usuarios.list()}"
        def lista=[]
        for(usuario in usuarios.list()){
            lista <<[id:usuario.id,value:usuario.nombreCompleto]
        }
        log.debug("Lista: $lista")
        log.debug("ListaJSON: ${lista as JSON}")
        render lista as JSON
    }
    def buscaUsuariosPacientes(){
        log.debug "Busca Usuarios ${params}"
        def filtro="%${params.term}%"        
        def usuarios=Usuario.buscarNombreCompleto(filtro,null)        
        log.debug "Usuarios --> ${usuarios.list()}"
        def lista=[]
        for(usuario in usuarios.list()){
            lista <<[id:usuario.id,value:usuario.nombreCompleto]
        }
        log.debug("Lista: $lista")
        log.debug("ListaJSON: ${lista as JSON}")
        render lista as JSON
    }
}
