package com.proyectofinal.OrtoLiberi.controladores.administrador;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
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
import jakarta.websocket.server.PathParam;

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
	 
	 private static final String EDITAR_PRODUCTO = "administrador/formulario-edicion/editar-producto";
	 private static final String EDITAR_MATERIAL = "administrador/formulario-edicion/editar-material";
	 private static final String EDITAR_BAJA = "administrador/formulario-edicion/editar-baja";
	 private static final String EDITAR_TRABAJADOR = "administrador/formulario-edicion/editar-empleado";
	 private static final String EDITAR_PROVEEDOR = "administrador/formulario-edicion/editar-proveedor";
	 private static final String EDITAR_FABRICACION = "administrador/formulario-edicion/editar-fabricacion";
	 private static final String EDITAR_CITA = "administrador/formulario-edicion/editar-cita";
	 
	 @Autowired
	 private RepositorioPedidoFabricacion repositorioPedidoFabricacion;
	 @Autowired
	 private RepositorioAusenciaTrabajador repositorioAusenciaTrabajador;
	 @Autowired
	 private RepositorioPedidoProveedor repositorioPedidoProveedor;
	 @Autowired
	 private RepositorioProducto repositorioProducto;
	 @Autowired
	 private RepositorioMaterial repositorioMaterial;
	 @Autowired
	 private RepositorioPedidoCliente repositorioPedidoCliente;
	 @Autowired
	 private RepositorioFabricacion repositorioFabricacion;
	 @Autowired
	 private RepositorioCliente repositorioCliente;
	 @Autowired
	 private RepositorioHijo repositorioHijo;
	 @Autowired
	 private RepositorioTrabajador repositorioTrabajador;
	 @Autowired
	 private RepositorioSolicitanteEmpleo repositorioSolicitanteEmpleo;
	 @Autowired
	 private RepositorioProveedor repositorioProveedor;
	 @Autowired
	 private RepositorioCodigoSAS repositorioCodigo;
	 @Autowired
	 private RepositorioCita repositorioCita;
	 @Autowired
	 private RepositorioRevision repositorioRevision;
	 
	 
	 //Mostrar Páginas Generales
	 
	 @GetMapping("/inicio") 
	  public String mostrarInicioAdministracion(HttpSession session) { 
		  System.out.println("¡El controlador ha recibido la solicitud para el inicio de administracion!");
		  Trabajador trabajador = (Trabajador) session.getAttribute("trabajador");
		  LocalDate hoy = LocalDate.now();
		  List <PedidoFabricacion> trabajos = repositorioPedidoFabricacion.findAll();
		  List <PedidoFabricacion> trabajos_taller = new ArrayList<>();
		  for (PedidoFabricacion trabajo : trabajos) {
			  if (!trabajo.getEstado().equals("entregado") && !trabajo.getEstado().equals("cancelado")) {
				  trabajos_taller.add(trabajo);
			  }
		  }
		  List <PedidoProveedor> pedidos = repositorioPedidoProveedor.findAll();
		  List <PedidoProveedor> pedidos_pendientes = new ArrayList<>();
		  for (PedidoProveedor pedido : pedidos) {
			  if (!pedido.getEstado().equals("recibido")&& !pedido.getEstado().equals("cancelado")) {
				  pedidos_pendientes.add(pedido);
			  }
		  }
		  List <AusenciaTrabajador> ausencias_trabajadores = repositorioAusenciaTrabajador.findAll();
		  List <AusenciaTrabajador> ausencias = new ArrayList<>();
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
		  List <PedidoCliente> pedidos_clientes = repositorioPedidoCliente.findAll();
		  List <PedidoProveedor> pedidos_proveedores = repositorioPedidoProveedor.findAll();
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
		  List <PedidoFabricacion> pedidos_actuales = new ArrayList<>(), pedidos_historicos = new ArrayList<>();
		  for (PedidoFabricacion pedido : pedidos) {
			  if(pedido.getEstado().equals("entregado") || pedido.getEstado().equals("cancelado")) {
				  pedidos_historicos.add(pedido);
			  } else {
				  pedidos_actuales.add(pedido);
			  }
		  }
		  System.out.println(pedidos);
		  System.out.println(pedidos_actuales);
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
		  List <Cliente> clientes = new ArrayList<>();
		  List <Hijo> lista_pacientes = repositorioHijo.findAll();
		  List <Hijo> pacientes = new ArrayList<>();
		  List <Trabajador> plantilla = repositorioTrabajador.findAll();
		  List <Trabajador> trabajadores = new ArrayList<>();
		  List <SolicitanteEmpleo> solicitantes = repositorioSolicitanteEmpleo.findAll();
		  List <Proveedor> lista_proveedores = repositorioProveedor.findAll();
		  List <Proveedor> proveedores = new ArrayList<>();
		  for (Cliente cliente : clientela) {
			  if (cliente.getEstado().equals("activo")) {
				  clientes.add(cliente);
			  }
		  }
		  for (Hijo hijo : lista_pacientes) {
			  if (hijo.getTutor().getEstado().equals("activo") && hijo.getEstado().equals("activo")) {
				  pacientes.add(hijo);
			  }
		  }
		  for (Trabajador trabajadora : plantilla) {
			  if (!trabajadora.getEstado().equals("inactivo")) {
				  trabajadores.add(trabajadora);
			  }
		  }
		  for (Proveedor proveedor : lista_proveedores) {
			  if (!proveedor.getEstado().equals("cerrado")) {
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
		  List <AusenciaTrabajador> proximas = new ArrayList<>(), actuales =new ArrayList<>(), pasadas = new ArrayList<>();
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
		  List <CodigoSAS> codigos_actuales = new ArrayList<>(), codigos_viejos = new ArrayList<>();
		  for (CodigoSAS codigo : codigos) {
			  if(codigo.getEstado().equals("activo")) {
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
		  List <Cita> citas = new ArrayList<>();
		  List <Revision> listado_revisiones = repositorioRevision.findAll();
		  List <Revision> revisiones = new ArrayList<>();
		  for (Cita cita : listado_citas) {
			  if(cita.getEstado().equals("libre") && cita.getFecha().isAfter(hoy)) {
				  citas.add(cita);
			  }
		  }
		  for (Revision revision : listado_revisiones) {
			  if(revision.getCita().getFecha().isAfter(hoy)) {
				  revisiones.add(revision);
			  }
		  }
		  System.out.println(citas);
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
		  List <Trabajador> tecnicos = new ArrayList<>();
		  for (Trabajador empleado : plantilla) {
			  if (empleado.getEstado().equals("activo")) {
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
	 
	 @GetMapping("/nuevo_codigo") 
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
		  List <Trabajador> tecnicos = new ArrayList<>();
		  for (Trabajador empleado : plantilla) {
			  if (empleado.getEstado().equals("activo")){
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
		  List <Trabajador> trabajadores = new ArrayList<>();
		  List <Hijo> lista_pacientes = repositorioHijo.findAll();
		  List <Hijo> pacientes = new ArrayList<>();
		  List <CodigoSAS> lista_codigos = repositorioCodigo.findAll();
		  List <CodigoSAS> codigos = new ArrayList<>();
		  for (Trabajador empleado : plantilla) {
			  if (empleado.getEstado().equals("activo")) {
				  trabajadores.add(empleado);
			  }
		  }
		  for (Hijo hijo : lista_pacientes) {
			  if (hijo.getTutor().getEstado().equals("activo") && hijo.getEstado().equals("activo")) {
				  pacientes.add(hijo);
			  }
		  }
		  for (CodigoSAS codigo : lista_codigos) {
			  if(codigo.getEstado().equals("activo")) {
				  codigos.add(codigo);
			  }
		  }
		  session.setAttribute("trabajador", trabajador);
		  session.setAttribute("trabajadores", trabajadores);
		  session.setAttribute("pacientes", pacientes);
		  session.setAttribute("codigos", codigos);
		  return NUEVA_FABRICACION; // Redirige a nueva-fabricacion.jsp en la carpeta formulario-creacion dentro de la carpeta administrador
	 }
	 
	 @GetMapping("/nuevo-pedido-fabricacion") 
	  public String mostrarNuevoPedidoFabricacion(HttpSession session) { 
		  System.out.println("¡El controlador ha recibido la solicitud para crear una nueva fabricacion!");
		  Trabajador trabajador = (Trabajador) session.getAttribute("trabajador");
		  List <Fabricacion> lista_fabricaciones = repositorioFabricacion.findAll();
		  List <Fabricacion> fabricaciones = new ArrayList<>();
		  List <Cliente> clientela = repositorioCliente.findAll();
		  List <Cliente> clientes = new ArrayList<>();
		  for (Cliente cliente : clientela) {
			  if (cliente.getEstado().equals("activo")) {
				  clientes.add(cliente);
			  }
		  }
		  for (Fabricacion fabricacion : lista_fabricaciones) {
			  if (!fabricacion.getEstado().equals("asignado")) {
				  fabricaciones.add(fabricacion);
			  }
		  }
		  session.setAttribute("trabajador", trabajador);
		  session.setAttribute("clientes", clientes);
		  session.setAttribute("fabricaciones", fabricaciones);
		  return NUEVO_PEDIDO_FABRICACION; // Redirige a nuevo-pedido-fabricacion.jsp en la carpeta formulario-creacion dentro de la carpeta administrador
	 }
	 
	 @GetMapping("/nuevo_pedido_cliente") 
	  public String mostrarNuevoPedidoCliente(HttpSession session) { 
		  System.out.println("¡El controlador ha recibido la solicitud para crear una nueva fabricacion!");
		  Trabajador trabajador = (Trabajador) session.getAttribute("trabajador");
		  List <Producto> lista_productos = repositorioProducto.findAll();
		  List <Producto> productos = new ArrayList<>();
		  List <Cliente> clientela = repositorioCliente.findAll();
		  List <Cliente> clientes = new ArrayList<>();
		  for (Cliente cliente : clientela) {
			  if (cliente.getEstado().equals("activo")) {
				  clientes.add(cliente);
			  }
		  }
		  for (Producto producto : lista_productos) {
			  if (producto.getEstado().equals("activo")) {
				  productos.add(producto);
			  }
		  }
		  session.setAttribute("trabajador", trabajador);
		  session.setAttribute("clientes", clientes);
		  session.setAttribute("productos", productos);
		  return  NUEVO_PEDIDO_CLIENTE; // Redirige a nuevo-pedido-cliente.jsp en la carpeta formulario-creacion dentro de la carpeta administrador
	 }
	 
	 @GetMapping("/nuevo_pedido_proveedor") 
	  public String mostrarNuevoPedidoProveedor(HttpSession session) { 
		  System.out.println("¡El controlador ha recibido la solicitud para crear una nueva fabricacion!");
		  Trabajador trabajador = (Trabajador) session.getAttribute("trabajador");
		  List <Producto> lista_productos = repositorioProducto.findAll();
		  List <Producto> productos = new ArrayList<>();
		  List <Material> lista_materiales = repositorioMaterial.findAll();
		  List <Material> materiales = new ArrayList<>();
		  List <Proveedor> listado_proveedores = repositorioProveedor.findAll();
		  List <Proveedor> proveedores = new ArrayList<>();
		  for (Proveedor proveedor : listado_proveedores) {
			  if (proveedor.getEstado().equals("normal")) {
				  proveedores.add(proveedor);
			  }
		  }
		  for (Producto producto : lista_productos) {
			  if (producto.getEstado().equals("activo")) {
				  productos.add(producto);
			  }
		  }
		  for (Material material : lista_materiales) {
			  if (material.getEstado().equals("activo")) {
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
		  List <Proveedor> proveedores = new ArrayList<>();
		  for (Proveedor proveedor : listado_proveedores) {
			  if (proveedor.getEstado().equals("normal")) {
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
		  List <Proveedor> proveedores = new ArrayList<>();
		  List <CodigoSAS> lista_codigos = repositorioCodigo.findAll();
		  List <CodigoSAS> codigos = new ArrayList<>();
		  for (CodigoSAS codigo : lista_codigos) {
			  if(codigo.getEstado().equals("activo")) {
				  codigos.add(codigo);
			  }
		  }
		  for (Proveedor proveedor : listado_proveedores) {
			  if (proveedor.getEstado().equals("normal")) {
				  proveedores.add(proveedor);
			  }
		  }
		 
		  session.setAttribute("trabajador", trabajador);
		  session.setAttribute("proveedores", proveedores);
		  session.setAttribute("codigos", codigos);
		  return NUEVO_PRODUCTO; // Redirige a nuevo-producto.jsp en la carpeta formulario-creacion dentro de la carpeta administrador
	 }
	 
	//Mostrar Páginas de edicion de elementos
		
		 @GetMapping("/editar-baja{id}") 
		  public String editarBaja(HttpSession session, @PathVariable Long id) { 
			  System.out.println("¡El controlador ha recibido la solicitud para crear una nueva baja de un trabajador!");
			  Trabajador trabajador = (Trabajador) session.getAttribute("trabajador");
			  AusenciaTrabajador baja = repositorioAusenciaTrabajador.findByid(id);
			  List <Trabajador> plantilla = repositorioTrabajador.findAll();
			  List <Trabajador> tecnicos = new ArrayList<>();
			  for (Trabajador empleado : plantilla) {
				  if (empleado.getEstado().equals("activo")) {
					  tecnicos.add(empleado);
				  }
			  }
			  session.setAttribute("trabajador", trabajador);
			  session.setAttribute("tecnicos", tecnicos);
			  session.setAttribute("baja", baja);
			  return EDITAR_BAJA; // Redirige a editar-baja.jsp en la carpeta formulario-edicion dentro de la carpeta administrador
		 }
		 
		 @GetMapping("/editar-trabajador{id}") 
		  public String editarTrabajador(HttpSession session, @PathVariable Long id) { 
			  System.out.println("¡El controlador ha recibido la solicitud para crear un nuevo trabajador!");
			  Trabajador empleado = (Trabajador) session.getAttribute("trabajador");
			  Trabajador trabajador = repositorioTrabajador.findByid(id);
			  session.setAttribute("empleado", empleado);
			  session.setAttribute("trabajador", trabajador);
			  return EDITAR_TRABAJADOR; // Redirige a editar-empleado.jsp en la carpeta formulario-edicion dentro de la carpeta administrador
		 }
		 
		 @GetMapping("/editar-proveedor{id}") 
		  public String editarProveedor(HttpSession session, @PathVariable Long id) { 
			  System.out.println("¡El controlador ha recibido la solicitud para crear un nuevo proveedor!");
			  Trabajador trabajador = (Trabajador) session.getAttribute("trabajador");
			  Proveedor proveedor = repositorioProveedor.findByid(id);
			  session.setAttribute("trabajador", trabajador);
			  session.setAttribute("proveedor", proveedor);
			  return EDITAR_PROVEEDOR; // Redirige a editar-proveedor.jsp en la carpeta formulario-edicion dentro de la carpeta administrador
		 }
		 
		 @GetMapping("/editar-cita{id}") 
		  public String editarCita(HttpSession session, @PathVariable Long id) { 
			  System.out.println("¡El controlador ha recibido la solicitud para crear una nueva cita!");
			  Trabajador trabajador = (Trabajador) session.getAttribute("trabajador");
			  Cita cita = repositorioCita.findByid(id);
			  List <Trabajador> plantilla = repositorioTrabajador.findAll();
			  List <Trabajador> tecnicos = new ArrayList<>();
			  for (Trabajador empleado : plantilla) {
				  if (empleado.getEstado().equals("activo")) {
					  tecnicos.add(empleado);
				  }
			  }
			  session.setAttribute("trabajador", trabajador);
			  session.setAttribute("tecnicos", tecnicos);
			  session.setAttribute("cita", cita);
			  return EDITAR_CITA; // Redirige a editar-cita.jsp en la carpeta formulario-edicion dentro de la carpeta administrador
		 }
		 
		 @GetMapping("/editar-fabricacion{id}") 
		  public String editarFabricacion(HttpSession session, @PathVariable Long id) { 
			  System.out.println("¡El controlador ha recibido la solicitud para editar una fabricacion!");
			  Trabajador trabajador = (Trabajador) session.getAttribute("trabajador");
			  Fabricacion fabricacion = repositorioFabricacion.findByid(id);
			  session.setAttribute("trabajador", trabajador);
			  session.setAttribute("fabricacion", fabricacion);
			  return EDITAR_FABRICACION; // Redirige a editar-fabricacion.jsp en la carpeta formulario-edicion dentro de la carpeta administrador
		 }
		 
		 @GetMapping("/editar-material{id}") 
		  public String editarMaterial(HttpSession session, @PathVariable Long id) { 
			  System.out.println("¡El controlador ha recibido la solicitud para crear un nuevo material!");
			  Trabajador trabajador = (Trabajador) session.getAttribute("trabajador");
			  Material material = repositorioMaterial.findByid(id);
			  List <Proveedor> listado_proveedores = repositorioProveedor.findAll();
			  List <Proveedor> proveedores = new ArrayList<>();
			  for (Proveedor proveedor : listado_proveedores) {
				  if (proveedor.getEstado().equals("normal")) {
					  proveedores.add(proveedor);
				  }
			  }
			  
			  session.setAttribute("trabajador", trabajador);
			  session.setAttribute("proveedores", proveedores);
			  session.setAttribute("material", material);
			  return EDITAR_MATERIAL; // Redirige a editar-material.jsp en la carpeta formulario-edicion dentro de la carpeta administrador
		 }
		 
		 @GetMapping("/editar-producto{id}") 
		  public String editarProducto(HttpSession session, @PathVariable Long id) { 
			  System.out.println("¡El controlador ha recibido la solicitud para crear un nuevo producto!");
			  Trabajador trabajador = (Trabajador) session.getAttribute("trabajador");
			  Producto producto = repositorioProducto.findByid(id);
			  List <Proveedor> listado_proveedores = repositorioProveedor.findAll();
			  List <Proveedor> proveedores = new ArrayList<>();
			  List <CodigoSAS> lista_codigos = repositorioCodigo.findAll();
			  List <CodigoSAS> codigos = new ArrayList<>();
			  for (CodigoSAS codigo : lista_codigos) {
				  if(codigo.getEstado().equals("activo")) {
					  codigos.add(codigo);
				  }
			  }
			  for (Proveedor proveedor : listado_proveedores) {
				  if (proveedor.getEstado().equals("normal")) {
					  proveedores.add(proveedor);
				  }
			  }
			 
			  session.setAttribute("trabajador", trabajador);
			  session.setAttribute("proveedores", proveedores);
			  session.setAttribute("codigos", codigos);
			  session.setAttribute("producto", producto);
			  return EDITAR_PRODUCTO; // Redirige a editar-producto.jsp en la carpeta formulario-edicion dentro de la carpeta administrador
		 }
	 
	//Salir
	 
	 @GetMapping("/salir") 
	 public String cerrarSesion(HttpServletRequest request, HttpServletResponse response) { 
		 System.out.println("¡El controlador ha recibido la solicitud para cerrar sesion y volver al inicio!");
		 request.getSession().invalidate(); // Invalida la sesión HTTP
		 return VISTA_VOLVER; // Redirige al index.html 
	 }

}
