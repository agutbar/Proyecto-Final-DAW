package com.proyectofinal.OrtoLiberi.controladores.administrador;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
import com.proyectofinal.OrtoLiberi.repositorios.personas.RepositorioTrabajador;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/accion")
public class RealizarAcciones{
	 
	 @Autowired
	 private RepositorioCliente repositorioCliente;
	 @Autowired
	 private RepositorioProducto repositorioProducto;
	 @Autowired
	 private RepositorioFabricacion repositorioFabricacion;
	 @Autowired
	 private RepositorioCodigoSAS repositorioCodigo;
	 @Autowired
	 private RepositorioHijo repositorioHijo;
	 @Autowired
	 private RepositorioTrabajador repositorioTrabajador;
	 
	 @PostMapping("/reestablecer-password") 
	 public String reestablecerPassword(HttpSession session, @RequestParam String usuario, @RequestParam String password) {
		 Trabajador trabajador = (Trabajador) session.getAttribute("trabajador");
		 Cliente cliente = repositorioCliente.findByusuario(usuario);
		 cliente.setPassword(EncriptadoPasswords.cifrarPassword(password));
		 if(EncriptadoPasswords.verificarContraseña(password, cliente.getPassword())) {
			 repositorioCliente.save(cliente);
			 session.setAttribute("confirmacion", "Contraseña reestablecida");
		 } else {
			 session.setAttribute("error", "Fallo al reestablecer la contraseña");
		 }
		 session.setAttribute("trabajador", trabajador);
		 String ruta = "redirect:/cambio/password" + cliente.getId();
		 return ruta;
	 }
	 
	 @PostMapping("/asignar-codigo") 
	 public String asignarCodigo(HttpSession session, Model model, @RequestParam Long id, @RequestParam String codigo, @RequestParam String categoria) {
		 Trabajador trabajador = (Trabajador) session.getAttribute("trabajador");
		 CodigoSAS codigoSas = repositorioCodigo.findBycodigo(codigo);
		 if (categoria == "producto") {
			 Producto elemento = repositorioProducto.findByid(id);
			 elemento.setCodigoAsociado(codigoSas);
			 if (elemento.getCodigoAsociado() == codigoSas) {
				 model.addAttribute("confirmacion", "Codigo Asignado");
			 } else {
				 model.addAttribute("error", "Fallo al asignar el código");
			 }
		 } else {
			 Fabricacion elemento = repositorioFabricacion.findByid(id);
			 elemento.setCodigo(codigoSas);
			 if (elemento.getCodigo() == codigoSas) {
				 model.addAttribute("confirmacion", "Codigo Asignado");
			 } else {
				 model.addAttribute("error", "Fallo al asignar el código");
			 }
		 }
		 session.setAttribute("trabajador", trabajador);
		 return "cambio/codigo";
	 }
	 
	 @PostMapping("/reasignar-tutor") 
	 public String resignarTutor(HttpSession session, Model model, @RequestParam Long idMenor, @RequestParam Long antiguo, @RequestParam Long nuevo) {
		 Trabajador trabajador = (Trabajador) session.getAttribute("trabajador");
		 Hijo menor = repositorioHijo.findByid(idMenor);
		 Cliente nuevoTutor = repositorioCliente.findByid(nuevo);
		 Cliente antiguoTutor = repositorioCliente.findByid(antiguo);
		 menor.setTutor(nuevoTutor);
		 List <Hijo> menoresA = antiguoTutor.getMenores();
		 menoresA.remove(menor);
		 antiguoTutor.setMenores(menoresA);
		 List <Hijo> menoresN = nuevoTutor.getMenores();
		 menoresN.add(menor);
		 nuevoTutor.setMenores(menoresN);
		 if (menor.getTutor() == nuevoTutor && nuevoTutor.getMenores().contains(menor) && !antiguoTutor.getMenores().contains(menor)) {
			 model.addAttribute("confirmacion", "Reasignacion Completada");
		 } else {
			 model.addAttribute("error", "Fallo al reasignar el tutor");
		 }
		 session.setAttribute("trabajador", trabajador);
		 return "cambio/tutor";
	 }
	 
	 @PostMapping("/reestablecer-clave") 
	 public String reestablecerClave(HttpSession session, @RequestParam String codigo, @RequestParam String password) {
		 Trabajador trabajador = (Trabajador) session.getAttribute("trabajador");
		 Trabajador responsable = repositorioTrabajador.findBycodigo(codigo);
		 responsable.setPassword(EncriptadoPasswords.cifrarPassword(password));
		 if(EncriptadoPasswords.verificarContraseña(password, responsable.getPassword())) {
			 repositorioTrabajador.save(responsable);
			 session.setAttribute("confirmacion", "Contraseña reestablecida");
		 } else {
			 session.setAttribute("error", "Fallo al reestablecer la contraseña");
		 }
		 session.setAttribute("trabajador", trabajador);
		 String ruta = "redirect:/cambio/clave" + responsable.getId();
		 return ruta;
	 }
	 
}
