package pontosoft

import java.security.MessageDigest

class Usuario {

    String login
    String senha

    static hasOne = [registroUsuario: RegistroUsuario]

    static constraints = {
        login nullable: false, blank: false, maxSize: 16
        senha nullable: false, blank: false, maxSize: 312
        registroUsuario nullable: true
    }

    static String md5(String texto) {
        MessageDigest.getInstance("MD5")
                .digest(texto.bytes)
                .encodeHex()
                .toString()
    }
}
