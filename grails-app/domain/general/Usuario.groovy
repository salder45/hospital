package general
import org.hospital.*
class Usuario {

    transient springSecurityService

    String username
    String password
    String nombre
    String apellidoPaterno
    String apellidoMaterno
    String telefono
    String telefonoCelular
    String email
    boolean enabled=true
    boolean accountExpired
    boolean accountLocked
    boolean passwordExpired
    // Truena por referencia bidireccional
    Usuario doctorAlQueAsiste
    String tipoUsuario;
    
    static hasMany=[citasPaciente:Cita,citasDoctor:Cita,especialidades:DoctorEspecialidad]
    static mappedBy=[citasDoctor:'doctor',citasPaciente:'paciente']
    static transients = ['rol']
    static constraints = {
       
        username blank: false, unique: true
        password blank: false,password:true
        nombre blank:false,maxSize:40,matches:"[a-zA-z]+"
        apellidoPaterno blank:false,maxSize:60,matches:"[a-zA-z]+"
        apellidoMaterno blank:true,maxSize:60,matches:"[a-zA-z]+"
        telefono blank:true,matches:"[0-9]+",maxSize:14,minSize:10
        telefonoCelular blank:true,matches:"[0-9]+",maxSize:16,minSize:10
        email email:true,blank:true
    }
    
    Rol getRol(){
        log.debug " ${getAuthorities().toList().get(0)}"        
        return getAuthorities().toList().get(0)
    }

    static mapping = {
        password column: '`password`'
        doctorAlQueAsiste column:'doctor_asiste_id'
    }

    Set<Rol> getAuthorities() {
        UsuarioRol.findAllByUsuario(this).collect { it.rol } as Set
    }

    def beforeInsert() {
        encodePassword()
    }

    def beforeUpdate() {
        if (isDirty('password')) {
            encodePassword()
        }
    }

    protected void encodePassword() {
        password = springSecurityService.encodePassword(password)
    }
    
    String getNombreCompleto(){
        return nombre+" "+apellidoPaterno+" "+apellidoMaterno
    }
    
    static namedQueries={
        buscarNombreCompleto{ String filtro,String tipo ->
            if(tipo!=null&&!tipo.trim().equals("")){
            eq "tipoUsuario",tipo                
            }
            like "nombre",filtro
            like "apellidoPaterno",filtro
            like "apellidoMaterno",filtro
        }
    }
      String toString(){
        return getNombreCompleto()
    }
}
