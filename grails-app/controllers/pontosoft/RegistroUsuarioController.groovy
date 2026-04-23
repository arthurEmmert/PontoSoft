package pontosoft

import grails.gorm.transactions.Transactional

class RegistroUsuarioController {

    def index() {
    }

    @Transactional
    def salvar() {
        if (!params.nomeUsuario?.trim()) {
            flash.erro = "Informe o nome de login."
            render view: "index", model: [registroUsuario: params]
            return
        }

        if (!params.senha) {
            flash.erro = "Informe a senha."
            render view: "index", model: [registroUsuario: params]
            return
        }

        if (params.senha != params.confirmarSenha) {
            flash.erro = "A confirmação de senha não confere."
            render view: "index", model: [registroUsuario: params]
            return
        }

        if (Usuario.findByLogin(params.nomeUsuario)) {
            flash.erro = "Esse nome de login ja existe."
            render view: "index", model: [registroUsuario: params]
            return
        }

        def usuario = new Usuario(
                login: params.nomeUsuario,
                senha: Usuario.md5(params.senha)
        )

        if (!usuario.save(flush: true)) {
            flash.erro = "Erro ao criar o usuário."
            render view: "index", model: [registroUsuario: params, usuario: usuario]
            return
        }

        def registroUsuario = new RegistroUsuario(
                nomeUsuario: params.nomeUsuario,
                senha: params.senha,
                usuario: usuario
        )

        if (!registroUsuario.save(flush: true)) {
            transactionStatus.setRollbackOnly()
            flash.erro = "Erro ao registrar o usuário."
            render view: "index", model: [registroUsuario: params]
            return
        }

        flash.sucesso = "Usuário criado com sucesso. Faça o login."
        redirect controller: "auth", action: "index"
    }
}
