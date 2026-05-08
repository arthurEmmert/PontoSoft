package pontosoft

import java.security.MessageDigest

class Usuario {

    String login
    String senha

    static constraints = {
        login nullable: false, blank: false, maxSize: 16
        senha nullable: false, blank: false, maxSize: 312
    }
    
    static String md5(String texto) {
        
        if (!texto) {
            return null
        }
        
        MessageDigest.getInstance("MD5")
                .digest(texto.bytes)
                .encodeHex()
                .toString()
    }
}
