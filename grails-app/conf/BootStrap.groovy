import general.*
import org.hospital.*
import hospital.commons.Constantes
class BootStrap {
    

    def init = { servletContext ->
        log.info 'iniciando la aplicacion'
        log.info 'Checando Roles'
        def rolAdmin=general.Rol.findByAuthority('ROLE_ADMIN')
        def rolDoctor=general.Rol.findByAuthority('ROLE_DOCTOR')
        def rolAsistente=general.Rol.findByAuthority('ROLE_ASISTENTE')
        def rolPaciente=general.Rol.findByAuthority('ROLE_PACIENTE')
        if(!rolAdmin){ 
            rolAdmin=new general.Rol(authority:'ROLE_ADMIN',nombre:Constantes.NOMBRE_ROL_ADMIN).save()       
        }
        if(!rolDoctor){ 
            rolDoctor=new general.Rol(authority:'ROLE_DOCTOR',nombre:Constantes.NOMBRE_ROL_DOCTOR).save()
        }
        if(!rolAsistente){ 
            rolAsistente=new general.Rol(authority:'ROLE_ASISTENTE',nombre:Constantes.NOMBRE_ROL_ASISTENTE).save()
        }
        if(!rolPaciente){ 
            rolPaciente=new general.Rol(authority:'ROLE_PACIENTE',nombre:Constantes.NOMBRE_ROL_USUARIO).save() 
        }
        
        log.info 'checando usuarios'
        def usuarioAdmin=Usuario.findByUsername("Admin")
        if(!usuarioAdmin){ 
            usuarioAdmin=new Usuario(
                username:"admin",
                password:"admin",
                nombre:"admin",
                apellidoPaterno:"admin",
                apellidoMaterno:"admin",
                telefono:"1234567890",
                telefonoCelular:"1234567890",
                email:"admin@hospital.com",
                tipoUsuario:Constantes.ADMIN
            ).save()
            UsuarioRol.create(usuarioAdmin,rolAdmin)
        }
        def usuarioDoctor=Usuario.findByUsername("Doctor")
        if(!usuarioDoctor){ 
            usuarioDoctor=new Usuario(
                username:"doctor",
                password:"doctor",
                nombre:"doctor",
                apellidoPaterno:"doctor",
                apellidoMaterno:"doctor",
                telefono:"1234567890",
                telefonoCelular:"1234567890",
                email:"doctor@hospital.com",
                tipoUsuario:Constantes.DOCTOR
            ).save()
            UsuarioRol.create(usuarioDoctor,rolDoctor)
        }  
        
        def usuarioAsistente=Usuario.findByUsername("Asistente")
        if(!usuarioAsistente){ 
            usuarioAsistente=new Usuario(
                username:"asistente",
                password:"asistente",
                nombre:"asistente",
                apellidoPaterno:"asistente",
                apellidoMaterno:"asistente",
                telefono:"1234567890",
                telefonoCelular:"1234567890",
                email:"asistente@hospital.com",
                tipoUsuario:Constantes.ASISTENTE
            ).save()
            UsuarioRol.create(usuarioAsistente,rolAsistente)
        }  
        def usuarioPaciente=Usuario.findByUsername("Cliente")
        if(!usuarioPaciente){ 
            usuarioPaciente=new Usuario(
                username:"paciente",
                password:"paciente",
                nombre:"paciente",
                apellidoPaterno:"paciente",
                apellidoMaterno:"paciente",
                telefono:"1234567890",
                telefonoCelular:"1234567890",
                email:"paciente@hospital.com",
                tipoUsuario:Constantes.USUARIO
            ).save()
            UsuarioRol.create(usuarioPaciente,rolPaciente)
        }
        
        
        def especialidad1 = new Especialidad(
            nombre:"Hematologia"
        ).save()
          
        def especialidad2 = new Especialidad(
            nombre:"Neurologia"
        ).save()
           
           
        def especialidad3 = new Especialidad(
            nombre:"Obstetricia"
        ).save()
            
        def relacion=new DoctorEspecialidad(
            doctor:usuarioDoctor,
            especialidad:especialidad1
        ).save()
        def relacion2=new DoctorEspecialidad(
            doctor:usuarioDoctor,
            especialidad:especialidad2
        ).save()
        
        Calendar calendario=Calendar.getInstance()
        
        calendario.set(1000,0,1,9,0,0)
        def fecha=calendario.getTime()
        calendario.set(1000,0,1,10,0,0)
        def fecha2=calendario.getTime()
        
        if(Horario.count()!=8){
            def horario=Horario.get(1)
            if(!horario){
                horario=new Horario(
                    horaInicial:fecha,
                    horaFinal:fecha2
                ).save()
            }
            
            calendario.set(1000,0,1,10,1,0)
            fecha=calendario.getTime()
            calendario.set(1000,0,1,11,0,0)
            fecha2=calendario.getTime()
            
            def horario2=Horario.get(2)
            if(!horario2){
                horario2=new Horario(
                    horaInicial:fecha,
                    horaFinal:fecha2
                ).save()
            }
            calendario.set(1000,0,1,11,1,0)
            fecha=calendario.getTime()
            calendario.set(1000,0,1,12,0,0)
            fecha2=calendario.getTime()            
            
            def horario3=Horario.get(3)
            if(!horario3){
                horario3=new Horario(
                    horaInicial:fecha,
                    horaFinal:fecha2
                ).save()
            }
            
            calendario.set(1000,0,1,12,1,0)
            fecha=calendario.getTime()
            calendario.set(1000,0,1,13,0,0)
            fecha2=calendario.getTime()            
            
            
            def horario4=Horario.get(4)
            if(!horario4){
                horario4=new Horario(
                    horaInicial:fecha,
                    horaFinal:fecha2
                ).save()
            }
            
            calendario.set(1000,0,1,14,0,0)
            fecha=calendario.getTime()
            calendario.set(1000,0,1,15,0,0)
            fecha2=calendario.getTime()            
            
            def horario5=Horario.get(5)
            if(!horario5){
                horario5=new Horario(
                    horaInicial:fecha,
                    horaFinal:fecha2
                ).save()
            }
            
            calendario.set(1000,0,1,15,1,0)
            fecha=calendario.getTime()
            calendario.set(1000,0,1,16,0,0)
            fecha2=calendario.getTime()            
            
            def horario6=Horario.get(6)
            if(!horario6){
                horario6=new Horario(
                    horaInicial:fecha,
                    horaFinal:fecha2
                ).save()
            }
            
            calendario.set(1000,0,1,16,1,0)
            fecha=calendario.getTime()
            calendario.set(1000,0,1,17,0,0)
            fecha2=calendario.getTime()            
                        
            def horario7=Horario.get(7)
            if(!horario7){
                horario7=new Horario(
                    horaInicial:fecha,
                    horaFinal:fecha2
                ).save()
            }
            
            calendario.set(1000,0,1,17,1,0)
            fecha=calendario.getTime()
            calendario.set(1000,0,1,18,0,0)
            fecha2=calendario.getTime()            
            
            def horario8=Horario.get(8)
            if(!horario8){
                horario8=new Horario(
                    horaInicial:fecha,
                    horaFinal:fecha2
                ).save()
            }
            log.info "Finalizando..."
            
        }
        
    }
    
    
    def destroy = {
    }
}

