package org.hospital
import general.*
class Cita {
    String status
    //Como poner la fecha? poner fechaInicial y fechaFinal?
    Date dateCreated
    Date dateUpdated
    
    static belongsTo=[doctor:Usuario,paciente:Usuario,userCreated:Usuario]
    static constraints = {
    }
}
