package pontosoft

class Colaborador {
    
    String cpf
    String nome
    String email
    String tipoColab
    
    static hasMany = [registros: RegistroPonto]
    
    static constraints = {
        cpf nullable:false, blank:false, unique:true
        nome nullable:false
        email nullable:false, blank:false, email:true
        tipoColab nullable:false, blank:false, inList: ['CLT','Estagiário']
        
    }
}
