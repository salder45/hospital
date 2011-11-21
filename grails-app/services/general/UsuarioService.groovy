package general
import hospital.commons.Constantes
class UsuarioService {

    def serviceMethod() {

    }
    
    boolean  checaRoles(Usuario editor,Usuario editable){
        boolean debeEditar=false
        //log.debug "Checa Roles "
        //log.debug "Logeado ${editor.username} Editable ${editable.username}"
        if((editor.rol.nombre.equals(Constantes.NOMBRE_ROL_ASISTENTE))||(editor.rol.nombre.equals(Constantes.NOMBRE_ROL_DOCTOR))||(editor.rol.nombre.equals(Constantes.NOMBRE_ROL_ADMIN))){
            debeEditar=true
        }else if(editor.id==editable.id){
            //log.debug "Usuario quiere editarse"
            debeEditar=true
        }
        
        return debeEditar
    }
    
    List<Rol> getListaValida(Rol role){
        List<Rol> lista=new ArrayList();
        if(role.nombre.equals(Constantes.NOMBRE_ROL_ADMIN)){
            lista.add(Rol.get(2))            
            lista.add(Rol.get(3))
            lista.add(Rol.get(4))
        }else if(role.nombre.equals(Constantes.NOMBRE_ROL_DOCTOR)){
            lista.add(Rol.get(3))
            lista.add(Rol.get(4))
        }else{
            lista.add(Rol.get(4))
        }
        return lista
    }
}
