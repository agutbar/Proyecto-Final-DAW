package com.proyectofinal.OrtoLiberi.controladores.registrado;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/registrado")
public class ControladorRegistrado {
	
	private static final String VISTA_INICIAL = "registrado/perfil";
	private static final String VISTA_COMPRAS = "registrado/compras";
	private static final String VISTA_CITAS = "registrado/citas";
	private static final String VISTA_DATOS = "registrado/datos";
	private static final String VISTA_VOLVER = "index.html";

}
