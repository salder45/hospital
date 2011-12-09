package org.hospital
import java.text.*
class Horario {
    Date horaInicial
    Date horaFinal

    static constraints = {
    }
    
    String toString(){
        Calendar calendario=Calendar.getInstance()
        SimpleDateFormat sdf=new SimpleDateFormat('HH:mm')
        return "${sdf.format(horaInicial)}-${sdf.format(horaFinal)}"
    }
    
}
