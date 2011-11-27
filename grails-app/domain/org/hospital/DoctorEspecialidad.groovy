package org.hospital
import general.*
class DoctorEspecialidad {
    Usuario doctor
    Especialidad especialidad
    static belongsTo=[Usuario,Especialidad]

    static constraints = {
    }
}
