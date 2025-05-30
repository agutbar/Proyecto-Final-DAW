package com.proyectofinal.OrtoLiberi.controladores.general;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/general")
public class CGRedireccion {

	
	  private static final String VISTA_INICIAL = "/"; 
	  private static final String VISTA_INFORMACION = "general/informacion"; 
	  private static final String VISTA_TIENDA = "general/tienda/tienda";
	  private static final String VISTA_PERSONAL_NUEVA = "general/registro"; 
	  private static final String VISTA_PERSONAL_CLIENTE = "general/acceso"; 
	  private static final String VISTA_TRABAJO = "general/trabajo"; 
	  private static final String VISTA_ACCESO_TRABAJADORES = "general/trabajadores";
	  
	  @GetMapping("/trabajo") 
	  public String mostrarTrabajo() { 
		  System.out.println("¡El controlador ha recibido la solicitud para trabajo!");
		  return VISTA_TRABAJO; // Redirige a trabajo.jsp en la carpeta general 
	  }
	  
	  @GetMapping("/tienda") 
	  public String mostrarTienda() { 
		  System.out.println("¡El controlador ha recibido la solicitud para tienda!");
		  return VISTA_TIENDA; // Redirige a tienda.jsp en la carpeta general 
	  }
	  
	  @GetMapping("/") 
	  public String mostrarMenu() { 
		  System.out.println("¡El controlador ha recibido la solicitud para el menu!");
		  return VISTA_INICIAL; // Redirige al index.html 
	  }
	  
	  @GetMapping("/nosotros") 
	  public String mostrarInformacion() { 
		  System.out.println("¡El controlador ha recibido la solicitud para informacion sobre nosotros!");
		  return VISTA_INFORMACION; // Redirige a informacion.jsp en la carpeta general 
	  }
	  
	  @GetMapping("/acceso") 
	  public String mostrarInicioSesion() { 
		  System.out.println("¡El controlador ha recibido la solicitud para acceso!");
		  return VISTA_PERSONAL_CLIENTE; // Redirige a acceso.jsp en la carpeta general 
	  }
	  
	  @GetMapping("/registro") 
	  public String mostrarNuevoRegistro() { 
		  System.out.println("¡El controlador ha recibido la solicitud para registro!");
		  return VISTA_PERSONAL_NUEVA; // Redirige a registro.jsp en la carpeta general 
	  }
	  
	  @GetMapping("/trabajadores") 
	  public String mostrarRegistroTrabajadores() { 
		  System.out.println("¡El controlador ha recibido la solicitud para el acceso de los trabajadores!");
		  return VISTA_ACCESO_TRABAJADORES; // Redirige a trabajadores.jsp en la carpeta general 
	  }

}
