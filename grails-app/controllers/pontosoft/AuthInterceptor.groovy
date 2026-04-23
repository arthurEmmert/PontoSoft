package pontosoft

class AuthInterceptor {

    AuthInterceptor() {
        matchAll()
    }

    boolean before() {
        boolean isAuthController = controllerName == 'auth'
        boolean isRegistroUsuarioController = controllerName == 'registroUsuario'
        boolean isLogoutAction = actionName == 'logout'
        boolean autenticado = session.usuarioLogado != null

        if (!autenticado && !isAuthController && !isRegistroUsuarioController) {
            redirect controller: 'auth', action: 'index'
            return false
        }

        if (autenticado && isAuthController && !isLogoutAction) {
            redirect controller: 'dashboard', action: 'index'
            return false
        }

        return true
    }

    boolean after() { true }

    void afterView() {}
}
