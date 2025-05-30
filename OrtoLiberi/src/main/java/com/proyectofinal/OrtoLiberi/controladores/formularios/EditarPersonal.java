package com.proyectofinal.OrtoLiberi.controladores.formularios;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.proyectofinal.OrtoLiberi.EncriptadoPasswords;
import com.proyectofinal.OrtoLiberi.entidades.elementos.Fabricacion;
import com.proyectofinal.OrtoLiberi.entidades.elementos.Revision;
import com.proyectofinal.OrtoLiberi.entidades.pedidos.PedidoCliente;
import com.proyectofinal.OrtoLiberi.entidades.pedidos.PedidoFabricacion;
import com.proyectofinal.OrtoLiberi.entidades.personas.Cliente;
import com.proyectofinal.OrtoLiberi.entidades.personas.Hijo;
import com.proyectofinal.OrtoLiberi.entidades.personas.Trabajador;
import com.proyectofinal.OrtoLiberi.entidades.procesos.AusenciaTrabajador;
import com.proyectofinal.OrtoLiberi.entidades.procesos.Compra;
import com.proyectofinal.OrtoLiberi.repositorios.procesos.RepositorioAusenciaTrabajador;
import com.proyectofinal.OrtoLiberi.repositorios.personas.RepositorioCliente;
import com.proyectofinal.OrtoLiberi.repositorios.procesos.RepositorioCompra;

import jakarta.servlet.http.HttpSession;

import com.proyectofinal.OrtoLiberi.repositorios.elementos.RepositorioFabricacion;
import com.proyectofinal.OrtoLiberi.repositorios.personas.RepositorioHijo;
import com.proyectofinal.OrtoLiberi.repositorios.pedidos.RepositorioPedidoCliente;
import com.proyectofinal.OrtoLiberi.repositorios.pedidos.RepositorioPedidoFabricacion;
import com.proyectofinal.OrtoLiberi.repositorios.elementos.RepositorioRevision;
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
	
	@Autowired
	private RepositorioCompra repositorioCompra;
	
	@Autowired
	private RepositorioPedidoFabricacion repositorioPedidoFabricacion;
	
	@Autowired
	private RepositorioPedidoCliente repositorioPedidoCliente;
	
	@Autowired
	private RepositorioRevision repositorioCita;
	
	@Autowired
	private RepositorioAusenciaTrabajador repositorioAusenciaTrabajador;
	
	@Autowired
	private RepositorioFabricacion repositorioFabricacion;
	
	@PostMapping("/hijo")
	public String editarHijo(Model model, @RequestParam Long id_hijo, @RequestParam String nombre, @RequestParam String apellidos, @RequestParam LocalDate nacimiento) {
		Cliente tutor = (Cliente) model.getAttribute("usuario");
		Hijo hijoA = repositorioHijo.findByid(id_hijo);
		Hijo hijo = new Hijo();
		hijo.setNombre(nombre);
		hijo.setApellidos(apellidos);
		hijo.setNacimiento(nacimiento);
		hijo.setTutor(tutor);
		repositorioHijo.delete(hijoA);
		repositorioHijo.save(hijo);
		List <Hijo> hijos = tutor.getMenores();
		hijos.remove(hijoA);
		hijos.add(hijo);
		tutor.setMenores(hijos);
		repositorioCliente.save(tutor);
		model.addAttribute("confirmacion", "Los datos han sido editados correctamente");
		return "registrado/datos";
	}
	
	@PostMapping("/datos")
	public String editarUsuario(Model model, HttpSession session, @RequestParam String nombre, @RequestParam String apellidos, @RequestParam String telefono, @RequestParam String direccion, @RequestParam String correo, @RequestParam String usuario, @RequestParam String password) {
		Cliente usuarioEditado = (Cliente) model.getAttribute("usuario");
		Cliente correoCliente = repositorioCliente.findBycorreo(correo);
		Cliente usuarioCliente = repositorioCliente.findByusuario(usuario);
		
		if ((usuarioEditado.getCorreo() != correo && correoCliente != null) || (usuarioEditado.getUsuario() != usuario && usuarioCliente != null)) {
	        model.addAttribute("error", "Algunos de los nuevos datos introducidos ya están en uso por otros usuarios");
	        return "registrado/datos";
	    } else {
	    	usuarioEditado.setNombre(nombre);
	    	usuarioEditado.setApellidos(apellidos);
	    	usuarioEditado.setTelefono(telefono);
	    	usuarioEditado.setCorreo(correo);
	    	usuarioEditado.setDireccion(direccion);
	    	usuarioEditado.setUsuario(usuario);
	    	usuarioEditado.setPassword(EncriptadoPasswords.cifrarPassword(password));
	    	List <Compra> comprasRealizadas = usuarioEditado.getCompras();
	    	if (comprasRealizadas.size() != 0) {
	    		for(Compra a : comprasRealizadas) {
	    			a.setComprador(usuarioEditado);
	    			repositorioCompra.save(a);
	    		}
	    		usuarioEditado.setCompras(comprasRealizadas);
	    	}
	    	List <PedidoFabricacion> pedidosTallerRealizadas = usuarioEditado.getProductos_taller();
	    	if (pedidosTallerRealizadas.size() != 0) {
	    		for(PedidoFabricacion a : pedidosTallerRealizadas) {
	    			a.setCliente(usuarioEditado);
	    			repositorioPedidoFabricacion.save(a);
	    		}
	    		usuarioEditado.setProductos_taller(pedidosTallerRealizadas);
	    	}
	    	List <PedidoCliente> pedidosClienteRealizadas = usuarioEditado.getPedidos();
	    	if (pedidosClienteRealizadas.size() != 0) {
	    		for(PedidoCliente a : pedidosClienteRealizadas) {
	    			a.setCliente(usuarioEditado);
	    			repositorioPedidoCliente.save(a);
	    		}
	    		usuarioEditado.setPedidos(pedidosClienteRealizadas);
	    	}
	    	List <Revision> citasRegristradas = usuarioEditado.getCitas();
	    	if (citasRegristradas.size() != 0) {
	    		for(Revision a : citasRegristradas) {
	    			a.setSolicitante(usuarioEditado);
	    			repositorioCita.save(a);
	    		}
	    		usuarioEditado.setCitas(citasRegristradas);
	    	}
	    	List <Hijo> menoresACargo = usuarioEditado.getMenores();
	    	if (menoresACargo.size() != 0) {
	    		for(Hijo a : menoresACargo) {
	    			a.setTutor(usuarioEditado);
	    			repositorioHijo.save(a);
	    		}
	    		usuarioEditado.setMenores(menoresACargo);
	    	}
	    	
			repositorioCliente.save(usuarioEditado);
			session.setAttribute("usuario", usuarioEditado.getUsuario());
			model.addAttribute("confirmacion", "Los datos han sido editados correctamente");
			return "registrado/datos";
	    }
	}
	
	@PostMapping("/trabajador")
	public String editarTrabajador(Model model, HttpSession session, @RequestParam Long id_trabajador, @RequestParam String nombre, @RequestParam String apellidos, @RequestParam LocalDate nacimiento, @RequestParam String telefono, @RequestParam String direccion, @RequestParam String correo, @RequestParam String codigo, @RequestParam String password) {
		Trabajador trabajadorEditado = repositorioTrabajador.findByid(id_trabajador);
		Trabajador trabajadorActivo = (Trabajador) model.getAttribute("trabajador");
		Trabajador correoTrabajador = repositorioTrabajador.findBycorreo(correo);
		Trabajador usuarioTrabajador = repositorioTrabajador.findBycodigo(codigo);
		
		if ((trabajadorEditado.getCorreo() != correo && correoTrabajador != null) || (trabajadorEditado.getCodigo() != codigo && usuarioTrabajador != null)) {
	        model.addAttribute("error", "Algunos de los nuevos datos introducidos ya están en uso por otros usuarios");
	        return "administrador/listado";
	    } else {
	    	trabajadorEditado.setNombre(nombre);
	    	trabajadorEditado.setApellidos(apellidos);
	    	trabajadorEditado.setTelefono(telefono);
	    	trabajadorEditado.setCorreo(correo);
	    	trabajadorEditado.setNacimiento(nacimiento);
	    	trabajadorEditado.setDireccion(direccion);
	    	trabajadorEditado.setCodigo(codigo);
	    	trabajadorEditado.setPassword(EncriptadoPasswords.cifrarPassword(password));
	    	List <Compra> ventasRealizadas = trabajadorEditado.getVentas();
	    	if (ventasRealizadas.size() != 0) {
	    		for(Compra a : ventasRealizadas) {
	    			a.setVendedor(trabajadorEditado);
	    			repositorioCompra.save(a);
	    		}
	    		trabajadorEditado.setVentas(ventasRealizadas);
	    	}
	    	List <Fabricacion> trabajosRealizados = trabajadorEditado.getTrabajos();
	    	if (trabajosRealizados.size() != 0) {
	    		for(Fabricacion a : trabajosRealizados) {
	    			a.setResponsable(trabajadorEditado);
	    			repositorioFabricacion.save(a);
	    		}
	    		trabajadorEditado.setTrabajos(trabajosRealizados);
	    	}
	    	List <AusenciaTrabajador> ausenciasAnotadas = trabajadorEditado.getAusencias();
	    	if (ausenciasAnotadas.size() != 0) {
	    		for(AusenciaTrabajador a : ausenciasAnotadas) {
	    			a.setTecnico(trabajadorEditado);
	    			repositorioAusenciaTrabajador.save(a);
	    		}
	    		trabajadorEditado.setAusencias(ausenciasAnotadas);
	    	}
	    	
			repositorioTrabajador.save(trabajadorEditado);
			model.addAttribute("confirmacion", "Los datos han sido editados correctamente");
			if (trabajadorEditado.getId().equals(trabajadorActivo.getId())) {
				session.setAttribute("trabajador", trabajadorEditado.getCodigo());
			}
			return "administrador/listado";
	    }
	}

}
