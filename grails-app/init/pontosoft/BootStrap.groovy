package pontosoft

class BootStrap {
    def init = { servletContext ->
        if (!Usuario.findByLogin("admin")) {
            new Usuario(
                    login: "admin",
                    senha: Usuario.md5("admin")
            ).save(failOnError: true)
        }

        if (!Colaborador.count()) {
            new Colaborador(cpf: "111.111.111-11", nome: "João Silva",       email: "joao@empresa.com",  tipoColab: "CLT").save(failOnError: true)
            new Colaborador(cpf: "222.222.222-22", nome: "Maria Souza",      email: "maria@empresa.com", tipoColab: "CLT").save(failOnError: true)
            new Colaborador(cpf: "333.333.333-33", nome: "Carlos Estagiário", email: "carlos@empresa.com", tipoColab: "Estagiário").save(failOnError: true)
            new Colaborador(cpf: "123", nome: "Arthur", email: "arthur@gmail.com", tipoColab: "Estagiário").save(failOnError: true)
        }
    }
}