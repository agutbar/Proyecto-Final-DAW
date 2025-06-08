package com.proyectofinal.OrtoLiberi.controladores.registrado;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.proyectofinal.OrtoLiberi.entidades.elementos.Cita;
import com.proyectofinal.OrtoLiberi.entidades.elementos.Revision;
import com.proyectofinal.OrtoLiberi.entidades.personas.Cliente;
import com.proyectofinal.OrtoLiberi.repositorios.elementos.RepositorioCita;
import com.proyectofinal.OrtoLiberi.repositorios.elementos.RepositorioRevision;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/revision")
public class Revisiones {
	
	private static final String EDITAR = "registrado/formulario-edicion/editar-revision";
	private static final String VER_DETALLES = "registrado/ver-elementos/ver-revision";
	
	@Autowired
	private RepositorioRevision repositorioRevision;
	private RepositorioCita repositorioCita;
	
	@GetMapping("/ver{id}") 
	public String mostrarDetallesRevision(HttpSession session, @PathVariable Long id) { 
		System.out.println("¡El controlador ha recibido la solicitud para ver la cita!");
		Cliente usuario = (Cliente) session.getAttribute("usuario");
		Revision revision = repositorioRevision.findByid(id);
		session.setAttribute("usuario", usuario);
		session.setAttribute("revision", revision);
		return VER_DETALLES; // Redirige a editar-cita.jsp en la carpeta formulario-edicion dentro de la carpeta registrado 
	}
	
	@GetMapping("/editar{id}") 
	public String mostrarEdicionRevision(HttpSession session, @PathVariable Long id) { 
		System.out.println("¡El controlador ha recibido la solicitud para editar la cita!");
		Cliente usuario = (Cliente) session.getAttribute("usuario");
		Revision revision = repositorioRevision.findByid(id);
		session.setAttribute("usuario", usuario);
		session.setAttribute("revision", revision);
		return EDITAR; // Redirige a editar-cita.jsp en la carpeta formulario-edicion dentro de la carpeta registrado 
	}
	
	@PostMapping("/cancelar/{id}") 
	public String cancelarRevision(HttpSession session, @PathVariable Long id) { 
		Cliente usuario = (Cliente) session.getAttribute("usuario");
		Revision revision = repositorioRevision.findByid(id);
		Cita cita = revision.getCita();
		usuario.getCitas().remove(revision);
		repositorioRevision.delete(revision);
		cita.setEstado("libre");
		repositorioCita.save(cita);
		session.setAttribute("usuario", usuario);
		return "registrado/citas"; // Redirige a editar-cita.jsp en la carpeta registrado 
	}
	
	

}
