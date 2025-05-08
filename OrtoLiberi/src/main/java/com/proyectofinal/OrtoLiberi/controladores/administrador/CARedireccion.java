package com.proyectofinal.OrtoLiberi.controladores.administrador;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("/administrador")
public class CARedireccion{

	 private static final String VISTA_INICIAL = "administrador/administracion";
	 private static final String VISTA_ALMACEN = "administrador/almacen";
	 private static final String VISTA_PEDIDOS = "administrador/pedidos";
	 private static final String VISTA_TALLER = "administrador/taller";
	 private static final String VISTA_LISTADO = "administrador/listado";
	 private static final String VISTA_VOLVER = "redirect:/";
	 
	 @GetMapping("/inicio") 
	  public String mostrarInicioAdministracion() { 
		  System.out.println("¡El controlador ha recibido la solicitud para el inicio de administracion!");
		  return VISTA_INICIAL; // Redirige a administracion.jsp en la carpeta administrador
	 }
	 
	 @GetMapping("/almacen") 
	  public String mostrarAlmacen() { 
		  System.out.println("¡El controlador ha recibido la solicitud para el almacen!");
		  return VISTA_ALMACEN; // Redirige a almacen.jsp en la carpeta administrador
	 }
	 
	 @GetMapping("/pedidos") 
	  public String mostrarPedidos() { 
		  System.out.println("¡El controlador ha recibido la solicitud para el listado de pedidos!");
		  return VISTA_PEDIDOS; // Redirige a pedidos.jsp en la carpeta administrador
	 }
	 
	 @GetMapping("/taller") 
	  public String mostrarTaller() { 
		  System.out.println("¡El controlador ha recibido la solicitud para el listado del taller!");
		  return VISTA_TALLER; // Redirige a taller.jsp en la carpeta administrador
	 }
	 
	 @GetMapping("/listado") 
	  public String mostrarListados() { 
		  System.out.println("¡El controlador ha recibido la solicitud para el listado de personas relacionadas con la empresa!");
		  return VISTA_LISTADO; // Redirige a listado.jsp en la carpeta administrador
	 }
	 
	 @GetMapping("/salir") 
	 public String cerrarSesion(HttpServletRequest request, HttpServletResponse response) { 
		 System.out.println("¡El controlador ha recibido la solicitud para cerrar sesion y volver al inicio!");
		 request.getSession().invalidate(); // Invalida la sesión HTTP
		 return VISTA_VOLVER; // Redirige al index.html 
	 }

}
