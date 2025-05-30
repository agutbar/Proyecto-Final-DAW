package com.proyectofinal.OrtoLiberi.controladores.administrador;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.proyectofinal.OrtoLiberi.EncriptadoPasswords;
import com.proyectofinal.OrtoLiberi.entidades.elementos.CodigoSAS;
import com.proyectofinal.OrtoLiberi.entidades.elementos.Fabricacion;
import com.proyectofinal.OrtoLiberi.entidades.elementos.Producto;
import com.proyectofinal.OrtoLiberi.entidades.personas.Cliente;
import com.proyectofinal.OrtoLiberi.entidades.personas.Hijo;
import com.proyectofinal.OrtoLiberi.entidades.personas.Trabajador;
import com.proyectofinal.OrtoLiberi.repositorios.elementos.RepositorioCodigoSAS;
import com.proyectofinal.OrtoLiberi.repositorios.elementos.RepositorioFabricacion;
import com.proyectofinal.OrtoLiberi.repositorios.elementos.RepositorioProducto;
import com.proyectofinal.OrtoLiberi.repositorios.personas.RepositorioCliente;
import com.proyectofinal.OrtoLiberi.repositorios.personas.RepositorioHijo;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/cambio")
public class VerAcciones{
	
	 private static final String CAMBIO_PASSWORD = "administrador/acciones/reestablecer_password";
	 private static final String CAMBIO_CODIGO = "administrador/acciones/asignar_codigo";
	 private static final String CAMBIO_TUTOR = "administrador/acciones/reasignar_tutor";
	 
	 @Autowired
	 private RepositorioCliente repositorioCliente;
	 private RepositorioProducto repositorioProducto;
	 private RepositorioFabricacion repositorioFabricacion;
	 private RepositorioHijo repositorioHijo;
	 
	 @GetMapping("/password/{id}") 
	 public String verReestablecerPassword(HttpSession session, @RequestParam Long id) {
		 Trabajador trabajador = (Trabajador) session.getAttribute("trabajador");
		 Cliente cliente = repositorioCliente.findByid(id);
		 session.setAttribute("trabajador", trabajador);
		 session.setAttribute("cliente", cliente);
		 return CAMBIO_PASSWORD;
	 }
	 
	 @GetMapping("/codigo/{id}/{categoria}") 
	 public String verAsignarCodigo(HttpSession session, @RequestParam Long id, @RequestParam String categoria) {
		 Trabajador trabajador = (Trabajador) session.getAttribute("trabajador");
		 if (categoria == "producto") {
			 Producto elemento = repositorioProducto.findByid(id);
			 session.setAttribute("elemento", elemento);
		 } else {
			 Fabricacion elemento = repositorioFabricacion.findByid(id);
			 session.setAttribute("elemento", elemento);
		 }
		 session.setAttribute("trabajador", trabajador);
		 session.setAttribute("categoria", categoria);
		 return CAMBIO_CODIGO;
	 }
	 
	 @GetMapping("/tutor/{id}") 
	 public String verReasignarTutor(HttpSession session, @RequestParam Long id) {
		 Trabajador trabajador = (Trabajador) session.getAttribute("trabajador");
		 Hijo menorAReasignar = repositorioHijo.findByid(id);
		 List <Cliente> clientela = repositorioCliente.findAll();
		 List <Cliente> clientes = null;
		 for (Cliente cliente : clientela) {
			  if (cliente.getEstado() == "activo") {
				  clientes.add(cliente);
			  }
		 }
		 session.setAttribute("trabajador", trabajador);
		 session.setAttribute("menor", menorAReasignar);
		 session.setAttribute("clientes", clientes);
		 return CAMBIO_TUTOR;
	 }
	 
	 
}
