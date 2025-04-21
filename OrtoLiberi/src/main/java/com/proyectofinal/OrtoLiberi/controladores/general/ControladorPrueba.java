package com.proyectofinal.OrtoLiberi.controladores.general;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ControladorPrueba {

    @GetMapping("/verificar")
    public String verificar() {
        return "El controlador está funcionando!";
    }
}
