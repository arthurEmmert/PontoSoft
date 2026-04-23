package pontosoft

import grails.gorm.transactions.Transactional
import java.time.LocalDateTime

@Transactional
class RegistroPontoController {
    
    def index() {
        [registros: RegistroPonto.list(sort:"entrada", order:"desc")]
    }
    
    def create() {
        [colaboradores: Colaborador.list(sort: "nome")]
    }
    
    def excluir() {
        def registro = RegistroPonto.get(params.long("id"))
        
        if (registro) {
            registro.delete(flush:true)
            flash.sucesso = "Registro excluido com sucesso."
        } else {
            falsh.erro = "Registro não encontrado."
        }
        redirect(action: "index")
    }
    
    def salvar() {
       def colaborador = Colaborador.get(params.long("colaboradorId"))
        
       if (!params.entrada) {
           flash.erro = "Informe a entrada."
           redirect(action:"index")
           return
       }
        
        def registroPonto = new RegistroPonto(
                colaborador:colaborador,
                entrada: LocalDateTime.parse(params.entrada),
                saida: params.saida ? LocalDateTime.parse(params.saida) : null
        )
        
        if (registroPonto.save(flush:true)) {
            flash.sucesso = "Ponto cadastrado com sucesso."
            redirect(action: "index")
        } else {
            flash.erro = "Erro ao cadastrar ponto."
            redirect(action:"create")
        }
    }

}
