package org.hospital
import general.*
class Cita {
    String status
    Date cita
    Long fechaCita
    Date dateCreated
    Date lastUpdated    
    
    static belongsTo=[doctor:Usuario,paciente:Usuario,userCreated:Usuario,horario:Horario]
    
    static constraints = {
        status blank:false
    }
    
    static mapping={
        status maxSize:3
    }
}
