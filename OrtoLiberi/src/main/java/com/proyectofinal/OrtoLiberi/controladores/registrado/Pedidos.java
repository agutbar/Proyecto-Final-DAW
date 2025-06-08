package com.proyectofinal.OrtoLiberi.controladores.registrado;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping; 

import com.proyectofinal.OrtoLiberi.entidades.pedidos.PedidoCliente;
import com.proyectofinal.OrtoLiberi.entidades.personas.Cliente;
import com.proyectofinal.OrtoLiberi.repositorios.personas.RepositorioCliente;
import com.proyectofinal.OrtoLiberi.repositorios.pedidos.RepositorioPedidoCliente;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/pedido")
public class Pedidos {
	
	private static final String VER_DETALLES = "registrado/vistazo/ver-pedido";
	private static final String EDITAR = "registrado/formulario-edicion/editar-pedido";
	
	@Autowired
	private RepositorioPedidoCliente repositorioPedidoCliente;
	private RepositorioCliente repositorioCliente;
	
	@GetMapping("/ver-detalles/{id}") 
	public String verDetallesPedido(HttpSession session, Long id) { 
		System.out.println("¡El controlador ha recibido la solicitud para ver los detalles del pedido!");
		Cliente usuario = (Cliente) session.getAttribute("usuario");
		PedidoCliente pedido = repositorioPedidoCliente.findByid(id);
		session.setAttribute("usuario", usuario);
		session.setAttribute("pedido", pedido);
		return VER_DETALLES; // Redirige a ver-pedido.jsp en la carpeta vistazo dentro de la carpeta registrado 
	}
	
	@GetMapping("/editar/{id}") 
	public String verEditarPedido(HttpSession session, Long id) { 
		System.out.println("¡El controlador ha recibido la solicitud para ver los detalles del pedido!");
		Cliente usuario = (Cliente) session.getAttribute("usuario");
		PedidoCliente pedido = repositorioPedidoCliente.findByid(id);
		session.setAttribute("usuario", usuario);
		session.setAttribute("pedido", pedido);
		return EDITAR; // Redirige a editar-pedido.jsp en la carpeta formulario-edicion dentro de la carpeta registrado 
	}
	
	@PostMapping("/cancelar/{id}") 
	public String cancelarPedido(HttpSession session, Long id) { 
		Cliente usuario = (Cliente) session.getAttribute("usuario");
		PedidoCliente pedido = repositorioPedidoCliente.findByid(id);
		pedido.setEstado("cancelado");
		usuario.getPedidos().remove(pedido);
		repositorioPedidoCliente.save(pedido);
		session.setAttribute("usuario", usuario);
		return "registrado/compras"; // Redirige a compras.jsp en la carpeta registrado 
	}
	
	@PostMapping("/completar/{id}") 
	public String completarPedido(HttpSession session, Long id) { 
		Cliente usuarioa = (Cliente) session.getAttribute("usuario");
		PedidoCliente pedido = repositorioPedidoCliente.findByid(id);
		pedido.setEstado("recibido");
		repositorioPedidoCliente.save(pedido);
		Cliente usuario = repositorioCliente.findByid(usuarioa.getId());
		session.setAttribute("usuario", usuario);
		return "registrado/compras"; // Redirige a compras.jsp en la carpeta registrado 
	}

}
