package com.proyectofinal.OrtoLiberi.controladores.formularios;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.proyectofinal.OrtoLiberi.entidades.elementos.CodigoSAS;
import com.proyectofinal.OrtoLiberi.entidades.elementos.Material;
import com.proyectofinal.OrtoLiberi.entidades.elementos.Producto;
import com.proyectofinal.OrtoLiberi.entidades.personas.Cliente;
import com.proyectofinal.OrtoLiberi.entidades.personas.Hijo;
import com.proyectofinal.OrtoLiberi.entidades.personas.Proveedor;
import com.proyectofinal.OrtoLiberi.entidades.personas.SolicitanteEmpleo;
import com.proyectofinal.OrtoLiberi.entidades.personas.Trabajador;
import com.proyectofinal.OrtoLiberi.entidades.procesos.AusenciaTrabajador;
import com.proyectofinal.OrtoLiberi.EncriptadoPasswords;
import com.proyectofinal.OrtoLiberi.repositorios.elementos.RepositorioCodigoSAS;
import com.proyectofinal.OrtoLiberi.repositorios.elementos.RepositorioMaterial;
import com.proyectofinal.OrtoLiberi.repositorios.elementos.RepositorioProducto;
import com.proyectofinal.OrtoLiberi.repositorios.personas.RepositorioCliente;
import com.proyectofinal.OrtoLiberi.repositorios.personas.RepositorioHijo;
import com.proyectofinal.OrtoLiberi.repositorios.personas.RepositorioProveedor;
import com.proyectofinal.OrtoLiberi.repositorios.personas.RepositorioSolicitanteEmpleo;
import com.proyectofinal.OrtoLiberi.repositorios.personas.RepositorioTrabajador;
import com.proyectofinal.OrtoLiberi.repositorios.procesos.RepositorioAusenciaTrabajador;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/eliminar")
public class EliminarElementos {

	@Autowired
	private RepositorioCliente repositorioCliente;
	private RepositorioTrabajador repositorioTrabajador;
	private RepositorioProducto repositorioProducto;
	private RepositorioMaterial repositorioMaterial;
	private RepositorioAusenciaTrabajador repositorioAusenciaTrabajador;
	private RepositorioHijo repositorioHijo;
	private RepositorioProveedor repositorioProveedor;
	private RepositorioSolicitanteEmpleo repositorioSolicitanteEmpleo;
	private RepositorioCodigoSAS repositorioCodigo;
	
	@PostMapping("/producto/{id}")
	public String borrarProducto(HttpSession session, @RequestParam Long id) {
		Trabajador trabajador = (Trabajador) session.getAttribute("trabajador");
		Producto producto = repositorioProducto.findByid(id);
		producto.setEstado("descatalogado");
		repositorioProducto.save(producto);
		session.setAttribute("trabajador", trabajador);
		return "administrador/almacen";
	}
	
	@PostMapping("/material/{id}")
	public String borrarMaterial(HttpSession session,  @RequestParam Long id) {
		Trabajador trabajador = (Trabajador) session.getAttribute("trabajador");
		Material material = repositorioMaterial.findByid(id);
		material.setEstado("descatalogado");
		repositorioMaterial.save(material);
		session.setAttribute("trabajador", trabajador);
		return "administrador/almacen";
	}
	
	@PostMapping("/baja/{id}")
	public String borrarBaja(HttpSession session,  @RequestParam Long id) {
		Trabajador trabajador = (Trabajador) session.getAttribute("trabajador");
		AusenciaTrabajador baja = repositorioAusenciaTrabajador.findByid(id);
		repositorioAusenciaTrabajador.delete(baja);
		session.setAttribute("trabajador", trabajador);
		return "administrador/bajas";
	}
	
	@PostMapping("/cliente/{id}")
	public String borrarCliente(HttpSession session,  @RequestParam Long id) {
		Trabajador trabajador = (Trabajador) session.getAttribute("trabajador");
		Cliente usuario = repositorioCliente.findByid(id);
		usuario.setEstado("inactivo");
		repositorioCliente.save(usuario);
		session.setAttribute("trabajador", trabajador);
		return "administrador/listado";
	}
	
	@PostMapping("/paciente/{id}")
	public String borrarPaciente(HttpSession session,  @RequestParam Long id) {
		Trabajador trabajador = (Trabajador) session.getAttribute("trabajador");
		Hijo paciente = repositorioHijo.findByid(id);
		paciente.setEstado("inactivo");
		repositorioHijo.save(paciente);
		session.setAttribute("trabajador", trabajador);
		return "administrador/listado";
	}
	
	@PostMapping("/trabajador/{id}")
	public String borrarTrabajador(HttpSession session,  @RequestParam Long id) {
		Trabajador trabajador = (Trabajador) session.getAttribute("trabajador");
		Trabajador extrabajador = repositorioTrabajador.findByid(id);
		extrabajador.setEstado("inactivo");
		repositorioTrabajador.save(extrabajador);
		session.setAttribute("trabajador", trabajador);
		return "administrador/listado";
	}
	
	@PostMapping("/proveedor/{id}")
	public String borrarProveedor(HttpSession session,  @RequestParam Long id) {
		Trabajador trabajador = (Trabajador) session.getAttribute("trabajador");
		Proveedor proveedor = repositorioProveedor.findByid(id);
		proveedor.setEstado("cerrado");
		repositorioProveedor.save(proveedor);
		session.setAttribute("trabajador", trabajador);
		return "administrador/listado";
	}
	
	@PostMapping("/solicitante/{id}")
	public String borrarSolicitante(HttpSession session,  @RequestParam Long id) {
		Trabajador trabajador = (Trabajador) session.getAttribute("trabajador");
		SolicitanteEmpleo solicitante = repositorioSolicitanteEmpleo.findByid(id);
		repositorioSolicitanteEmpleo.delete(solicitante);
		session.setAttribute("trabajador", trabajador);
		return "administrador/listado";
	}
	
	@PostMapping("/codigo/{id}")
	public String borrarCodigo(HttpSession session,  @RequestParam String codigo) {
		Trabajador trabajador = (Trabajador) session.getAttribute("trabajador");
		CodigoSAS codigoSAS = repositorioCodigo.findBycodigo(codigo);
		codigoSAS.setEstado("inactivo");
		repositorioCodigo.save(codigoSAS);
		session.setAttribute("trabajador", trabajador);
		return "administrador/codigos";
	}
}
