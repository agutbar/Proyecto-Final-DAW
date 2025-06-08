package com.proyectofinal.OrtoLiberi.controladores.formularios;

import java.time.DateTimeException;
import java.time.LocalDate;
import java.time.LocalTime;
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
import com.proyectofinal.OrtoLiberi.entidades.elementos.Cita;
import com.proyectofinal.OrtoLiberi.entidades.elementos.CodigoSAS;
import com.proyectofinal.OrtoLiberi.entidades.elementos.Fabricacion;
import com.proyectofinal.OrtoLiberi.entidades.elementos.Material;
import com.proyectofinal.OrtoLiberi.entidades.elementos.Producto;
import com.proyectofinal.OrtoLiberi.entidades.elementos.Revision;
import com.proyectofinal.OrtoLiberi.entidades.pedidos.PedidoCliente;
import com.proyectofinal.OrtoLiberi.entidades.pedidos.PedidoFabricacion;
import com.proyectofinal.OrtoLiberi.entidades.pedidos.PedidoProveedor;
import com.proyectofinal.OrtoLiberi.entidades.personas.Cliente;
import com.proyectofinal.OrtoLiberi.entidades.personas.Hijo;
import com.proyectofinal.OrtoLiberi.entidades.personas.Proveedor;
import com.proyectofinal.OrtoLiberi.entidades.personas.Trabajador;
import com.proyectofinal.OrtoLiberi.entidades.procesos.AusenciaTrabajador;
import com.proyectofinal.OrtoLiberi.repositorios.personas.RepositorioCliente;
import com.proyectofinal.OrtoLiberi.repositorios.elementos.RepositorioCita;
import com.proyectofinal.OrtoLiberi.repositorios.elementos.RepositorioCodigoSAS;
import com.proyectofinal.OrtoLiberi.repositorios.elementos.RepositorioFabricacion;
import com.proyectofinal.OrtoLiberi.repositorios.elementos.RepositorioMaterial;
import com.proyectofinal.OrtoLiberi.repositorios.elementos.RepositorioProducto;
import com.proyectofinal.OrtoLiberi.repositorios.elementos.RepositorioRevision;
import com.proyectofinal.OrtoLiberi.repositorios.personas.RepositorioHijo;
import com.proyectofinal.OrtoLiberi.repositorios.personas.RepositorioProveedor;
import com.proyectofinal.OrtoLiberi.repositorios.pedidos.RepositorioPedidoCliente;
import com.proyectofinal.OrtoLiberi.repositorios.pedidos.RepositorioPedidoFabricacion;
import com.proyectofinal.OrtoLiberi.repositorios.pedidos.RepositorioPedidoProveedor;
import com.proyectofinal.OrtoLiberi.repositorios.personas.RepositorioTrabajador;
import com.proyectofinal.OrtoLiberi.repositorios.procesos.RepositorioAusenciaTrabajador;

import jakarta.servlet.http.HttpSession;

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
	private RepositorioPedidoProveedor repositorioPedidoProveedor;
	@Autowired
	private RepositorioFabricacion repositorioFabricacion;
	@Autowired
	private RepositorioCodigoSAS repositorioCodigo;
	@Autowired
	private RepositorioMaterial repositorioMaterial;
	@Autowired
	private RepositorioProveedor repositorioProveedor;
	@Autowired
	private RepositorioCita repositorioCita;
	@Autowired
	private RepositorioRevision repositorioRevision;
	@Autowired
	private RepositorioProducto repositorioProducto;
	@Autowired
	private RepositorioAusenciaTrabajador repositorioBajas;
	
	@PostMapping("/hijo")
 	public String nuevoHijo(Model model, HttpSession session, @RequestParam String nombre, @RequestParam String apellidos, @RequestParam LocalDate nacimiento) {
		Cliente tutor = (Cliente) session.getAttribute("usuario");
		Hijo nuevoHijo = new Hijo();
		nuevoHijo.setNombre(nombre);
		nuevoHijo.setApellidos(apellidos);
		nuevoHijo.setNacimiento(nacimiento);
		nuevoHijo.setTutor(tutor);
		nuevoHijo.setEstado("activo");
		repositorioHijo.save(nuevoHijo);
		List <Hijo> hijos = tutor.getMenores();
		hijos.add(nuevoHijo);
		tutor.setMenores(hijos);
		repositorioCliente.save(tutor);
		session.setAttribute("usuario", tutor);
		return "registrado/datos";
	}
	
	@PostMapping("/pedidoCliente")
	public String nuevoPedidoCliente(Model model, HttpSession session, @RequestParam Map<Long, Integer> productos, @RequestParam Long cliente) {
		Trabajador trabajador = (Trabajador) session.getAttribute("trabajador");
		Cliente comprador = repositorioCliente.findByid(cliente);
		PedidoCliente pedidoC = new PedidoCliente ();
		LocalDate fechaHoy = LocalDate.now();
		LocalDate fechaPrevista = CalcularDiasLaborables.sumarDiasLaborables(fechaHoy, 15);
		pedidoC.setPeticion(fechaHoy);
		pedidoC.setPrevision(fechaPrevista);
		pedidoC.setCliente(comprador);
		pedidoC.setEstado("en-cola");
		pedidoC.setProductos(productos);
		repositorioPedidoCliente.save(pedidoC);
		session.setAttribute("trabajador", trabajador);
		return "registrado/compras";
	}
	
	@PostMapping("/fabricacion")
	public String nuevaFabricacion(Model model, HttpSession session, @RequestParam String nombre, @RequestParam String descripción, @RequestParam CodigoSAS codigo, @RequestParam Long paciente, @RequestParam Long responsable) {
		Trabajador user = (Trabajador) session.getAttribute("trabajador");
		Fabricacion productoFabricado = new Fabricacion();
		productoFabricado.setNombre(nombre);
		productoFabricado.setDescripcion(descripción);
		productoFabricado.setCodigo(codigo);
		productoFabricado.setPaciente(repositorioHijo.findByid(paciente));
		productoFabricado.setResponsable(repositorioTrabajador.findByid(responsable));
		productoFabricado.setEstado("no-asignado");
		repositorioFabricacion.save(productoFabricado);
		session.setAttribute("trabajador", user);
		return "redirect:/administrador/taller";
	}
	
	@PostMapping("/pedidoFabricacion")
	public String nuevoPedidoFabricacion(Model model, HttpSession session, @RequestParam Long comprador, @RequestParam Long producto) {
		Trabajador user = (Trabajador) session.getAttribute("trabajador");
		PedidoFabricacion pedidoF = new PedidoFabricacion ();
		LocalDate fechaHoy = LocalDate.now();
		Cliente solicitante = repositorioCliente.findByid(comprador);
		Fabricacion fabricado = repositorioFabricacion.findByid(producto);
		LocalDate fechaPrevista = CalcularDiasLaborables.sumarDiasLaborables(fechaHoy, 30);
		pedidoF.setPeticion(fechaHoy);
		pedidoF.setPrevision(fechaPrevista);
		pedidoF.setCliente(solicitante);
		pedidoF.setEstado("en-cola");
		pedidoF.setProducto(fabricado);
		fabricado.setEstado("asignado");
		repositorioFabricacion.save(fabricado);
		repositorioPedidoFabricacion.save(pedidoF);
		session.setAttribute("trabajador", user);
		return "administrador/taller";
	}
	
	@PostMapping("/trabajador")
	public String nuevoTrabajador(Model model, HttpSession session, @RequestParam String nombre, @RequestParam String apellidos, @RequestParam LocalDate nacimiento, @RequestParam String telefono, @RequestParam String direccion, @RequestParam String correo, @RequestParam String codigo, @RequestParam String password) {
		Trabajador user = (Trabajador) session.getAttribute("trabajador");
		Trabajador nuevoTrabajador = new Trabajador();
		Trabajador correoTrabajador = repositorioTrabajador.findBycorreo(correo);
		Trabajador usuarioTrabajador = repositorioTrabajador.findBycodigo(codigo);
		
		if (correoTrabajador != null || usuarioTrabajador != null) {
	        model.addAttribute("error", "Algunos de los datos introducidos ya están en uso");
	        session.setAttribute("trabajador", user);
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
			session.setAttribute("trabajador", user);
			return "redirect:/administrador/listado";
	    }
	}
	
	@PostMapping("/codigo")
	public String nuevoCodigo(Model model, HttpSession session, @RequestParam String codigo, @RequestParam String producto, @RequestParam String descripcion, @RequestParam double cobertura) {
		Trabajador user = (Trabajador) session.getAttribute("trabajador");
		CodigoSAS nuevoCodigo = new CodigoSAS();
		CodigoSAS existente = repositorioCodigo.findBycodigo(codigo);
		if (existente != null) {
	        model.addAttribute("error", "El codigo ya existe");
	        session.setAttribute("trabajador", user);
	        return "administrador/nuevo-codigo";
	    } else {
	    	nuevoCodigo.setCodigo(codigo);
	    	nuevoCodigo.setProducto(producto);
	    	nuevoCodigo.setDescripcion(descripcion);
	    	nuevoCodigo.setCobertura(cobertura);
	    	nuevoCodigo.setEstado("activo");
			repositorioCodigo.save(nuevoCodigo);
			session.setAttribute("trabajador", user);
			return "redirect:/administrador/codigos";
	    }
	}
	
	@PostMapping("/material")
	public String nuevoMaterial(Model model, HttpSession session, @RequestParam String nombre, @RequestParam String lote, @RequestParam String descripcion, @RequestParam double coste, @RequestParam Long proveedor, @RequestParam Integer stock, @RequestParam LocalDate caducidad) {
		Trabajador user = (Trabajador) session.getAttribute("trabajador");
		Material nuevoMaterial = new Material();
		Material existente = repositorioMaterial.findBylote(lote);
		Proveedor prove = repositorioProveedor.findByid(proveedor);
		if (existente != null) {
	        model.addAttribute("error", "El lote ya está registrado");
	        session.setAttribute("trabajador", user);
	        return "administrador/nuevo-material";
	    } else {
	    	nuevoMaterial.setNombre(nombre);
	    	nuevoMaterial.setLote(lote);
	    	nuevoMaterial.setDescripcion(descripcion);
	    	nuevoMaterial.setCaducidad(caducidad);
	    	nuevoMaterial.setCoste(coste);
	    	nuevoMaterial.setProveedor(prove);
	    	nuevoMaterial.setStock(stock);
	    	nuevoMaterial.setEstado("activo");
	    	repositorioMaterial.save(nuevoMaterial);
	    	session.setAttribute("trabajador", user);
			return "redirect:/administrador/almacen";
	    }
	}
	
	@PostMapping("/proveedor")
	public String nuevoProveedor(Model model, HttpSession session, @RequestParam String cif, @RequestParam String nombre, @RequestParam String telefono, @RequestParam String correo) {
		Trabajador user = (Trabajador) session.getAttribute("trabajador");
		Proveedor nuevoProveedor = new Proveedor();
		Proveedor existente = repositorioProveedor.findBycif(cif);
		if (existente != null) {
	        model.addAttribute("error", "El cif ya está registrado en otro proveedor");
	        session.setAttribute("trabajador", user);
	        return "administrador/nuevo-proveedor";
	    } else {
	    	nuevoProveedor.setCif(cif);
	    	nuevoProveedor.setCorreo(correo);
	    	nuevoProveedor.setEstado("normal");
	    	nuevoProveedor.setNombre(nombre);
	    	nuevoProveedor.setTelefono(telefono);
	    	repositorioProveedor.save(nuevoProveedor);
	    	session.setAttribute("trabajador", user);
			return "redirect:/administrador/listado";
	    }
	}
	
	@PostMapping("/pedido-proveedor")
	public String nuevoPedidoProveedor(Model model, HttpSession session, @RequestParam Long proveedor, @RequestParam Map<Long, Integer> productos, @RequestParam Map<Long, Integer> materiales) {
		Trabajador user = (Trabajador) session.getAttribute("trabajador");
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
			session.setAttribute("trabajador", user);
			return "administrador/listado";
		} catch (Exception e) {
			model.addAttribute("error", "No se puede calcular el coste");
			session.setAttribute("trabajador", user);
	        return "administrador/nuevo-pedido-proveedor";
		}
	}
	
	@PostMapping("/revision")
	public String nuevaRevision(HttpSession session, Model model, @RequestParam Long cita, @RequestParam String descripcion, @RequestParam Long hijo ) {
		Cliente user = (Cliente) session.getAttribute("usuario");
		Revision nuevaRevision = new Revision();
		Cliente solicitante = user;
		Hijo paciente = repositorioHijo.findByid(hijo);
		Cita fecha = repositorioCita.findByid(cita);
		if (fecha.getEstado() == null || !user.equals(solicitante)) {
	        model.addAttribute("error", "No se puede solicitar la cita");
	        session.setAttribute("usuario", user);
	        return "registrado/nueva-cita";
	    } else {
	    	nuevaRevision.setCita(fecha);
	    	nuevaRevision.setDescripcion(descripcion);
	    	nuevaRevision.setPaciente(paciente);
	    	nuevaRevision.setSolicitante(solicitante);
	    	fecha.setEstado("ocupada");
	    	solicitante.getCitas().add(nuevaRevision);
	    	paciente.getRevisiones().add(nuevaRevision);
	    	repositorioRevision.save(nuevaRevision);
	    	repositorioCita.save(fecha);
	    	repositorioHijo.save(paciente);
	    	repositorioCliente.save(solicitante);
	    	session.setAttribute("usuario", user);
			return "redirect:/registrado/citas";
	    }
	}
	
	@PostMapping("/cita")
	public String nuevaCita(HttpSession session, Model model, @RequestParam Integer dia, @RequestParam Integer mes, @RequestParam Integer year, @RequestParam Integer hora, @RequestParam Integer minuto, @RequestParam Long trabajador) {
		Trabajador user = (Trabajador) session.getAttribute("trabajador");
		Cita nuevaCita = new Cita();
		Trabajador responsable = repositorioTrabajador.findByid(trabajador);
		LocalDate hoy = LocalDate.now();
		LocalDate fecha;
		LocalTime tiempo;
		
		try{
			fecha = LocalDate.of(year, mes, dia);
			tiempo = LocalTime.of(hora, minuto);
		} catch (DateTimeException e) {
	        model.addAttribute("error", "La fecha o la hora introducidas no existen");
	        session.setAttribute("trabajador", user);
	        return "administrador/nueva-cita";
	    } 
		
		if (fecha.isBefore(hoy)) {
			model.addAttribute("error", "La fecha introducida no es valida");
	        session.setAttribute("trabajador", user);
	        return "administrador/nueva-cita";
		} else {
			nuevaCita.setFecha(fecha);
			nuevaCita.setHora(tiempo);
			nuevaCita.setEstado("libre");
	    	nuevaCita.setTecnico(responsable);
	    	repositorioCita.save(nuevaCita);
	    	responsable.getCitas().add(nuevaCita);
	    	repositorioTrabajador.save(responsable);
	    	session.setAttribute("trabajador", user);
			return "redirect:/administrador/agenda";
	    }
	}
	
	@PostMapping("/producto")
	public String nuevoProducto(HttpSession session, Model model, @RequestParam String nombre, @RequestParam String lote, @RequestParam String descripcion, @RequestParam double coste, @RequestParam double venta, @RequestParam Long proveedor, @RequestParam String codigo, @RequestParam Integer stock, @RequestParam String devolución) {
		Trabajador user = (Trabajador) session.getAttribute("trabajador");
		Producto nuevoProducto = new Producto();
		Producto existente = repositorioProducto.findBylote(lote);
		Proveedor prove = repositorioProveedor.findByid(proveedor);
		CodigoSAS cod = repositorioCodigo.findBycodigo(codigo);
		if (existente != null) {
	        model.addAttribute("error", "El lote ya está registrado");
	        session.setAttribute("trabajador", user);
	        return "administrador/nuevo-producto";
	    } else {
	    	nuevoProducto.setNombre(nombre);
	    	nuevoProducto.setLote(lote);
	    	nuevoProducto.setDescripcion(descripcion);
	    	nuevoProducto.setPrecio(venta);
	    	nuevoProducto.setCoste(coste);
	    	nuevoProducto.setProveedor(prove);
	    	nuevoProducto.setStock(stock);
	    	nuevoProducto.setCodigoAsociado(cod);
	    	nuevoProducto.setDevolución(devolución);
	    	nuevoProducto.setEstado("activo");
	    	cod.getProductos().add(nuevoProducto);
	    	repositorioProducto.save(nuevoProducto);
	    	repositorioCodigo.save(cod);
	    	session.setAttribute("trabajador", user);
			return "redirect:/administrador/almacen";
	    }
	}
	
	@PostMapping("/baja")
	public String nuevaBaja(HttpSession session, @RequestParam Integer dia_baja, @RequestParam Integer mes_baja, @RequestParam Integer year_baja, @RequestParam Integer dia_alta, @RequestParam Integer mes_alta, @RequestParam Integer year_alta, @RequestParam Long tecnico, @RequestParam String motivo) {
		Trabajador user = (Trabajador) session.getAttribute("trabajador");
		AusenciaTrabajador nuevaBaja = new AusenciaTrabajador();
		Trabajador trabajador = repositorioTrabajador.findByid(tecnico);
		LocalDate alta, baja;
		List <Cita> citas = trabajador.getCitas();
		Boolean puedePedirBaja = true;
		Integer diasBaja = 0;
		try{
			alta = LocalDate.of(year_alta, mes_alta, dia_alta);
			baja = LocalDate.of(year_baja, mes_baja, dia_baja);
			diasBaja = CalcularDiasLaborables.contarDiasLaborables(baja, alta);
		} catch (DateTimeException e) {
	        session.setAttribute("error", "La fecha de alta o de baja introducidas no existen");
	        session.setAttribute("trabajador", user);
	        return "redirect:/administrador/nueva-baja";
	    }
		
		for (Cita cita : citas) {
			if (!cita.getFecha().isBefore(baja) && !cita.getFecha().isAfter(alta)) {
				puedePedirBaja = false;
			}
		}
		
		if (trabajador.getEstado() != "activo" && !puedePedirBaja) {
	        session.setAttribute("error", "Hay citas asignadas en estos dias, anulelas antes de pedir la baja");
	        session.setAttribute("trabajador", user);
	        return "redirect:/administrador/nueva-baja";
	    } else {
	    	if (alta.isBefore(baja)) {
	    		session.setAttribute("error", "Hay errores a la hora de poner las fechas");
	 	        session.setAttribute("trabajador", user);
	 	        return "redirect:/administrador/nueva-baja";
	    	} else {
		    	nuevaBaja.setAlta(alta);
		    	nuevaBaja.setBaja(baja);
		    	nuevaBaja.setDias(diasBaja);
		    	nuevaBaja.setMotivo(motivo);
		    	nuevaBaja.setTecnico(trabajador);
		    	trabajador.getAusencias().add(nuevaBaja);
		    	repositorioBajas.save(nuevaBaja);
		    	repositorioTrabajador.save(trabajador);
		    	session.setAttribute("trabajador", user);
				return "redirect:/administrador/bajas";
	    	}
	    }
	}

}
