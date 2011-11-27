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
                                  
}


