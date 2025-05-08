package com.proyectofinal.OrtoLiberi.controladores.registrado;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("/registrado")
public class CRRedireccion {
	
	private static final String VISTA_INICIAL = "registrado/perfil";
	private static final String VISTA_COMPRAS = "registrado/compras";
	private static final String VISTA_CITAS = "registrado/citas";
	private static final String VISTA_DATOS = "registrado/datos";
	private static final String VISTA_VOLVER = "redirect:/";
	
	@GetMapping("/inicio") 
	public String mostrarInicioRegistrado() { 
		System.out.println("¡El controlador ha recibido la solicitud para el menú de usuario registrado!");
		return VISTA_INICIAL; // Redirige a perfil.jsp en la carpeta registrado 
	}
	
	@GetMapping("/compras") 
	public String mostrarCompras() { 
		System.out.println("¡El controlador ha recibido la solicitud para el listado de compras!");
		return VISTA_COMPRAS; // Redirige a compras.jsp en la carpeta registrado 
	}
	
	@GetMapping("/citas") 
	public String mostrarCitas() { 
		System.out.println("¡El controlador ha recibido la solicitud para el listados de citas!");
		return VISTA_CITAS; // Redirige a citas.jsp en la carpeta registrado 
	}
	
	@GetMapping("/datos") 
	public String mostrarDatos() { 
		System.out.println("¡El controlador ha recibido la solicitud para los datos personales!");
		return VISTA_DATOS; // Redirige a datos.jsp en la carpeta registrado 
	}
	
	@GetMapping("/salir") 
	public String cerrarSesion(HttpServletRequest request, HttpServletResponse response) { 
		System.out.println("¡El controlador ha recibido la solicitud para cerrar sesion y volver al inicio!");	
	    request.getSession().invalidate(); // Invalida la sesión HTTP
		return VISTA_VOLVER; // Redirige al index.html 
	}

}
