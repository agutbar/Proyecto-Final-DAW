package com.proyectofinal.OrtoLiberi.controladores.formularios;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.proyectofinal.OrtoLiberi.entidades.personas.Cliente;
import com.proyectofinal.OrtoLiberi.entidades.personas.Hijo;
import com.proyectofinal.OrtoLiberi.entidades.personas.Trabajador;
import com.proyectofinal.OrtoLiberi.repositorios.personas.RepositorioCliente;

import jakarta.servlet.http.HttpSession;

import com.proyectofinal.OrtoLiberi.repositorios.personas.RepositorioHijo;
import com.proyectofinal.OrtoLiberi.repositorios.personas.RepositorioTrabajador;

@Controller
@RequestMapping("/edicion")
public class EditarPersonal {
	
	@Autowired
	private RepositorioHijo repositorioHijo;
	
	@Autowired
	private RepositorioCliente repositorioCliente;
	
	@Autowired
	private RepositorioTrabajador repositorioTrabajador;
	
	
	@PostMapping("/hijo")
	public String editarHijo(Model model, HttpSession session, @RequestParam Long id, @RequestParam String nombre, @RequestParam String apellidos, @RequestParam LocalDate nacimiento) {
		Cliente tutor = (Cliente) session.getAttribute("usuario");
		Hijo hijoA = repositorioHijo.findByid(id);
		Hijo hijo = new Hijo();
		hijo.setId(hijoA.getId());
		hijo.setNombre(nombre);
		hijo.setApellidos(apellidos);
		hijo.setNacimiento(nacimiento);
		hijo.setTutor(tutor);
		hijo.setEstado(hijoA.getEstado());
		repositorioHijo.delete(hijoA);
		repositorioHijo.save(hijo);
		List <Hijo> hijos = tutor.getMenores();
		hijos.remove(hijoA);
		hijos.add(hijo);
		tutor.setMenores(hijos);
		repositorioCliente.save(tutor);
		model.addAttribute("confirmacion", "Los datos han sido editados correctamente");
		session.setAttribute("usuario", tutor);
		return "registrado/datos";
	}
	
	@PostMapping("/datos")
	public String editarUsuario(HttpSession session, @RequestParam String nombre, @RequestParam String apellidos, @RequestParam String telefono, @RequestParam String direccion, @RequestParam String correo, @RequestParam String usuario) {
		Cliente usuarioEditado = (Cliente) session.getAttribute("usuario");
		Cliente correoCliente = repositorioCliente.findBycorreo(correo);
		Cliente usuarioCliente = repositorioCliente.findByusuario(usuario);
		
		if ((!usuarioEditado.getCorreo().equals(correo) && correoCliente != null) || (!usuarioEditado.getUsuario().equals(usuario) && usuarioCliente != null)) {
	        session.setAttribute("error", "Algunos de los nuevos datos introducidos ya están en uso por otros usuarios");
	        return "redirect:/registrado/editar-datos";
	    } else {
	    	usuarioEditado.setNombre(nombre);
	    	usuarioEditado.setApellidos(apellidos);
	    	usuarioEditado.setTelefono(telefono);
	    	usuarioEditado.setCorreo(correo);
	    	usuarioEditado.setDireccion(direccion);
	    	usuarioEditado.setUsuario(usuario);
			repositorioCliente.save(usuarioEditado);
			session.setAttribute("usuario", usuarioEditado);
			session.setAttribute("confirmacion", "Los datos han sido editados correctamente");
			return "redirect:/registrado/editar-datos";
	    }
	}
	
	@PostMapping("/trabajador")
	public String editarTrabajador(HttpSession session, @RequestParam Long id, @RequestParam String nombre, @RequestParam String apellidos, @RequestParam LocalDate nacimiento, @RequestParam String telefono, @RequestParam String direccion, @RequestParam String correo, @RequestParam String codigo) {
		Trabajador trabajadorEditado = repositorioTrabajador.findByid(id);
		Trabajador trabajadorActivo = (Trabajador) session.getAttribute("trabajador");
		Trabajador correoTrabajador = repositorioTrabajador.findBycorreo(correo);
		Trabajador usuarioTrabajador = repositorioTrabajador.findBycodigo(codigo);
		String ruta = "redirect:/administrador/editar-trabajador" + trabajadorEditado.getId();
		
		if ((!trabajadorEditado.getCorreo().equals(correo)&& correoTrabajador != null) || (!trabajadorEditado.getCodigo().equals(codigo) && usuarioTrabajador != null)) {
	        session.setAttribute("error", "Algunos de los nuevos datos introducidos ya están en uso por otros usuarios");
	        return ruta;
	    } else {
	    	trabajadorEditado.setNombre(nombre);
	    	trabajadorEditado.setApellidos(apellidos);
	    	trabajadorEditado.setTelefono(telefono);
	    	trabajadorEditado.setCorreo(correo);
	    	trabajadorEditado.setNacimiento(nacimiento);
	    	trabajadorEditado.setDireccion(direccion);
	    	trabajadorEditado.setCodigo(codigo);
			repositorioTrabajador.save(trabajadorEditado);
			session.setAttribute("confirmacion", "Los datos han sido editados correctamente");
			if (trabajadorEditado.getId().equals(trabajadorActivo.getId())) {
				session.setAttribute("trabajador", trabajadorEditado);
			}
			return ruta;
	    }
	}

}
