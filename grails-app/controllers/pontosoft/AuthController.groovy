package pontosoft

class AuthController {
    
    def index() {
        
    }
    
    def login() {
        if (!params.login || !params.senha) {
            flash.erro = "Informe login e senha."
            redirect(action: "index")
            return
        }
        
        def senhaMD5 = Usuario.md5(params.senha)
        def usuario = Usuario.findByLoginAndSenha(params.login, senhaMD5)
        
        if (usuario) {
            session.usuarioLogado = usuario
            redirect(controller: "dashboard", action: "index")
        } else {
            flash.erro = "Login ou senha inválidos."
            redirect(action: "index")
        }
    }

    def logout() {
        session.invalidate()
        redirect(action: "index")
    }
}
