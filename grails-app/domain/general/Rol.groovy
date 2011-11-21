package general

class Rol {

    String authority
    String nombre

    static mapping = {
        cache true
    }

    static constraints = {
        authority blank: false, unique: true
    }
        
    String toString(){
        return nombre
    }
}
