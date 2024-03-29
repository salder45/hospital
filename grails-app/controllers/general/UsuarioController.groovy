package general

import org.springframework.dao.DataIntegrityViolationException
import grails.plugins.springsecurity.Secured
import hospital.commons.Constantes
import grails.converters.JSON
import org.hospital.*
import java.text.*
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
        
        try {
            sendMail {
            to     "${usuario.email}" 
            subject "Collab-todo Registration Confirmation" 
            html    g.render(template:'/email/registrationConfirmation', model:[usuario:usuario])
            }
            flash.message = "Confirmation email sent to ${usuario.email}"
            } catch(Exception e) {
            log.error "Problem sending email $e.message" , e
            flash.message = "Confirmation email NOT sent" 
            }
       
        //flash.message = message(code: 'default.created.message', args: [message(code: 'usuario.label', default: 'Usuario'), usuario.id])
        redirect(action: "ver", id: usuario.id)
    }

    def ver() {
        log.debug "Ver Usuario $params"
        def usuario;
        if(params?.usuario?.id!=null){
            usuario=Usuario.get(params.usuario.id)
        }else{            
            usuario = Usuario.get(params.id)
        }
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
    
    def buscarUsuario(){
        log.debug "Busca Usuarios ${params}"        
    }
    def buscarDoctor(){
        log.debug "Busca Doctor ${params}"        
    }
    
    def agregarEspecialidad(){
        log.debug "agregar Especialidad ${params}"     
        def doctor=Usuario.get(params.id)
        [doctor:doctor]
    }
    
    def guardarEspecialidad(){
        log.debug "Especialidad Usuarios ${params}"
        def doctor=Usuario.get(params.doctor)
        def especialidad=Especialidad.get(params.especialidad.id)
        log.debug "Especialidad ${doctor} Usuarios ${especialidad}"
        def relacion=new DoctorEspecialidad(doctor:doctor,especialidad:especialidad).save()
        
        redirect(action:'ver',id:doctor.id)
    }
    
    
    def testDate(){
        log.debug "testDate"
        Calendar calendario=GregorianCalendar.getInstance()
        log.debug "Calendario : ${calendario}"
        calendario.set(1000,0,1,12,0,0)
        SimpleDateFormat sdf=new SimpleDateFormat('HH:mm')
        log.debug "Calendario : ${calendario}"
        Date fecha=calendario.getTime()
        log.debug "Fecha: ${fecha}"
        log.debug "Fecha Formato: ${sdf.format(fecha)}"
        
    }
}
