package org.hospital
import general.*
class Especialidad {
    String nombre    
    static belongsTo=[doctor:Usuario]
    
    static constraints = {
    }
}
