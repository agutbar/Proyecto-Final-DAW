package com.proyectofinal.OrtoLiberi.controladores.formularios;

import java.util.List;

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

@Controller
@RequestMapping("/formulario")
public class CambioDeSeccion {

	@Autowired
	private RepositorioCliente repositorioCliente;
	
	@Autowired
	private RepositorioTrabajador repositorioTrabajador;
	
	@PostMapping("/registro")
	public String nuevoUsuario(Model model, @RequestParam String nombre, @RequestParam String apellidos, @RequestParam String telefono, @RequestParam String direccion, @RequestParam String correo, @RequestParam String usuario, @RequestParam String password) {
		Cliente nuevoCliente = new Cliente();
		
		if (repositorioCliente.findByCorreo(correo).size() != 0 || repositorioCliente.findByUsuario(usuario).size() != 0) {
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
			model.addAttribute("usuario", nuevoCliente.getUsuario());
			return "registrado/inicio";
	    }
	}
	
	@PostMapping("/cliente")
	public String iniciarSesionCliente(Model model, @RequestParam String usuario, @RequestParam String password) {
		List <Cliente> usuarios = repositorioCliente.findByUsuario(usuario);
		if (usuarios.size() != 0) {
	        Cliente user = (Cliente) usuarios.get(0);
	        if (EncriptadoPasswords.verificarContraseña(password, user.getPassword())) {
	        	model.addAttribute("usuario", user.getUsuario());
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
	public String iniciarSesionTrabajador(Model model, @RequestParam String codigo, @RequestParam String password) {
		List <Trabajador> empleados = repositorioTrabajador.findByCodigo(codigo);
		if (empleados.size() != 0) {
	        Trabajador empleado = (Trabajador) empleados.get(0);
	        if (EncriptadoPasswords.verificarContraseña(password, empleado.getPassword())) {
	        	model.addAttribute("trabajador", empleado.getCodigo());
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
