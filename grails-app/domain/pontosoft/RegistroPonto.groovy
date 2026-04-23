package pontosoft

import java.time.LocalDateTime

class RegistroPonto {

    LocalDateTime entrada
    LocalDateTime saida

    static belongsTo = [colaborador:Colaborador]
    
    static constraints = {
        colaborador nullable: false
        entrada nullable: false
        saida nullable: true, validator: {saida, registro ->
            return registro.saidaValida()
        }
    }
    
    boolean saidaValida() {
        if (saida == null) {
            return true
        }
        return !saida.isBefore(entrada)
    }
}
