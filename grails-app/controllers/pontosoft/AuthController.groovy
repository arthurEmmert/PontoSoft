package pontosoft

class AuthController {
    
    def index() {
        
    }
    
    def login() {
        def senhaMD5 = Usuario.md5(params.senha)
        def usuario = Usuario.findByLoginAndSenha(params.login, senhaMD5)
        
        if (usuario) {
            session.usuarioLogado = usuario.id
            redirect (controller:'dashboard', action:'index')
        } else {
            flash.erro = "Acesso Negado!!!"
            redirect action: 'index'
        }
    }

    def logout() {
        session.invalidate()
        redirect(action: "index")
    }
}
