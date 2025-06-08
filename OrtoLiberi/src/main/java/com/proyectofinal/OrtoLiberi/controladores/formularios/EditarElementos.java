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
import com.proyectofinal.OrtoLiberi.EncriptadoPasswords;
import com.proyectofinal.OrtoLiberi.entidades.elementos.Cita;
import com.proyectofinal.OrtoLiberi.entidades.elementos.CodigoSAS;
import com.proyectofinal.OrtoLiberi.entidades.elementos.Fabricacion;
import com.proyectofinal.OrtoLiberi.entidades.elementos.Material;
import com.proyectofinal.OrtoLiberi.entidades.elementos.Producto;
import com.proyectofinal.OrtoLiberi.entidades.elementos.Revision;
import com.proyectofinal.OrtoLiberi.entidades.personas.Cliente;
import com.proyectofinal.OrtoLiberi.entidades.personas.Hijo;
import com.proyectofinal.OrtoLiberi.entidades.personas.Proveedor;
import com.proyectofinal.OrtoLiberi.entidades.personas.Trabajador;
import com.proyectofinal.OrtoLiberi.entidades.procesos.AusenciaTrabajador;
import com.proyectofinal.OrtoLiberi.repositorios.procesos.RepositorioAusenciaTrabajador;
import com.proyectofinal.OrtoLiberi.repositorios.personas.RepositorioCliente;

import jakarta.servlet.http.HttpSession;

import com.proyectofinal.OrtoLiberi.repositorios.elementos.RepositorioCita;
import com.proyectofinal.OrtoLiberi.repositorios.elementos.RepositorioCodigoSAS;
import com.proyectofinal.OrtoLiberi.repositorios.elementos.RepositorioFabricacion;
import com.proyectofinal.OrtoLiberi.repositorios.elementos.RepositorioMaterial;
import com.proyectofinal.OrtoLiberi.repositorios.elementos.RepositorioProducto;
import com.proyectofinal.OrtoLiberi.repositorios.personas.RepositorioHijo;
import com.proyectofinal.OrtoLiberi.repositorios.personas.RepositorioProveedor;
import com.proyectofinal.OrtoLiberi.repositorios.elementos.RepositorioRevision;
import com.proyectofinal.OrtoLiberi.repositorios.personas.RepositorioTrabajador;

@Controller
@RequestMapping("/editar")
public class EditarElementos {
	
	@Autowired
	private RepositorioHijo repositorioHijo;
	@Autowired
	private RepositorioCliente repositorioCliente;
	@Autowired
	private RepositorioTrabajador repositorioTrabajador;
	@Autowired
	private RepositorioProveedor repositorioProveedor;
	@Autowired
	private RepositorioCita repositorioCita;
	@Autowired
	private RepositorioProducto repositorioProducto;
	@Autowired
	private RepositorioMaterial repositorioMaterial;
	@Autowired
	private RepositorioCodigoSAS repositorioCodigo;
	@Autowired
	private RepositorioFabricacion repositorioFabricacion;
	@Autowired
	private RepositorioAusenciaTrabajador repositorioBajas;
	@Autowired
	private RepositorioRevision repositorioRevision;
	
	@PostMapping("/baja")
	public String editarBaja(HttpSession session, Model model, @RequestParam Long id, @RequestParam Integer dia_baja, @RequestParam Integer mes_baja, @RequestParam Integer year_baja, @RequestParam Integer dia_alta, @RequestParam Integer mes_alta, @RequestParam Integer year_alta, @RequestParam Long tecnico, @RequestParam String motivo) {
		Trabajador user = (Trabajador) session.getAttribute("trabajador");
		AusenciaTrabajador nuevaBaja = repositorioBajas.findByid(id);
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
	        return "redirect:/administrador/editar-baja";
	    }
		
		for (Cita cita : citas) {
			if (!cita.getFecha().isBefore(baja) && !cita.getFecha().isAfter(alta)) {
				puedePedirBaja = false;
			}
		}
		
		if (trabajador.getEstado() != "activo" && !puedePedirBaja) {
			session.setAttribute("error", "Hay citas asignadas en estos dias, anulelas antes de pedir la baja");
	        session.setAttribute("trabajador", user);
	        return "redirect:/administrador/editar-baja";
	    } else {
	    	if (alta.isBefore(baja)) {
	    		model.addAttribute("error", "Hay errores a la hora de poner las fechas");
	 	        session.setAttribute("trabajador", user);
	 	        return "redirect:/administrador/editar-baja";
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
		    	if (nuevaBaja.getMotivo() == motivo) {
					session.setAttribute("confirmacion", "Cambios guardados correctamente");
				} else {
					session.setAttribute("error", "No se ha guardado correctamente el cambio");
				}
		    	session.setAttribute("trabajador", user);
				return "redirect:/administrador/editar-baja";
	    	}
	    }
	}
	
	@PostMapping("/hijo")
 	public String editarHijo(Model model, HttpSession session, @RequestParam Long id, @RequestParam String nombre, @RequestParam String apellidos, @RequestParam LocalDate nacimiento) {
		Cliente tutor = (Cliente) session.getAttribute("usuario");
		Hijo nuevoHijo = repositorioHijo.findByid(id);
		nuevoHijo.setNombre(nombre);
		nuevoHijo.setApellidos(apellidos);
		nuevoHijo.setNacimiento(nacimiento);
		nuevoHijo.setTutor(tutor);
		repositorioHijo.save(nuevoHijo);
		List <Hijo> hijos = tutor.getMenores();
		hijos.add(nuevoHijo);
		tutor.setMenores(hijos);
		repositorioCliente.save(tutor);
		if (nuevoHijo.getNombre() == nombre) {
			model.addAttribute("confirmacion", "Cambios guardados correctamente");
		} else {
			model.addAttribute("error", "No se ha guardado correctamente el cambio");
		}
		session.setAttribute("usuario", tutor);
		return "registrado/datos";
	}
	
	@PostMapping("/cita")
	public String editarCita(HttpSession session, Model model, @RequestParam Long id, @RequestParam Integer dia, @RequestParam Integer mes, @RequestParam Integer year, @RequestParam Integer hora, @RequestParam Integer minuto, @RequestParam Long trabajador) {
		Trabajador user = (Trabajador) session.getAttribute("trabajador");
		Cita nuevaCita = repositorioCita.findByid(id);
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
	        return "administrador/editar-cita";
	    } 
		
		if (fecha.isBefore(hoy)) {
			model.addAttribute("error", "La fecha introducida no es valida");
	        session.setAttribute("trabajador", user);
	        return "administrador/editar-cita";
		} else {
			nuevaCita.setFecha(fecha);
			nuevaCita.setHora(tiempo);
	    	nuevaCita.setTecnico(responsable);
	    	repositorioCita.save(nuevaCita);
	    	responsable.getCitas().add(nuevaCita);
	    	repositorioTrabajador.save(responsable);
	    	if (nuevaCita.getTecnico() == responsable) {
				model.addAttribute("confirmacion", "Cambios guardados correctamente");
			} else {
				model.addAttribute("error", "No se ha guardado correctamente el cambio");
			}
	    	session.setAttribute("trabajador", user);
			return "administrador/agenda";
	    }
	}
	
	@PostMapping("/trabajador")
	public String editarTrabajador(Model model, HttpSession session, @RequestParam Long id, @RequestParam String nombre, @RequestParam String apellidos, @RequestParam LocalDate nacimiento, @RequestParam String telefono, @RequestParam String direccion, @RequestParam String correo, @RequestParam String codigo, @RequestParam String password) {
		Trabajador user = (Trabajador) session.getAttribute("trabajador");
		Trabajador nuevoTrabajador = repositorioTrabajador.findByid(id);
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
	    	nuevoTrabajador.setPassword(EncriptadoPasswords.cifrarPassword(password));
			repositorioTrabajador.save(nuevoTrabajador);
			if (nuevoTrabajador.getNombre() == nombre) {
				model.addAttribute("confirmacion", "Cambios guardados correctamente");
			} else {
				model.addAttribute("error", "No se ha guardado correctamente el cambio");
			}
			session.setAttribute("trabajador", user);
			return "administrador/listado";
	    }
	}
	
	@PostMapping("/fabricacion")
	public String editarFabricacion(Model model, HttpSession session, @RequestParam Long id, @RequestParam Long material, @RequestParam Integer cantidad) {
		Trabajador user = (Trabajador) session.getAttribute("trabajador");
		Fabricacion producto = repositorioFabricacion.findByid(id);
		Map <Long, Integer> usados = producto.getMateriales();
		usados.put(material, cantidad);
		producto.setMateriales(usados);
		repositorioFabricacion.save(producto);
		if (producto.getMateriales().containsKey(material)) {
			model.addAttribute("confirmacion", "Material añadido a la hoja de taller");
		} else {
			model.addAttribute("error", "No se ha guardado correctamente el material");
		}
		session.setAttribute("trabajador", user);
		return "administrador/editar-fabricacion";
	}
	
	@PostMapping("/material")
	public String editarMaterial(Model model, HttpSession session, @RequestParam Long id, @RequestParam String nombre, @RequestParam String lote, @RequestParam String descripcion, @RequestParam double coste, @RequestParam Long proveedor, @RequestParam Integer stock, @RequestParam LocalDate caducidad) {
		Trabajador user = (Trabajador) session.getAttribute("trabajador");
		Material nuevoMaterial = repositorioMaterial.findByid(id);
		Material existente = repositorioMaterial.findBylote(lote);
		Proveedor prove = repositorioProveedor.findByid(proveedor);
		if (existente != null && !existente.equals(nuevoMaterial)) {
	        model.addAttribute("error", "El lote ya está registrado en otro material");
	        session.setAttribute("trabajador", user);
	        return "administrador/editar-material";
	    } else {
	    	nuevoMaterial.setNombre(nombre);
	    	nuevoMaterial.setLote(lote);
	    	nuevoMaterial.setDescripcion(descripcion);
	    	nuevoMaterial.setCaducidad(caducidad);
	    	nuevoMaterial.setCoste(coste);
	    	nuevoMaterial.setProveedor(prove);
	    	nuevoMaterial.setStock(stock);
	    	repositorioMaterial.save(nuevoMaterial);
	    	if (nuevoMaterial.getLote() == lote) {
				model.addAttribute("confirmacion", "Material editado correctamente");
			} else {
				model.addAttribute("error", "No se ha guardado correctamente el material");
			}
	    	session.setAttribute("trabajador", user);
			return "administrador/editar-material";
	    }
	}
	
	@PostMapping("/proveedor")
	public String editarProveedor(Model model, HttpSession session,  @RequestParam Long id, @RequestParam String cif, @RequestParam String nombre, @RequestParam String telefono, @RequestParam String correo) {
		Trabajador user = (Trabajador) session.getAttribute("trabajador");
		Proveedor nuevoProveedor = repositorioProveedor.findByid(id);
		Proveedor existente = repositorioProveedor.findBycif(cif);
		String ruta = "redirect:/administrador/editar-proveedor" + nuevoProveedor.getId();
		if (existente != null && !existente.equals(nuevoProveedor)) {
			session.setAttribute("error", "El cif ya está registrado en otro proveedor diferente");
	        session.setAttribute("trabajador", user);
	        return ruta;
	    } else {
	    	nuevoProveedor.setCif(cif);
	    	nuevoProveedor.setCorreo(correo);
	    	nuevoProveedor.setEstado("normal");
	    	nuevoProveedor.setNombre(nombre);
	    	nuevoProveedor.setTelefono(telefono);
	    	repositorioProveedor.save(nuevoProveedor);
	    	if (nuevoProveedor.getCif() == cif) {
	    		session.setAttribute("confirmacion", "Provedor editado correctamente");
			} else {
				session.setAttribute("error", "No se ha editado correctamente el proveedor");
			}
	    	session.setAttribute("trabajador", user);
			return ruta;
	    }
	}
	
	@PostMapping("/producto")
	public String editarProducto(HttpSession session, Model model, @RequestParam Long id, @RequestParam String nombre, @RequestParam String lote, @RequestParam String descripcion, @RequestParam double coste, @RequestParam double venta, @RequestParam Long proveedor, @RequestParam String codigo, @RequestParam Integer stock, @RequestParam String devolucion) {
		Trabajador user = (Trabajador) session.getAttribute("trabajador");
		Producto nuevoProducto = repositorioProducto.findByid(id);
		Producto existente = repositorioProducto.findBylote(lote);
		Proveedor prove = repositorioProveedor.findByid(proveedor);
		CodigoSAS cod = repositorioCodigo.findBycodigo(codigo);
		if (existente != null && !existente.equals(nuevoProducto)) {
	        model.addAttribute("error", "El lote ya está registrado en otro producto");
	        session.setAttribute("trabajador", user);
	        return "administrador/editar-producto";
	    } else {
	    	nuevoProducto.setNombre(nombre);
	    	nuevoProducto.setLote(lote);
	    	nuevoProducto.setDescripcion(descripcion);
	    	nuevoProducto.setPrecio(venta);
	    	nuevoProducto.setCoste(coste);
	    	nuevoProducto.setProveedor(prove);
	    	nuevoProducto.setStock(stock);
	    	nuevoProducto.setCodigoAsociado(cod);
	    	nuevoProducto.setDevolución(devolucion);
	    	nuevoProducto.setEstado("activo");
	    	cod.getProductos().add(nuevoProducto);
	    	repositorioProducto.save(nuevoProducto);
	    	repositorioCodigo.save(cod);
	    	if (nuevoProducto.getLote() == lote) {
				model.addAttribute("confirmacion", "Producto editado correctamente");
			} else {
				model.addAttribute("error", "No se ha guardado correctamente el producto");
			}
	    	session.setAttribute("trabajador", user);
			return "administrador/editar-producto";
	    }
	}
	
	@PostMapping("/revision")
	public String editarRevision(HttpSession session, Model model, @RequestParam Long id, @RequestParam Long cita, @RequestParam String descripcion, @RequestParam Long hijo ) {
		Cliente user = (Cliente) session.getAttribute("usuario");
		Revision nuevaRevision = repositorioRevision.findByid(id);
		Cliente solicitante = user;
		Hijo paciente = repositorioHijo.findByid(hijo);
		Cita fecha = repositorioCita.findByid(cita);
		if (fecha.getEstado() == null || !user.equals(solicitante)) {
	        model.addAttribute("error", "No se puede editar la cita");
	        session.setAttribute("usuario", user);
	        return "registrado/editar-cita";
	    } else {   	
	    	nuevaRevision.setCita(fecha);
	    	nuevaRevision.setDescripcion(descripcion);
	    	nuevaRevision.setPaciente(paciente);
	    	nuevaRevision.setSolicitante(solicitante);
	    	//solicitante.getCitas().add(nuevaRevision);
	    	//paciente.getRevisiones().add(nuevaRevision);
	    	fecha.setEstado("ocupada");
	    	repositorioRevision.save(nuevaRevision);
	    	repositorioCita.save(fecha);
	    	//repositorioHijo.save(paciente);
	    	//repositorioCliente.save(solicitante);
	    	session.setAttribute("usuario", user);
			return "redirect:/registrado/citas";
	    }
	}
}
