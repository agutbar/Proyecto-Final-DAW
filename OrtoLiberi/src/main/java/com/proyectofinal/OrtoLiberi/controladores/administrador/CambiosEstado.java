package com.proyectofinal.OrtoLiberi.controladores.administrador;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.proyectofinal.OrtoLiberi.entidades.pedidos.PedidoCliente;
import com.proyectofinal.OrtoLiberi.entidades.pedidos.PedidoFabricacion;
import com.proyectofinal.OrtoLiberi.entidades.personas.Cliente;
import com.proyectofinal.OrtoLiberi.entidades.personas.Proveedor;
import com.proyectofinal.OrtoLiberi.entidades.personas.Trabajador;
import com.proyectofinal.OrtoLiberi.repositorios.pedidos.RepositorioPedidoCliente;
import com.proyectofinal.OrtoLiberi.repositorios.pedidos.RepositorioPedidoFabricacion;
import com.proyectofinal.OrtoLiberi.repositorios.personas.RepositorioCliente;
import com.proyectofinal.OrtoLiberi.repositorios.personas.RepositorioProveedor;
import com.proyectofinal.OrtoLiberi.repositorios.personas.RepositorioTrabajador;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/estado")
public class CambiosEstado{

	 private static final String VISTA_PEDIDO_CLIENTE = "administrador/cambio-estado/pedido-cliente";
	 private static final String VISTA_ACTIVIDAD_TRABAJADOR = "administrador/cambio-estado/actividad-trabajador";
	 private static final String VISTA_TRABAJO_TALLER = "administrador/cambio-estado/trabajo-taller";
	 private static final String VISTA_ACTIVIDAD_PROVEEDOR = "administrador/cambio-estado/actividad-proveedor";
	 private static final String VISTA_CLIENTE = "administrador/cambio-estado/estado-cliente";
	 
	 @Autowired
	 private RepositorioPedidoCliente repositorioPedidoCliente;
	 private RepositorioTrabajador repositorioTrabajador;
	 private RepositorioPedidoFabricacion repositorioPedidoFabricacion;
	 private RepositorioCliente repositorioCliente;
	 private RepositorioProveedor repositorioProveedor;
	 
	 @GetMapping("/pedido-cliente{id}") 
	 public String mostrarCambioEstadoPedidoCliente(HttpSession session, @PathVariable Long id) {
		 PedidoCliente pedido = repositorioPedidoCliente.findByid(id);
		 session.setAttribute("pedido", pedido);
		 System.out.println("¡El controlador ha recibido la solicitud para el cambio de estado del pedido de un cliente!");
		 return VISTA_PEDIDO_CLIENTE; // Redirige a pedido-cliente.jsp en la carpeta cambio-estado dentro de la carpeta administrador 
	 }
	 
	 @GetMapping("/trabajador{id}") 
	 public String mostrarCambioEstadoTrabajador(HttpSession session, @PathVariable Long id) {
		 Trabajador trabajador = repositorioTrabajador.findByid(id);
		 session.setAttribute("trabajador", trabajador);
		 System.out.println("¡El controlador ha recibido la solicitud para el cambio de estado de un trabajador!");
		 return VISTA_ACTIVIDAD_TRABAJADOR; // Redirige a actividad-trabajador.jsp en la carpeta cambio-estado dentro de la carpeta administrador
	 }
	 
	 @GetMapping("/cliente{id}") 
	 public String mostrarCambioEstadoCliente(HttpSession session, @PathVariable Long id) {
		 Cliente cliente = repositorioCliente.findByid(id);
		 session.setAttribute("cliente", cliente);
		 System.out.println("¡El controlador ha recibido la solicitud para el cambio de estado de un cliente!");
		 return VISTA_CLIENTE; // Redirige a estado-cliente.jsp en la carpeta cambio-estado dentro de la carpeta administrador 
	 }
	 
	 @GetMapping("/proveedor{id}") 
	 public String mostrarCambioEstadoProveedor(HttpSession session, @PathVariable Long id) {
		 Proveedor proveedor = repositorioProveedor.findByid(id);
		 session.setAttribute("proveedor", proveedor);
		 System.out.println("¡El controlador ha recibido la solicitud para el cambio de estado de un proveedor!");
		 return VISTA_ACTIVIDAD_PROVEEDOR; // Redirige a actividad-proveedor.jsp en la carpeta cambio-estado dentro de la carpeta administrador
	 }
	 
	 @GetMapping("/taller{id}") 
	 public String mostrarCambioEstadoTrabajoTaller(HttpSession session, @PathVariable Long id) {
		 PedidoFabricacion trabajo = repositorioPedidoFabricacion.findByid(id);
		 session.setAttribute("trabajo", trabajo);
		 System.out.println("¡El controlador ha recibido la solicitud para el cambio de estado de un trabajo de taller!");
		 return VISTA_TRABAJO_TALLER; // Redirige a trabajo-taller.jsp en la carpeta cambio-estado dentro de la carpeta administrador
	 }
	 
	 @PostMapping("/pedido-cliente")
	 public String cambiarEstadoPedidoCliente(Model model, @RequestParam Long id, @RequestParam String estado) {
		 PedidoCliente pedido = repositorioPedidoCliente.findByid(id);
		 if(pedido.getEstado().equals(estado)) {
			 model.addAttribute("error", "Ha seleccionado el mismo estado que ya estaba asignado");
		 } else {
			 pedido.setEstado(estado);
			 repositorioPedidoCliente.save(pedido);
			 if (pedido.getEstado().equals(estado)) {
				 model.addAttribute("confirmacion", "El cambio de estado se ha realizado con éxito");
			 } else {
				 model.addAttribute("error", "El cambio de estado no se ha podido realizar");
			 }
		 }
		 return VISTA_PEDIDO_CLIENTE;
	 }
	 
	 @PostMapping("/trabajador")
	 public String cambiarEstadoTrabajador(Model model, @RequestParam Long id, @RequestParam String estado) {
		 Trabajador trabajador = repositorioTrabajador.findByid(id);
		 if(trabajador.getEstado().equals(estado)) {
			 model.addAttribute("error", "Ha seleccionado el mismo estado que ya estaba asignado");
		 } else {
			 trabajador.setEstado(estado);
			 repositorioTrabajador.save(trabajador);
			 if (trabajador.getEstado().equals(estado)) {
				 model.addAttribute("confirmacion", "El cambio de estado se ha realizado con éxito");
			 } else {
				 model.addAttribute("error", "El cambio de estado no se ha podido realizar");
			 }
		 }
		 return VISTA_ACTIVIDAD_TRABAJADOR;
	 }
	 
	 @PostMapping("/taller")
	 public String cambiarEstadoPedidoTaller(Model model, @RequestParam Long id, @RequestParam String estado) {
		 PedidoFabricacion trabajo = repositorioPedidoFabricacion.findByid(id);
		 if(trabajo.getEstado().equals(estado)) {
			 model.addAttribute("error", "Ha seleccionado el mismo estado que ya estaba asignado");
		 } else {
			 trabajo.setEstado(estado);
			 repositorioPedidoFabricacion.save(trabajo);
			 if (trabajo.getEstado().equals(estado)) {
				 model.addAttribute("confirmacion", "El cambio de estado se ha realizado con éxito");
			 } else {
				 model.addAttribute("error", "El cambio de estado no se ha podido realizar");
			 }
		 }
		 return VISTA_TRABAJO_TALLER;
	 }
	 
	 @PostMapping("/cliente") 
	 public String cambiarEstadoCliente(Model model, HttpSession session, @RequestParam Long id, @RequestParam String estado) {
		 Cliente cliente = repositorioCliente.findByid(id);
		 if(cliente.getEstado().equals(estado)) {
			 model.addAttribute("error", "Ha seleccionado el mismo estado que ya estaba asignado");
		 } else {
			 cliente.setEstado(estado);
			 repositorioCliente.save(cliente);
			 if (cliente.getEstado().equals(estado)) {
				 model.addAttribute("confirmacion", "El cambio de estado se ha realizado con éxito");
			 } else {
				 model.addAttribute("error", "El cambio de estado no se ha podido realizar");
			 }
		 }
		 return VISTA_CLIENTE; // Redirige a estado-cliente.jsp en la carpeta cambio-estado dentro de la carpeta administrador 
	 }
	 
	 @PostMapping("/proveedor") 
	 public String cambiarEstadoProveedor(Model model, HttpSession session, @RequestParam Long id, @RequestParam String estado) {
		 Proveedor proveedor = repositorioProveedor.findByid(id);
		 if(proveedor.getEstado().equals(estado)) {
			 model.addAttribute("error", "Ha seleccionado el mismo estado que ya estaba asignado");
		 } else {
			 proveedor.setEstado(estado);
			 repositorioProveedor.save(proveedor);
			 if (proveedor.getEstado().equals(estado)) {
				 model.addAttribute("confirmacion", "El cambio de estado se ha realizado con éxito");
			 } else {
				 model.addAttribute("error", "El cambio de estado no se ha podido realizar");
			 }
		 }
		 return VISTA_ACTIVIDAD_PROVEEDOR; // Redirige a actividad-proveedor.jsp en la carpeta cambio-estado dentro de la carpeta administrador
	 }
}
