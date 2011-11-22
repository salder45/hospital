package org.hospital
import general.*
class Especialidad {
    String nombre    
    static belongsTo=[doctor:Usuario]
    
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


