package org.hospital

class CitaService {
    
    def listaFiltrada(Date fechaFiltro){
        log.debug "listaFiltrada"
        log.debug "fecha ${fechaFiltro}"
        Calendar calendario=Calendar.getInstance()
        calendario.setTime(fechaFiltro)
        calendario.set(Calendar.HOUR,0)
        calendario.set(Calendar.MINUTE,0)
        calendario.set(Calendar.SECOND,0)
        def fecha=calendario.getTime()
        log.debug "fechaaa!-----> ${fecha}"
        log.debug "fechaaa!-----> ${fecha.getTime()}"
        def lista=Cita.findAllByFechaCita(fecha.getTime())
        def listaHorarios=Horario.list()
        log.debug "Lista Horarios ${listaHorarios}"
        def listaFinal=[]
        for(cita in lista){
            log.debug "${cita}"
            listaHorarios.remove(cita.horario)            
        }
        log.debug "Lista Horarios ${listaHorarios}"
        return listaFinal        
    }
    
    
    def serviceMethod() {

    }
}
