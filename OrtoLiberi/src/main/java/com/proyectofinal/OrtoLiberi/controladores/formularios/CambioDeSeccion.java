package com.proyectofinal.OrtoLiberi.controladores.formularios;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.proyectofinal.OrtoLiberi.entidades.personas.Cliente;
import com.proyectofinal.OrtoLiberi.entidades.personas.Trabajador;
import com.proyectofinal.OrtoLiberi.EncriptadoPasswords;
import com.proyectofinal.OrtoLiberi.repositorios.personas.RepositorioCliente;
import com.proyectofinal.OrtoLiberi.repositorios.personas.RepositorioTrabajador;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/formulario")
public class CambioDeSeccion {

	@Autowired
	private RepositorioCliente repositorioCliente;
	
	@Autowired
	private RepositorioTrabajador repositorioTrabajador;
	
	@PostMapping("/registro")
	public String nuevoUsuario(Model model, HttpSession session, @RequestParam String nombre, @RequestParam String apellidos, @RequestParam String telefono, @RequestParam String direccion, @RequestParam String correo, @RequestParam String usuario, @RequestParam String password) {
		Cliente nuevoCliente = new Cliente();
		Cliente correoCliente = repositorioCliente.findBycorreo(correo);
		Cliente usuarioCliente = repositorioCliente.findByusuario(usuario);
		if (correoCliente != null || usuarioCliente != null) {
	        model.addAttribute("error", "Algunos de los datos introducidos ya están en uso");
	        return "general/registro";
	    } else {
	    	nuevoCliente.setNombre(nombre);
			nuevoCliente.setApellidos(apellidos);
			nuevoCliente.setTelefono(telefono);
			nuevoCliente.setCorreo(correo);
			nuevoCliente.setDireccion(direccion); 
			nuevoCliente.setUsuario(usuario);
			nuevoCliente.setPassword(EncriptadoPasswords.cifrarPassword(password));
			repositorioCliente.save(nuevoCliente);
			session.setAttribute("usuario", nuevoCliente.getUsuario());
			return "registrado/inicio";
	    }
	}
	
	@PostMapping("/cliente")
	public String iniciarSesionCliente(Model model, HttpSession session,  @RequestParam String usuario, @RequestParam String password) {
		Cliente us = repositorioCliente.findByusuario(usuario);
		if (us != null) {
	        Cliente user = us;
	        if (EncriptadoPasswords.verificarContraseña(password, user.getPassword())) {
	        	session.setAttribute("usuario", user.getUsuario());
	        	return "registrado/inicio";
	        } else {
	        	model.addAttribute("error", "Usuario o contraseña incorrectos");
		        return "general/acceso";
	        }
	    } else {
	    	model.addAttribute("error", "Usuario o contraseña incorrectos");
	        return "general/acceso";
	    }
	}
	
	@PostMapping("/trabajador")
	public String iniciarSesionTrabajador(Model model, HttpSession session,  @RequestParam String codigo, @RequestParam String password) {
		Trabajador trabajador = repositorioTrabajador.findBycodigo(codigo);
		if (trabajador != null) {
	        Trabajador empleado = trabajador;
	        if (EncriptadoPasswords.verificarContraseña(password, empleado.getPassword())) {
	        	session.setAttribute("trabajador", empleado.getCodigo());
	        	return "administrador/inicio";
	        } else {
	        	model.addAttribute("error", "Acceso Denegado");
		        return "general/trabajadores";
	        }
	    } else {
	    	model.addAttribute("error", "Acceso Denegado");
	        return "general/trabajadores";
	    }
	}
}
