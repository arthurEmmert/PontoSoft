package pontosoft

import grails.gorm.transactions.Transactional
import java.time.LocalDateTime
import java.time.format.DateTimeParseException

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
            flash.erro = "Registro não encontrado."         // bug 1 corrigido
        }
        redirect(action: "index")
    }
    
    def salvar() {
       def colaborador = Colaborador.get(params.long("colaboradorId"))

        if (!params.colaboradorId) {   //CORRIGIDO BUG 4 
            flash.erro = "Informe o colaborador."
            render(view: "create", model: [
                        colaboradores: Colaborador.list(sort:"nome")
            ])
            return
        }
      
       if (!params.entrada) {
           flash.erro = "Informe a entrada."
           render(view: "create", model: [
                   colaboradores: Colaborador.list(sort:"nome")
           ])
           return
       }
        
        if (!colaborador) {
            flash.erro = "Colaborador não encontrado."
            render(view: "create", model: [
                    colaboradores: Colaborador.list(sort:"nome")
            ])
            return
        }
        
        try {  //CORRIGIDO BUG 5 E ALTERADO PARA SÓ REDIRECIONAR PARA A VIEW INDEX APENAS SE O PONTO FOR CADASTRADO
            def entradaParse = LocalDateTime.parse(params.entrada)
            def saidaParse = params.saida ? LocalDateTime.parse(params.saida) :null
            
            def registroPonto = new RegistroPonto(
                    colaborador: colaborador,
                    entrada: entradaParse,
                    saida: saidaParse
            )

            if (registroPonto.save(flush: true)) {
                flash.sucesso = "Ponto cadastrado com sucesso."
                redirect(action: "index")
            } else {
                flash.erro = "Entrada ou Saída inválidos."
                render(view: "create", model: [
                        colaboradores: Colaorador.list(sort:"nome"),
                        registroPonto: registroPonto
                ])
            }
        } catch (DateTimeParseException e) {
            flash.erro = "Formato de data inválido."
            render(view: "create", model: [
                    colaboradores: Colaborador.list(sort: "nome")
            ])
            return
        }
    }

}
