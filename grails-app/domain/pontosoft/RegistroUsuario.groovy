package pontosoft

class RegistroUsuario {

    String nomeUsuario
    String senha
    
    static belongsTo = [usuario: Usuario]
    
    static constraints = {
        nomeUsuario nullable:false, blank:false, maxSize:16
        senha nullable:false, blank:false, maxSize:312
    }
}
