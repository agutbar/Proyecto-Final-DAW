package com.proyectofinal.OrtoLiberi.controladores.formularios;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.proyectofinal.OrtoLiberi.CalcularDiasLaborables;
import com.proyectofinal.OrtoLiberi.CalculoPedidos;
import com.proyectofinal.OrtoLiberi.EncriptadoPasswords;
import com.proyectofinal.OrtoLiberi.entidades.elementos.CodigoSAS;
import com.proyectofinal.OrtoLiberi.entidades.elementos.Fabricacion;
import com.proyectofinal.OrtoLiberi.entidades.elementos.Material;
import com.proyectofinal.OrtoLiberi.entidades.pedidos.PedidoCliente;
import com.proyectofinal.OrtoLiberi.entidades.pedidos.PedidoFabricacion;
import com.proyectofinal.OrtoLiberi.entidades.pedidos.PedidoProveedor;
import com.proyectofinal.OrtoLiberi.entidades.personas.Cliente;
import com.proyectofinal.OrtoLiberi.entidades.personas.Hijo;
import com.proyectofinal.OrtoLiberi.entidades.personas.Proveedor;
import com.proyectofinal.OrtoLiberi.entidades.personas.Trabajador;
import com.proyectofinal.OrtoLiberi.repositorios.personas.RepositorioCliente;
import com.proyectofinal.OrtoLiberi.repositorios.elementos.RepositorioCodigoSAS;
import com.proyectofinal.OrtoLiberi.repositorios.elementos.RepositorioFabricacion;
import com.proyectofinal.OrtoLiberi.repositorios.elementos.RepositorioMaterial;
import com.proyectofinal.OrtoLiberi.repositorios.personas.RepositorioHijo;
import com.proyectofinal.OrtoLiberi.repositorios.personas.RepositorioProveedor;
import com.proyectofinal.OrtoLiberi.repositorios.pedidos.RepositorioPedidoCliente;
import com.proyectofinal.OrtoLiberi.repositorios.pedidos.RepositorioPedidoFabricacion;
import com.proyectofinal.OrtoLiberi.repositorios.pedidos.RepositorioPedidoProveedor;
import com.proyectofinal.OrtoLiberi.repositorios.personas.RepositorioTrabajador;

@Controller
@RequestMapping("/nuevo")
public class CrearNuevos {
	
	@Autowired
	private RepositorioHijo repositorioHijo;
	private RepositorioCliente repositorioCliente;
	private RepositorioTrabajador repositorioTrabajador;
	private RepositorioPedidoCliente repositorioPedidoCliente;
	private RepositorioPedidoFabricacion repositorioPedidoFabricacion;
	private RepositorioPedidoProveedor repositorioPedidoProveedor;
	private RepositorioFabricacion repositorioFabricacion;
	private RepositorioCodigoSAS repositorioCodigo;
	private RepositorioMaterial repositorioMaterial;
	private RepositorioProveedor repositorioProveedor;
	
	@PostMapping("/hijo")
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
	
	@PostMapping("/pedidoCliente")
	public String nuevoPedidoCliente(Model model, @RequestParam Map<Long, Integer> productos) {
		Cliente comprador = (Cliente) model.getAttribute("usuario");
		PedidoCliente pedidoC = new PedidoCliente ();
		LocalDate fechaHoy = LocalDate.now();
		LocalDate fechaPrevista = CalcularDiasLaborables.sumarDiasLaborables(fechaHoy, 15);
		pedidoC.setPeticion(fechaHoy);
		pedidoC.setPrevision(fechaPrevista);
		pedidoC.setCliente(comprador);
		pedidoC.setEstado("en-cola");
		pedidoC.setProductos(productos);
		repositorioPedidoCliente.save(pedidoC);
		
		return "registrado/compras";
	}
	
	@PostMapping("/fabricacion")
	public String nuevaFabricacion(Model model, @RequestParam String nombre, @RequestParam String descripción, @RequestParam CodigoSAS codigo, @RequestParam Hijo paciente, @RequestParam Trabajador responsable, @RequestParam Map<Long, Integer> materiales ) {
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
	
	@PostMapping("/pedidoFabricacion")
	public String nuevoPedidoFabricacion(Model model, @RequestParam Cliente comprador, @RequestParam Fabricacion producto) {
		PedidoFabricacion pedidoF = new PedidoFabricacion ();
		LocalDate fechaHoy = LocalDate.now();
		LocalDate fechaPrevista = CalcularDiasLaborables.sumarDiasLaborables(fechaHoy, 30);
		pedidoF.setPeticion(fechaHoy);
		pedidoF.setPrevision(fechaPrevista);
		pedidoF.setCliente(comprador);
		pedidoF.setEstado("en-cola");
		pedidoF.setProducto(producto);
		repositorioPedidoFabricacion.save(pedidoF);
		
		return "administrador/taller";
	}
	
	@PostMapping("/trabajador")
	public String nuevoTrabajador(Model model, @RequestParam String nombre, @RequestParam String apellidos, @RequestParam LocalDate nacimiento, @RequestParam String telefono, @RequestParam String direccion, @RequestParam String correo, @RequestParam String codigo, @RequestParam String password) {
		Trabajador nuevoTrabajador = new Trabajador();
		Trabajador correoTrabajador = repositorioTrabajador.findBycorreo(correo);
		Trabajador usuarioTrabajador = repositorioTrabajador.findBycodigo(codigo);
		
		if (correoTrabajador != null || usuarioTrabajador != null) {
	        model.addAttribute("error", "Algunos de los datos introducidos ya están en uso");
	        return "administrador/nuevo-trabajador";
	    } else {
	    	nuevoTrabajador.setNombre(nombre);
	    	nuevoTrabajador.setApellidos(apellidos);
	    	nuevoTrabajador.setTelefono(telefono);
	    	nuevoTrabajador.setCorreo(correo);
	    	nuevoTrabajador.setNacimiento(nacimiento);
	    	nuevoTrabajador.setDireccion(direccion);
	    	nuevoTrabajador.setCodigo(codigo);
	    	nuevoTrabajador.setEstado("activo");
	    	nuevoTrabajador.setPassword(EncriptadoPasswords.cifrarPassword(password));
			repositorioTrabajador.save(nuevoTrabajador);
			return "administrador/listado";
	    }
	}
	
	@PostMapping("/codigo")
	public String nuevoCodigo(Model model, @RequestParam String codigo, @RequestParam String producto, @RequestParam String descripcion, @RequestParam double cobertura) {
		CodigoSAS nuevoCodigo = new CodigoSAS();
		CodigoSAS existente = repositorioCodigo.findBycodigo(codigo);
		if (existente != null) {
	        model.addAttribute("error", "El codigo ya existe");
	        return "administrador/listado";
	    } else {
	    	nuevoCodigo.setCodigo(codigo);
	    	nuevoCodigo.setProducto(producto);
	    	nuevoCodigo.setDescripcion(descripcion);
	    	nuevoCodigo.setCobertura(cobertura);
			repositorioCodigo.save(nuevoCodigo);
			return "administrador/codigos";
	    }
	}
	
	@PostMapping("/material")
	public String nuevoMaterial(Model model, @RequestParam String nombre, @RequestParam String lote, @RequestParam String descripcion, @RequestParam double coste, @RequestParam Long proveedor, @RequestParam Integer stock, @RequestParam LocalDate caducidad) {
		Material nuevoMaterial = new Material();
		Material existente = repositorioMaterial.findBylote(lote);
		Proveedor prove = repositorioProveedor.findByid(proveedor);
		if (existente != null) {
	        model.addAttribute("error", "El lote ya está registrado");
	        return "administrador/listado";
	    } else {
	    	nuevoMaterial.setNombre(nombre);
	    	nuevoMaterial.setLote(lote);
	    	nuevoMaterial.setDescripcion(descripcion);
	    	nuevoMaterial.setCaducidad(caducidad);
	    	nuevoMaterial.setCoste(coste);
	    	nuevoMaterial.setProveedor(prove);
	    	nuevoMaterial.setStock(stock);
	    	repositorioMaterial.save(nuevoMaterial);
			return "administrador/codigos";
	    }
	}
	
	@PostMapping("/proveedor")
	public String nuevoProveedor(Model model, @RequestParam String cif, @RequestParam String nombre, @RequestParam String telefono, @RequestParam String correo) {
		Proveedor nuevoProveedor = new Proveedor();
		Proveedor existente = repositorioProveedor.findBycif(cif);
		if (existente != null) {
	        model.addAttribute("error", "El cif ya está registrado en otro proveedor");
	        return "administrador/nuevo-proveedor";
	    } else {
	    	nuevoProveedor.setCif(cif);
	    	nuevoProveedor.setCorreo(correo);
	    	nuevoProveedor.setEstado("activo");
	    	nuevoProveedor.setNombre(nombre);
	    	nuevoProveedor.setTelefono(telefono);
	    	repositorioProveedor.save(nuevoProveedor);
			return "administrador/listado";
	    }
	}
	
	@PostMapping("/pedido-proveedor")
	public String nuevoPedidoProveedor(Model model, @RequestParam Long proveedor, @RequestParam Map<Long, Integer> productos, @RequestParam Map<Long, Integer> materiales) {
		PedidoProveedor nuevoPedidoProveedor = new PedidoProveedor();
		LocalDate hoy = LocalDate.now();
		Proveedor proveedorElegido = repositorioProveedor.findByid(proveedor);
		double importe_productos, importe_materiales, importe;
		nuevoPedidoProveedor.setPeticion(hoy);
		nuevoPedidoProveedor.setEstado("realizado");
		nuevoPedidoProveedor.setProveedor(proveedorElegido);
		nuevoPedidoProveedor.setProductos(productos);
		nuevoPedidoProveedor.setMateriales(materiales);
		try {
			importe_productos = CalculoPedidos.calcularCosteProductosProveedor(productos);
			importe_materiales = CalculoPedidos.calcularCosteMateriales(materiales);
			importe = importe_productos + importe_materiales;
			nuevoPedidoProveedor.setImporte(importe);
			repositorioPedidoProveedor.save(nuevoPedidoProveedor);
			return "administrador/listado";
		} catch (Exception e) {
			model.addAttribute("error", "No se puede calcular el coste");
	        return "administrador/nuevo-pedido-proveedor";
		}
	}

}
