package org.hospital
import general.*
class Especialidad {
    String nombre 
       
    static hasMany=[doctores:DoctorEspecialidad]
    
    static constraints = {    
    nombre(blank:false)
    }
     
     static mapping = {     
        table 'especialidad'
     }
          
     String toString() {
        return nombre
    }
    
    List<Usuario> getUsuariosDoctores(){
        log.debug "getUsuariosDoctores"
        List<Usuario> doctores=new ArrayList<Usuario>()
        def listaTmp=this.doctores
        log.debug "Relacion ${listaTmp}"
        for(doctor in listaTmp){
            doctores.add(doctor.doctor)
        }
        return doctores
    }
                                  
}


