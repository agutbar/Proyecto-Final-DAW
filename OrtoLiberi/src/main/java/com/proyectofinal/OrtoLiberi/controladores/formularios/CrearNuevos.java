package com.proyectofinal.OrtoLiberi.controladores.formularios;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.proyectofinal.OrtoLiberi.CalcularDiasLaborables;
import com.proyectofinal.OrtoLiberi.EncriptadoPasswords;
import com.proyectofinal.OrtoLiberi.entidades.elementos.CodigosSAS;
import com.proyectofinal.OrtoLiberi.entidades.elementos.Fabricacion;
import com.proyectofinal.OrtoLiberi.entidades.pedidos.PedidoCliente;
import com.proyectofinal.OrtoLiberi.entidades.pedidos.PedidoFabricacion;
import com.proyectofinal.OrtoLiberi.entidades.personas.Cliente;
import com.proyectofinal.OrtoLiberi.entidades.personas.Hijo;
import com.proyectofinal.OrtoLiberi.entidades.personas.Trabajador;
import com.proyectofinal.OrtoLiberi.repositorios.personas.RepositorioCliente;
import com.proyectofinal.OrtoLiberi.repositorios.elementos.RepositorioFabricacion;
import com.proyectofinal.OrtoLiberi.repositorios.personas.RepositorioHijo;
import com.proyectofinal.OrtoLiberi.repositorios.pedidos.RepositorioPedidoCliente;
import com.proyectofinal.OrtoLiberi.repositorios.pedidos.RepositorioPedidoFabricacion;
import com.proyectofinal.OrtoLiberi.repositorios.personas.RepositorioTrabajador;

@Controller
@RequestMapping("/nuevo")
public class CrearNuevos {
	
	@Autowired
	private RepositorioHijo repositorioHijo;
	
	@Autowired
	private RepositorioCliente repositorioCliente;
	
	@Autowired
	private RepositorioTrabajador repositorioTrabajador;
	
	@Autowired
	private RepositorioPedidoCliente repositorioPedidoCliente;
	
	@Autowired
	private RepositorioPedidoFabricacion repositorioPedidoFabricacion;
	
	@Autowired
	private RepositorioFabricacion repositorioFabricacion;
	
	@GetMapping("/hijo")
	public String nuevoHijo(Model model, @RequestParam String nombre, @RequestParam String apellidos, @RequestParam LocalDate nacimiento) {
		Cliente tutor = (Cliente) model.getAttribute("usuario");
		Hijo nuevoHijo = new Hijo();
		nuevoHijo.setNombre(nombre);
		nuevoHijo.setApellidos(apellidos);
		nuevoHijo.setNacimiento(nacimiento);
		nuevoHijo.setTutor(tutor);
		repositorioHijo.save(nuevoHijo);
		List <Hijo> hijos = tutor.getMenores();
		hijos.add(nuevoHijo);
		tutor.setMenores(hijos);
		repositorioCliente.save(tutor);
		return "registrado/datos";
	}
	
	@GetMapping("/pedidoCliente")
	public String nuevoPedidoCliente(Model model, @RequestParam Map<Long, Integer> productos) {
		Cliente comprador = (Cliente) model.getAttribute("usuario");
		PedidoCliente pedidoC = new PedidoCliente ();
		LocalDate fechaHoy = LocalDate.now();
		LocalDate fechaPrevista = CalcularDiasLaborables.sumarDiasLaborables(fechaHoy, 15);
		pedidoC.setPeticion(fechaHoy);
		pedidoC.setPrevision(fechaPrevista);
		pedidoC.setCliente(comprador);
		pedidoC.setEstado("En cola");
		pedidoC.setProductos(productos);
		repositorioPedidoCliente.save(pedidoC);
		
		return "registrado/compras";
	}
	
	@GetMapping("/fabricacion")
	public String nuevaFabricacion(Model model, @RequestParam String nombre, @RequestParam String descripción, @RequestParam CodigosSAS codigo, @RequestParam Hijo paciente, @RequestParam Trabajador responsable, @RequestParam Map<Long, Integer> materiales ) {
		Fabricacion productoFabricado = new Fabricacion();
		productoFabricado.setNombre(nombre);
		productoFabricado.setDescripcion(descripción);
		productoFabricado.setCodigo(codigo);
		productoFabricado.setPaciente(paciente);
		productoFabricado.setResponsable(responsable);
		productoFabricado.setMateriales(materiales);
		repositorioFabricacion.save(productoFabricado);
		
		return "administrador/taller";
	}
	
	@GetMapping("/pedidoFabricacion")
	public String nuevoPedidoFabricacion(Model model, @RequestParam Cliente comprador, @RequestParam Fabricacion producto) {
		PedidoFabricacion pedidoF = new PedidoFabricacion ();
		LocalDate fechaHoy = LocalDate.now();
		LocalDate fechaPrevista = CalcularDiasLaborables.sumarDiasLaborables(fechaHoy, 30);
		pedidoF.setPeticion(fechaHoy);
		pedidoF.setPrevision(fechaPrevista);
		pedidoF.setCliente(comprador);
		pedidoF.setEstado("En cola");
		pedidoF.setProducto(producto);
		repositorioPedidoFabricacion.save(pedidoF);
		
		return "administrador/taller";
	}
	
	@PostMapping("/trabajador")
	public String nuevoTrabajador(Model model, @RequestParam String nombre, @RequestParam String apellidos, @RequestParam LocalDate nacimiento, @RequestParam String telefono, @RequestParam String direccion, @RequestParam String correo, @RequestParam String codigo, @RequestParam String password) {
		Trabajador nuevoTrabajador = new Trabajador();
		
		if (repositorioTrabajador.findByCorreo(correo).size() != 0 || repositorioTrabajador.findByCodigo(codigo).size() != 0) {
	        model.addAttribute("error", "Algunos de los datos introducidos ya están en uso");
	        return "administrador/listado";
	    } else {
	    	nuevoTrabajador.setNombre(nombre);
	    	nuevoTrabajador.setApellidos(apellidos);
	    	nuevoTrabajador.setTelefono(telefono);
	    	nuevoTrabajador.setCorreo(correo);
	    	nuevoTrabajador.setNacimiento(nacimiento);
	    	nuevoTrabajador.setDireccion(direccion);
	    	nuevoTrabajador.setCodigo(codigo);
	    	nuevoTrabajador.setPassword(EncriptadoPasswords.cifrarPassword(password));
			repositorioTrabajador.save(nuevoTrabajador);
			return "administrador/listado";
	    }
	}

}
