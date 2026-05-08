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
        
        def cpfExistente = Colaborador.findByCpf(params.cpf)
        
        if (cpfExistente) {
            flash.erro = "Já existe um colaborador cadastrado com este CPF."
            return render(view: "index", model: [
                    colaborador: params
            ])
        }
        
        if (colaborador.save(flush: true)) {
            flash.sucesso = "Colaborador cadastrado com sucesso!"
            redirect(action: "index")
            
        } else {
            flash.erro = "Erro ao cadastrar colaborador."
            render(view: "index", model: [colaborador: colaborador])
        }
    }
    
}
