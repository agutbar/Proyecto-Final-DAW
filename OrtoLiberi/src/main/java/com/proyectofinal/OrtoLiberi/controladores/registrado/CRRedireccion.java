package com.proyectofinal.OrtoLiberi.controladores.registrado;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.proyectofinal.OrtoLiberi.entidades.elementos.Revision;
import com.proyectofinal.OrtoLiberi.entidades.personas.Cliente;
import com.proyectofinal.OrtoLiberi.entidades.personas.Hijo;
import com.proyectofinal.OrtoLiberi.entidades.procesos.Compra;
import com.proyectofinal.OrtoLiberi.repositorios.personas.RepositorioHijo;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/registrado")
public class CRRedireccion {
	
	private static final String VISTA_INICIAL = "registrado/perfil";
	private static final String VISTA_COMPRAS = "registrado/compras";
	private static final String VISTA_CITAS = "registrado/citas";
	private static final String VISTA_DATOS = "registrado/datos";
	private static final String VISTA_HIJO = "registrado/ficha-menor";
	private static final String REGISTRAR_NUEVO_HIJO = "registrado/formulario-creacion/nuevo-hijo";
	private static final String PEDIR_NUEVA_REVISION = "registrado/formulario-creacion/nueva-revision";
	private static final String EDITAR_DATOS = "registrado/formulario-edicion/edicion-datos";
	private static final String EDITAR_HIJO = "registrado/formulario-edicion/edicion-hijo";
	private static final String VISTA_VOLVER = "redirect:/";
	
	@Autowired
	private RepositorioHijo repositorioHijo;
	
	@GetMapping("/inicio") 
	public String mostrarInicioRegistrado(HttpSession session) { 
		System.out.println("¡El controlador ha recibido la solicitud para el menú de usuario registrado!");
		Cliente usuario = (Cliente) session.getAttribute("usuario");
		LocalDate hoy = LocalDate.now();
		List <Revision> citas = usuario.getCitas();
		List <Revision> listado_citas = null;
		for (Revision cita : citas) {
			if (cita.getCita().getFecha().isAfter(hoy)) {
				listado_citas.add(cita);
			}
		}
		List <Compra> compras = usuario.getCompras();
		List <Hijo> menores = usuario.getMenores();
		session.setAttribute("usuario", usuario);
		session.setAttribute("listado_citas", listado_citas);
		session.setAttribute("compras", compras);
		session.setAttribute("menores", menores);
		return VISTA_INICIAL; // Redirige a perfil.jsp en la carpeta registrado 
	}
	
	@GetMapping("/compras") 
	public String mostrarCompras(HttpSession session) { 
		System.out.println("¡El controlador ha recibido la solicitud para el listado de compras!");
		Cliente usuario = (Cliente) session.getAttribute("usuario");
		session.setAttribute("usuario", usuario);
		return VISTA_COMPRAS; // Redirige a compras.jsp en la carpeta registrado 
	}
	
	@GetMapping("/citas") 
	public String mostrarCitas(HttpSession session) { 
		System.out.println("¡El controlador ha recibido la solicitud para el listados de citas!");
		Cliente usuario = (Cliente) session.getAttribute("usuario");
		LocalDate hoy = LocalDate.now();
		List <Revision> citas = usuario.getCitas();
		List <Revision> revisiones_pendientes = null, revisiones_completadas = null;
		for (Revision cita : citas) {
			if (cita.getCita().getFecha().isBefore(hoy)) {
				revisiones_completadas.add(cita);
			} else {
				revisiones_pendientes.add(cita);
			}
		}
		session.setAttribute("usuario", usuario);
		session.setAttribute("revisiones_completadas", revisiones_completadas);
		session.setAttribute("revisiones_pendientes", revisiones_pendientes);
		return VISTA_CITAS; // Redirige a citas.jsp en la carpeta registrado 
	}
	
	@GetMapping("/datos") 
	public String mostrarDatos(HttpSession session) { 
		System.out.println("¡El controlador ha recibido la solicitud para los datos personales!");
		Cliente usuario = (Cliente) session.getAttribute("usuario");
		session.setAttribute("usuario", usuario);
		return VISTA_DATOS; // Redirige a datos.jsp en la carpeta registrado 
	}
	
	@GetMapping("/nuevo-hijo") 
	public String mostrarFormularioNuevoHijo(HttpSession session) { 
		System.out.println("¡El controlador ha recibido la solicitud para el formulario de registro de un nuevo menor!");
		Cliente usuario = (Cliente) session.getAttribute("usuario");
		session.setAttribute("usuario", usuario);
		return REGISTRAR_NUEVO_HIJO; // Redirige a nuevo-hijo.jsp en la carpeta formulario-creacion dentro de la carpeta registrado 
	}
	
	@GetMapping("/ver-hijo/{id}") 
	public String mostrarFichaMenor(HttpSession session, @RequestParam Long id) { 
		System.out.println("¡El controlador ha recibido la solicitud para los datos del menor!");
		Hijo menorElegido = repositorioHijo.findByid(id);
		session.setAttribute("menor", menorElegido);
		return VISTA_HIJO; // Redirige a ficha-menor.jsp en la carpeta registrado 
	}
	
	@GetMapping("/nueva-cita") 
	public String mostrarFormularioNuevaRevision(HttpSession session) { 
		System.out.println("¡El controlador ha recibido la solicitud para el formulario de registro de una nueva cita!");
		Cliente usuario = (Cliente) session.getAttribute("usuario");
		session.setAttribute("usuario", usuario);
		return PEDIR_NUEVA_REVISION; // Redirige a nueva-revision.jsp en la carpeta formulario-creacion dentro de la carpeta registrado 
	}
	
	@GetMapping("/editar-hijo") 
	public String mostrarEditarHijo(HttpSession session) { 
		System.out.println("¡El controlador ha recibido la solicitud para editar los datos del menor!");
		Cliente usuario = (Cliente) session.getAttribute("usuario");
		session.setAttribute("usuario", usuario);
		Hijo menorElegido = (Hijo) session.getAttribute("hijo");
		session.setAttribute("hijo", menorElegido);
		return EDITAR_HIJO; //Redirige a editar-hijo.jsp en la carpeta formulario-edicion dentro de la carpeta registrado 
	}
	
	@GetMapping("/editar-datos") 
	public String mostrarEditarDatos(HttpSession session) { 
		System.out.println("¡El controlador ha recibido la solicitud para editar los datos!");
		Cliente usuario = (Cliente) session.getAttribute("usuario");
		session.setAttribute("usuario", usuario);
		return EDITAR_DATOS; // Redirige a editar-datos.jsp en la carpeta formulario-edicion dentro de la carpeta registrado 
	}
	
	@GetMapping("/salir") 
	public String cerrarSesion(HttpServletRequest request, HttpServletResponse response) { 
		System.out.println("¡El controlador ha recibido la solicitud para cerrar sesion y volver al inicio!");	
	    request.getSession().invalidate(); // Invalida la sesión HTTP
		return VISTA_VOLVER; // Redirige al index.html 
	}

}
