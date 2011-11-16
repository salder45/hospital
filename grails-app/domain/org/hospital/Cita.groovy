package org.hospital
import general.*
class Cita {
    String status
    Date cita
    Date dateCreated
    Date lastUpdated
    
    static belongsTo=[doctor:Usuario,paciente:Usuario,userCreated:Usuario]
    
    static constraints = {
        cita blank:false
        status blank:false
    }
    
    static mapping={
        status maxSize:3
    }
}
