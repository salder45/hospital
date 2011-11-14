import general.*
class BootStrap {
    

    def init = { servletContext ->
        log.info 'iniciando la aplicacion'
        log.info 'Checando Roles'
        def rolAdmin=general.Rol.findByAuthority('ROLE_ADMIN')
        def rolDoctor=general.Rol.findByAuthority('ROLE_DOCTOR')
        def rolAsistente=general.Rol.findByAuthority('ROLE_ASISTENTE')
        def rolPaciente=general.Rol.findByAuthority('ROLE_PACIENTE')
        if(!rolAdmin){ 
            rolAdmin=new general.Rol(authority:'ROLE_ADMIN').save()       
        }
        if(!rolDoctor){ 
            rolDoctor=new general.Rol(authority:'ROLE_DOCTOR').save()
        }
        if(!rolAsistente){ 
            rolAsistente=new general.Rol(authority:'ROLE_ASISTENTE').save()
        }
        if(!rolPaciente){ 
            rolPaciente=new general.Rol(authority:'ROLE_PACIENTE').save() 
        }
        
        log.info 'checando usuarios'
        def usuarioAdmin=Usuario.findByUsername("Admin")
        if(!usuarioAdmin){ 
            usuarioAdmin=new Usuario(
            username:"admin",
            password:"admin"
            ).save()
            UsuarioRol.create(usuarioAdmin,rolAdmin)
        }
   def usuarioDoctor=Usuario.findByUsername("Doctor")
        if(!usuarioDoctor){ 
            usuarioDoctor=new Usuario(
            username:"doctor",
            password:"doctor"
            ).save()
            UsuarioRol.create(usuarioDoctor,rolDoctor)
        }  
        
   def usuarioAsistente=Usuario.findByUsername("Asistente")
        if(!usuarioAsistente){ 
            usuarioAsistente=new Usuario(
            username:"asistente",
            password:"asistente"
            ).save()
            UsuarioRol.create(usuarioAsistente,rolAsistente)
        }  
           def usuarioPaciente=Usuario.findByUsername("Cliente")
        if(!usuarioPaciente){ 
            usuarioPaciente=new Usuario(
            username:"paciente",
            password:"paciente"
            ).save()
            UsuarioRol.create(usuarioPaciente,rolPaciente)
        }  
        
    }
    
    
    def destroy = {
    }
}

