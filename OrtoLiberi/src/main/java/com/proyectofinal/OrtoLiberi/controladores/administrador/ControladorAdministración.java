package com.proyectofinal.OrtoLiberi.controladores.administrador;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/administrador")
public class ControladorAdministración{

	 private static final String VISTA_INICIAL = "administrador/administracion";
	 private static final String VISTA_ALMACEN = "administrador/almacen";
	 private static final String VISTA_PEDIDOS = "administrador/pedidos";
	 private static final String VISTA_TALLER = "administrador/taller";
	 private static final String VISTA_LISTADO = "administrador/listado";
	 private static final String VISTA_VOLVER = "/";

}
