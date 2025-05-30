package com.proyectofinal.OrtoLiberi.controladores.administrador;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
import com.proyectofinal.OrtoLiberi.entidades.personas.SolicitanteEmpleo;
import com.proyectofinal.OrtoLiberi.entidades.personas.Trabajador;
import com.proyectofinal.OrtoLiberi.entidades.procesos.AusenciaTrabajador;
import com.proyectofinal.OrtoLiberi.repositorios.elementos.RepositorioCita;
import com.proyectofinal.OrtoLiberi.repositorios.elementos.RepositorioCodigoSAS;
import com.proyectofinal.OrtoLiberi.repositorios.elementos.RepositorioFabricacion;
import com.proyectofinal.OrtoLiberi.repositorios.elementos.RepositorioMaterial;
import com.proyectofinal.OrtoLiberi.repositorios.elementos.RepositorioProducto;
import com.proyectofinal.OrtoLiberi.repositorios.elementos.RepositorioRevision;
import com.proyectofinal.OrtoLiberi.repositorios.pedidos.RepositorioPedidoCliente;
import com.proyectofinal.OrtoLiberi.repositorios.pedidos.RepositorioPedidoFabricacion;
import com.proyectofinal.OrtoLiberi.repositorios.pedidos.RepositorioPedidoProveedor;
import com.proyectofinal.OrtoLiberi.repositorios.personas.RepositorioCliente;
import com.proyectofinal.OrtoLiberi.repositorios.personas.RepositorioHijo;
import com.proyectofinal.OrtoLiberi.repositorios.personas.RepositorioProveedor;
import com.proyectofinal.OrtoLiberi.repositorios.personas.RepositorioSolicitanteEmpleo;
import com.proyectofinal.OrtoLiberi.repositorios.personas.RepositorioTrabajador;
import com.proyectofinal.OrtoLiberi.repositorios.procesos.RepositorioAusenciaTrabajador;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/administrador")
public class CARedireccion{

	 private static final String VISTA_INICIAL = "administrador/administracion";
	 private static final String VISTA_ALMACEN = "administrador/almacen";
	 private static final String VISTA_AGENDA = "administrador/agenda";
	 private static final String VISTA_PEDIDOS = "administrador/pedidos";
	 private static final String VISTA_TALLER = "administrador/taller";
	 private static final String VISTA_LISTADO = "administrador/listado";
	 private static final String VISTA_BAJAS = "administrador/bajas";
	 private static final String VISTA_CODIGOS = "administrador/codigos";
	 private static final String VISTA_VOLVER = "redirect:/";
	 
	 private static final String NUEVO_PRODUCTO = "administrador/formulario-creacion/nuevo-producto";
	 private static final String NUEVO_MATERIAL = "administrador/formulario-creacion/nuevo-material";
	 private static final String NUEVA_BAJA = "administrador/formulario-creacion/nueva-baja";
	 private static final String NUEVO_TRABAJADOR = "administrador/formulario-creacion/nuevo-empleado";
	 private static final String NUEVO_PROVEEDOR = "administrador/formulario-creacion/nuevo-proveedor";
	 private static final String NUEVO_PEDIDO_CLIENTE = "administrador/formulario-creacion/nuevo-pedido-cliente";
	 private static final String NUEVO_PEDIDO_PROVEEDOR = "administrador/formulario-creacion/nuevo-pedido-proveedor";
	 private static final String NUEVO_PEDIDO_FABRICACION = "administrador/formulario-creacion/nuevo-pedido-fabricacion";
	 private static final String NUEVA_CITA = "administrador/formulario-creacion/nueva-cita";
	 private static final String NUEVA_FABRICACION = "administrador/formulario-creacion/nueva-fabricacion";
	 private static final String NUEVO_CODIGO = "administrador/formulario-creacion/nuevo-codigo";
	 
	 @Autowired
	 private RepositorioPedidoFabricacion repositorioPedidoFabricacion;
	 private RepositorioAusenciaTrabajador repositorioAusenciaTrabajador;
	 private RepositorioPedidoProveedor repositorioPedidoProveedor;
	 private RepositorioProducto repositorioProducto;
	 private RepositorioMaterial repositorioMaterial;
	 private RepositorioPedidoCliente repositorioPedidoCliente;
	 private RepositorioFabricacion repositorioFabricacion;
	 private RepositorioCliente repositorioCliente;
	 private RepositorioHijo repositorioHijo;
	 private RepositorioTrabajador repositorioTrabajador;
	 private RepositorioSolicitanteEmpleo repositorioSolicitanteEmpleo;
	 private RepositorioProveedor repositorioProveedor;
	 private RepositorioCodigoSAS repositorioCodigo;
	 private RepositorioCita repositorioCita;
	 private RepositorioRevision repositorioRevision;
	 
	 
	 //Mostrar Páginas Generales
	 
	 @GetMapping("/inicio") 
	  public String mostrarInicioAdministracion(HttpSession session) { 
		  System.out.println("¡El controlador ha recibido la solicitud para el inicio de administracion!");
		  Trabajador trabajador = (Trabajador) session.getAttribute("trabajador");
		  LocalDate hoy = LocalDate.now();
		  List <PedidoFabricacion> trabajos = repositorioPedidoFabricacion.findAll();
		  List <PedidoFabricacion> trabajos_taller = null;
		  for (PedidoFabricacion trabajo : trabajos) {
			  if (trabajo.getEstado() != "entregado" && trabajo.getEstado() != "cancelado" ) {
				  trabajos_taller.add(trabajo);
			  }
		  }
		  List <PedidoProveedor> pedidos = repositorioPedidoProveedor.findAll();
		  List <PedidoProveedor> pedidos_pendientes = null;
		  for (PedidoProveedor pedido : pedidos) {
			  if (pedido.getEstado() != "recibido" && pedido.getEstado() != "cancelado" ) {
				  pedidos_pendientes.add(pedido);
			  }
		  }
		  List <AusenciaTrabajador> ausencias_trabajadores = repositorioAusenciaTrabajador.findAll();
		  List <AusenciaTrabajador> ausencias = null;
		  for (AusenciaTrabajador ausencia : ausencias_trabajadores) {
			  LocalDate fechaInicio = ausencia.getBaja();
			  LocalDate fechaFin = ausencia.getAlta();
			  if (!hoy.isBefore(fechaInicio) && !hoy.isAfter(fechaFin)) {
				  ausencias.add(ausencia);
			  }
		  }
		  session.setAttribute("trabajador", trabajador);
		  session.setAttribute("trabajos_taller", trabajos_taller);
		  session.setAttribute("pedidos_pendientes", pedidos_pendientes);
		  session.setAttribute("ausencias", ausencias);
		  return VISTA_INICIAL; // Redirige a administracion.jsp en la carpeta administrador
	 }
	 
	 @GetMapping("/almacen") 
	  public String mostrarAlmacen(HttpSession session) { 
		  System.out.println("¡El controlador ha recibido la solicitud para el almacen!");
		  Trabajador trabajador = (Trabajador) session.getAttribute("trabajador");
		  List <Producto>  productos = repositorioProducto.findAll();
		  List <Material>  materiales = repositorioMaterial.findAll();
		  session.setAttribute("trabajador", trabajador);
		  session.setAttribute("productos", productos);
		  session.setAttribute("materiales", materiales);
		  return VISTA_ALMACEN; // Redirige a almacen.jsp en la carpeta administrador
	 }
	 
	 @GetMapping("/pedidos") 
	  public String mostrarPedidos(HttpSession session) { 
		  System.out.println("¡El controlador ha recibido la solicitud para el listado de pedidos!");
		  Trabajador trabajador = (Trabajador) session.getAttribute("trabajador");
		  List <PedidoCliente>  pedidos_clientes = repositorioPedidoCliente.findAll();
		  List <PedidoProveedor>  pedidos_proveedores = repositorioPedidoProveedor.findAll();
		  session.setAttribute("trabajador", trabajador);
		  session.setAttribute("pedidos_clientes", pedidos_clientes);
		  session.setAttribute("pedidos_proveedores", pedidos_proveedores);
		  return VISTA_PEDIDOS; // Redirige a pedidos.jsp en la carpeta administrador
	 }
	 
	 @GetMapping("/taller") 
	  public String mostrarTaller(HttpSession session) { 
		  System.out.println("¡El controlador ha recibido la solicitud para el listado del taller!");
		  Trabajador trabajador = (Trabajador) session.getAttribute("trabajador");
		  List <Fabricacion> fabricaciones = repositorioFabricacion.findAll();
		  List <PedidoFabricacion> pedidos = repositorioPedidoFabricacion.findAll();
		  List <PedidoFabricacion> pedidos_actuales = null, pedidos_historicos = null;
		  for (PedidoFabricacion pedido : pedidos) {
			  if(pedido.getEstado() == "entregado" || pedido.getEstado() == "cancelado") {
				  pedidos_historicos.add(pedido);
			  } else {
				  pedidos_actuales.add(pedido);
			  }
		  }
		  session.setAttribute("trabajador", trabajador);
		  session.setAttribute("pedidos_actuales", pedidos_actuales);
		  session.setAttribute("pedidos_historicos", pedidos_historicos);
		  session.setAttribute("fabricaciones", fabricaciones);
		  return VISTA_TALLER; // Redirige a taller.jsp en la carpeta administrador
	 }
	 
	 @GetMapping("/listado") 
	  public String mostrarListados(HttpSession session) { 
		  System.out.println("¡El controlador ha recibido la solicitud para el listado de personas relacionadas con la empresa!");
		  Trabajador trabajador = (Trabajador) session.getAttribute("trabajador");
		  List <Cliente> clientela = repositorioCliente.findAll();
		  List <Cliente> clientes = null;
		  List <Hijo> lista_pacientes = repositorioHijo.findAll();
		  List <Hijo> pacientes = null;
		  List <Trabajador> plantilla = repositorioTrabajador.findAll();
		  List <Trabajador> trabajadores = null;
		  List <SolicitanteEmpleo> solicitantes = repositorioSolicitanteEmpleo.findAll();
		  List <Proveedor> lista_proveedores = repositorioProveedor.findAll();
		  List <Proveedor> proveedores = null;
		  for (Cliente cliente : clientela) {
			  if (cliente.getEstado() == "activo") {
				  clientes.add(cliente);
			  }
		  }
		  for (Hijo hijo : lista_pacientes) {
			  if (hijo.getTutor().getEstado() == "activo" && hijo.getEstado() == "activo") {
				  pacientes.add(hijo);
			  }
		  }
		  for (Trabajador trabajadora : plantilla) {
			  if (trabajadora.getEstado() != "inactivo") {
				  trabajadores.add(trabajadora);
			  }
		  }
		  for (Proveedor proveedor : lista_proveedores) {
			  if (proveedor.getEstado() != "cerrado") {
				  proveedores.add(proveedor);
			  }
		  }
		  session.setAttribute("trabajador", trabajador);
		  session.setAttribute("clientes", clientes);
		  session.setAttribute("pacientes", pacientes);
		  session.setAttribute("trabajadores", trabajadores);
		  session.setAttribute("solicitantes", solicitantes);
		  session.setAttribute("proveedores", proveedores);
		  return VISTA_LISTADO; // Redirige a listado.jsp en la carpeta administrador
	 }
	 
	 @GetMapping("/bajas") 
	  public String mostrarBajas(HttpSession session) { 
		  System.out.println("¡El controlador ha recibido la solicitud para el listado de codigos del SAS!");
		  Trabajador trabajador = (Trabajador) session.getAttribute("trabajador");
		  LocalDate hoy = LocalDate.now();
		  List <AusenciaTrabajador> ausencias = repositorioAusenciaTrabajador.findAll();
		  List <AusenciaTrabajador> proximas = null, actuales = null, pasadas = null;
		  for (AusenciaTrabajador ausencia : ausencias) {
			  LocalDate fechaInicio = ausencia.getBaja();
			  LocalDate fechaFin = ausencia.getAlta();
			  if (!hoy.isBefore(fechaInicio) && !hoy.isAfter(fechaFin)) {
				  actuales.add(ausencia);
			  }
			  if (hoy.isBefore(fechaInicio)) {
				  proximas.add(ausencia);
			  }
			  if (hoy.isAfter(fechaFin)) {
				  pasadas.add(ausencia);
			  }
		  }
		  session.setAttribute("trabajador", trabajador);
		  session.setAttribute("actuales", actuales);
		  session.setAttribute("proximas", proximas);
		  session.setAttribute("pasadas", pasadas);
		  return VISTA_BAJAS; // Redirige a bajas.jsp en la carpeta administrador
	 }
	 
	 @GetMapping("/codigos") 
	  public String mostrarCodigos(HttpSession session) { 
		  System.out.println("¡El controlador ha recibido la solicitud para el listado de bajas de trabajadores!");
		  Trabajador trabajador = (Trabajador) session.getAttribute("trabajador");
		  List <CodigoSAS> codigos = repositorioCodigo.findAll();
		  List <CodigoSAS> codigos_actuales = null, codigos_viejos = null;
		  for (CodigoSAS codigo : codigos) {
			  if(codigo.getEstado() == "activo") {
				  codigos_actuales.add(codigo);
			  } else {
				  codigos_viejos.add(codigo);
			  }
		  }
		  session.setAttribute("trabajador", trabajador);
		  session.setAttribute("codigos_actuales", codigos_actuales);
		  session.setAttribute("codigos_viejos", codigos_viejos);
		  return VISTA_CODIGOS; // Redirige a codigos.jsp en la carpeta administrador
	 }
	 
	 @GetMapping("/agenda") 
	  public String mostrarAgenda(HttpSession session) { 
		  System.out.println("¡El controlador ha recibido la solicitud para la agenda!");
		  Trabajador trabajador = (Trabajador) session.getAttribute("trabajador");
		  LocalDate hoy = LocalDate.now();
		  List <Cita> listado_citas = repositorioCita.findAll();
		  List <Cita> citas = null;
		  List <Revision> listado_revisiones = repositorioRevision.findAll();
		  List <Revision> revisiones = null;
		  for (Cita cita : listado_citas) {
			  if(cita.getEstado() == "libre" || cita.getFecha().isAfter(hoy)) {
				  citas.add(cita);
			  }
		  }
		  for (Revision revision : listado_revisiones) {
			  if(revision.getCita().getFecha().isAfter(hoy)) {
				  revisiones.add(revision);
			  }
		  }
		  session.setAttribute("trabajador", trabajador);
		  session.setAttribute("revisiones", revisiones);
		  session.setAttribute("citas", citas);
		  return VISTA_AGENDA; // Redirige a agenda.jsp en la carpeta administrador
	 }
	 
	//Mostrar Páginas de creación de elementos
	
	 @GetMapping("/nueva-baja") 
	  public String mostrarNuevaBaja(HttpSession session) { 
		  System.out.println("¡El controlador ha recibido la solicitud para crear una nueva baja de un trabajador!");
		  Trabajador trabajador = (Trabajador) session.getAttribute("trabajador");
		  List <Trabajador> plantilla = repositorioTrabajador.findAll();
		  List <Trabajador> tecnicos = null;
		  for (Trabajador empleado : plantilla) {
			  if (empleado.getEstado() == "activo") {
				  tecnicos.add(empleado);
			  }
		  }
		  session.setAttribute("trabajador", trabajador);
		  session.setAttribute("tecnicos", tecnicos);
		  return NUEVA_BAJA; // Redirige a nueva-baja.jsp en la carpeta formulario-creacion dentro de la carpeta administrador
	 }
	 
	 @GetMapping("/nuevo-trabajador") 
	  public String mostrarNuevoTrabajador(HttpSession session) { 
		  System.out.println("¡El controlador ha recibido la solicitud para crear un nuevo trabajador!");
		  Trabajador trabajador = (Trabajador) session.getAttribute("trabajador");
		  session.setAttribute("trabajador", trabajador);
		  return NUEVO_TRABAJADOR; // Redirige a nuevo-empleado.jsp en la carpeta formulario-creacion dentro de la carpeta administrador
	 }
	 
	 @GetMapping("/nuevo-proveedor") 
	  public String mostrarNuevoProveedor(HttpSession session) { 
		  System.out.println("¡El controlador ha recibido la solicitud para crear un nuevo proveedor!");
		  Trabajador trabajador = (Trabajador) session.getAttribute("trabajador");
		  session.setAttribute("trabajador", trabajador);
		  return NUEVO_PROVEEDOR; // Redirige a nuevo-proveedor.jsp en la carpeta formulario-creacion dentro de la carpeta administrador
	 }
	 
	 @GetMapping("/nuevo-codigo") 
	  public String mostrarNuevoCodigo(HttpSession session) { 
		  System.out.println("¡El controlador ha recibido la solicitud para crear un nuevo código SAS!");
		  Trabajador trabajador = (Trabajador) session.getAttribute("trabajador");
		  session.setAttribute("trabajador", trabajador);
		  return NUEVO_CODIGO; // Redirige a nuevo-codigo.jsp en la carpeta formulario-creacion dentro de la carpeta administrador
	 }
	 
	 @GetMapping("/nueva-cita") 
	  public String mostrarNuevaCita(HttpSession session) { 
		  System.out.println("¡El controlador ha recibido la solicitud para crear una nueva cita!");
		  Trabajador trabajador = (Trabajador) session.getAttribute("trabajador");
		  List <Trabajador> plantilla = repositorioTrabajador.findAll();
		  List <Trabajador> tecnicos = null;
		  for (Trabajador empleado : plantilla) {
			  if (empleado.getEstado() == "activo") {
				  tecnicos.add(empleado);
			  }
		  }
		  session.setAttribute("trabajador", trabajador);
		  session.setAttribute("tecnicos", tecnicos);
		  return NUEVA_CITA; // Redirige a nueva-cita.jsp en la carpeta formulario-creacion dentro de la carpeta administrador
	 }
	 
	 @GetMapping("/nueva-fabricacion") 
	  public String mostrarNuevaFabricacion(HttpSession session) { 
		  System.out.println("¡El controlador ha recibido la solicitud para crear una nueva fabricacion!");
		  Trabajador trabajador = (Trabajador) session.getAttribute("trabajador");
		  List <Trabajador> plantilla = repositorioTrabajador.findAll();
		  List <Trabajador> trabajadores = null;
		  List <Hijo> lista_pacientes = repositorioHijo.findAll();
		  List <Hijo> pacientes = null;
		  List <CodigoSAS> lista_codigos = repositorioCodigo.findAll();
		  List <CodigoSAS> codigos = null;
		  for (Trabajador empleado : plantilla) {
			  if (empleado.getEstado() == "activo") {
				  trabajadores.add(empleado);
			  }
		  }
		  for (Hijo hijo : lista_pacientes) {
			  if (hijo.getTutor().getEstado() == "activo" && hijo.getEstado() == "activo") {
				  pacientes.add(hijo);
			  }
		  }
		  for (CodigoSAS codigo : lista_codigos) {
			  if(codigo.getEstado() == "activo") {
				  codigos.add(codigo);
			  }
		  }
		  session.setAttribute("trabajador", trabajador);
		  session.setAttribute("tabajadores", trabajadores);
		  session.setAttribute("pacientes", pacientes);
		  session.setAttribute("codigos", codigos);
		  return NUEVA_FABRICACION; // Redirige a nueva-fabricacion.jsp en la carpeta formulario-creacion dentro de la carpeta administrador
	 }
	 
	 @GetMapping("/nuevo-pedido-fabricacion") 
	  public String mostrarNuevoPedidoFabricacion(HttpSession session) { 
		  System.out.println("¡El controlador ha recibido la solicitud para crear una nueva fabricacion!");
		  Trabajador trabajador = (Trabajador) session.getAttribute("trabajador");
		  List <Fabricacion> lista_fabricaciones = repositorioFabricacion.findAll();
		  List <Fabricacion> fabricaciones = null;
		  List <Cliente> clientela = repositorioCliente.findAll();
		  List <Cliente> clientes = null;
		  for (Cliente cliente : clientela) {
			  if (cliente.getEstado() == "activo") {
				  clientes.add(cliente);
			  }
		  }
		  for (Fabricacion fabricacion : lista_fabricaciones) {
			  if (fabricacion.getEstado() != "asignado") {
				  fabricaciones.add(fabricacion);
			  }
		  }
		  session.setAttribute("trabajador", trabajador);
		  session.setAttribute("clientes", clientes);
		  session.setAttribute("fabricaciones", fabricaciones);
		  return NUEVO_PEDIDO_FABRICACION; // Redirige a nuevo-pedido-fabricacion.jsp en la carpeta formulario-creacion dentro de la carpeta administrador
	 }
	 
	 @GetMapping("/nuevo-pedido-cliente") 
	  public String mostrarNuevoPedidoCliente(HttpSession session) { 
		  System.out.println("¡El controlador ha recibido la solicitud para crear una nueva fabricacion!");
		  Trabajador trabajador = (Trabajador) session.getAttribute("trabajador");
		  List <Producto> lista_productos = repositorioProducto.findAll();
		  List <Producto> productos = null;
		  List <Cliente> clientela = repositorioCliente.findAll();
		  List <Cliente> clientes = null;
		  for (Cliente cliente : clientela) {
			  if (cliente.getEstado() == "activo") {
				  clientes.add(cliente);
			  }
		  }
		  for (Producto producto : lista_productos) {
			  if (producto.getEstado() == "activo") {
				  productos.add(producto);
			  }
		  }
		  session.setAttribute("trabajador", trabajador);
		  session.setAttribute("clientes", clientes);
		  session.setAttribute("productos", productos);
		  return NUEVA_FABRICACION; // Redirige a nuevo-pedido-cliente.jsp en la carpeta formulario-creacion dentro de la carpeta administrador
	 }
	 
	 @GetMapping("/nuevo-pedido-proveedor") 
	  public String mostrarNuevoPedidoProveedor(HttpSession session) { 
		  System.out.println("¡El controlador ha recibido la solicitud para crear una nueva fabricacion!");
		  Trabajador trabajador = (Trabajador) session.getAttribute("trabajador");
		  List <Producto> lista_productos = repositorioProducto.findAll();
		  List <Producto> productos = null;
		  List <Material> lista_materiales = repositorioMaterial.findAll();
		  List <Material> materiales = null;
		  List <Proveedor> listado_proveedores = repositorioProveedor.findAll();
		  List <Proveedor> proveedores = null;
		  for (Proveedor proveedor : listado_proveedores) {
			  if (proveedor.getEstado() == "normal") {
				  proveedores.add(proveedor);
			  }
		  }
		  for (Producto producto : lista_productos) {
			  if (producto.getEstado() == "activo") {
				  productos.add(producto);
			  }
		  }
		  for (Material material : lista_materiales) {
			  if (material.getEstado() == "activo") {
				  materiales.add(material);
			  }
		  }
		  session.setAttribute("trabajador", trabajador);
		  session.setAttribute("proveedores", proveedores);
		  session.setAttribute("productos", productos);
		  session.setAttribute("materiales", materiales);
		  return NUEVO_PEDIDO_PROVEEDOR; // Redirige a nuevo-pedido-proveedor.jsp en la carpeta formulario-creacion dentro de la carpeta administrador
	 }
	 
	 @GetMapping("/nuevo-material") 
	  public String mostrarNuevoMaterial(HttpSession session) { 
		  System.out.println("¡El controlador ha recibido la solicitud para crear un nuevo material!");
		  Trabajador trabajador = (Trabajador) session.getAttribute("trabajador");
		  List <Proveedor> listado_proveedores = repositorioProveedor.findAll();
		  List <Proveedor> proveedores = null;
		  for (Proveedor proveedor : listado_proveedores) {
			  if (proveedor.getEstado() == "normal") {
				  proveedores.add(proveedor);
			  }
		  }
		  
		  session.setAttribute("trabajador", trabajador);
		  session.setAttribute("proveedores", proveedores);
		  return NUEVO_MATERIAL; // Redirige a nuevo-material.jsp en la carpeta formulario-creacion dentro de la carpeta administrador
	 }
	 
	 @GetMapping("/nuevo-producto") 
	  public String mostrarNuevoProducto(HttpSession session) { 
		  System.out.println("¡El controlador ha recibido la solicitud para crear un nuevo producto!");
		  Trabajador trabajador = (Trabajador) session.getAttribute("trabajador");
		  List <Proveedor> listado_proveedores = repositorioProveedor.findAll();
		  List <Proveedor> proveedores = null;
		  List <CodigoSAS> lista_codigos = repositorioCodigo.findAll();
		  List <CodigoSAS> codigos = null;
		  for (CodigoSAS codigo : lista_codigos) {
			  if(codigo.getEstado() == "activo") {
				  codigos.add(codigo);
			  }
		  }
		  for (Proveedor proveedor : listado_proveedores) {
			  if (proveedor.getEstado() == "normal") {
				  proveedores.add(proveedor);
			  }
		  }
		 
		  session.setAttribute("trabajador", trabajador);
		  session.setAttribute("proveedores", proveedores);
		  session.setAttribute("codigps", codigos);
		  return NUEVO_PRODUCTO; // Redirige a nuevo-producto.jsp en la carpeta formulario-creacion dentro de la carpeta administrador
	 }
	 
	//Salir
	 
	 @GetMapping("/salir") 
	 public String cerrarSesion(HttpServletRequest request, HttpServletResponse response) { 
		 System.out.println("¡El controlador ha recibido la solicitud para cerrar sesion y volver al inicio!");
		 request.getSession().invalidate(); // Invalida la sesión HTTP
		 return VISTA_VOLVER; // Redirige al index.html 
	 }

}
