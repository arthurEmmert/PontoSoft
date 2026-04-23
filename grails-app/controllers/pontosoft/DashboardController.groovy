package pontosoft

import org.grails.core.artefact.ControllerArtefactHandler

class DashboardController {

    def index() {
        def controllers = grailsApplication
                .getArtefacts(ControllerArtefactHandler.TYPE)
                .findAll {
                    !['auth', 'dashboard', 'registroUsuario'].contains(it.logicalPropertyName)
                }
                .collect { it.logicalPropertyName }

        [controllers: controllers]
    }
}
