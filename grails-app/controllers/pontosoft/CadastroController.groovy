package pontosoft

import grails.gorm.transactions.Transactional

class CadastroController {

    def index() {
    
    }
    
    @Transactional
    def salvar() {
        def colaborador = new Colaborador()
        
        colaborador.nome = params.nome
        colaborador.cpf = params.cpf
        colaborador.email = params.email
        colaborador.tipoColab = params.tipoColab
        
        if (colaborador.save(flush: true)) {
            flash.sucesso = "Colaborador cadastrado com sucesso!"
            redirect(action: "index")
        } else {
            flash.erro = "Erro ao cadastrar colaborador."
            render(view: "index", model: [colaborador: colaborador])
        }
    }
    
}
