package com.proyectofinal.OrtoLiberi.controladores.registrado;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.proyectofinal.OrtoLiberi.entidades.personas.Hijo;
import com.proyectofinal.OrtoLiberi.repositorios.personas.RepositorioHijo;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/ver-hijo")
public class VerHijo {
	
	private static final String VISTA_HIJO = "registrado/ficha-menor";
	
	@Autowired
	private RepositorioHijo repositorioHijo;
	
	@GetMapping("/{id}") 
	public String mostrarFichaMenor(HttpSession session, @PathVariable Long id) { 
		System.out.println("¡El controlador ha recibido la solicitud para los datos del menor!");
		Hijo menorElegido = repositorioHijo.findByid(id);
		session.setAttribute("hijo", menorElegido);
		return VISTA_HIJO; // Redirige a ficha-menor.jsp en la carpeta registrado 
	}

}
