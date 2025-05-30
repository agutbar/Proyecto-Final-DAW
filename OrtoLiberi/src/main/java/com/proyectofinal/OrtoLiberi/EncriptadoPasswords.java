package com.proyectofinal.OrtoLiberi;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class EncriptadoPasswords {
	private static final BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

    public static String cifrarPassword(String contraseña) {
        return encoder.encode(contraseña);
    }
    
    public static boolean verificarContraseña(String contraseña, String hashAlmacenado) {
        return encoder.matches(contraseña, hashAlmacenado);
    }
}
