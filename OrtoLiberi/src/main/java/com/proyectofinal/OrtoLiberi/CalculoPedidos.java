package com.proyectofinal.OrtoLiberi;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.proyectofinal.OrtoLiberi.entidades.elementos.Material;
import com.proyectofinal.OrtoLiberi.entidades.elementos.Producto;
import com.proyectofinal.OrtoLiberi.repositorios.elementos.RepositorioMaterial;
import com.proyectofinal.OrtoLiberi.repositorios.elementos.RepositorioProducto;

public class CalculoPedidos {
	
	@Autowired
	private static RepositorioMaterial repositorioMaterial;
	private static RepositorioProducto repositorioProducto;
	
	public static Double calcularGastosEnvio() {
	    // Se fijan en 10€ para todo el mundo de manera inicial
	    return 10.0;
	}
	
	public static Double calcularCosteProductosProveedor(Map<Long, Integer> productos) {
	    double total_producto_proveedor = 0.0;

	    // Calcular el coste de los productos
	    for (Map.Entry<Long, Integer> entry : productos.entrySet()) {
	        Producto producto = repositorioProducto.findById(entry.getKey()).orElseThrow();
	        total_producto_proveedor += producto.getCoste() * entry.getValue();
	    }

	    return total_producto_proveedor;
	}
	
	public static Double calcularCosteProductosCliente(Map<Long, Integer> productos) {
	    double total_producto_cliente = 0.0;

	    // Calcular el coste de los productos
	    for (Map.Entry<Long, Integer> entry : productos.entrySet()) {
	        Producto producto = repositorioProducto.findById(entry.getKey()).orElseThrow();
	        total_producto_cliente += producto.getPrecio() * entry.getValue();
	    }

	    return total_producto_cliente;
	}
	
	public static Double calcularCosteMateriales(Map<Long, Integer> materiales) {
	    double total_materiales = 0.0;

	    // Calcular el coste de los productos
	    for (Map.Entry<Long, Integer> entry : materiales.entrySet()) {
	        Material material = repositorioMaterial.findById(entry.getKey()).orElseThrow();
	        total_materiales += material.getCoste() * entry.getValue();
	    }

	    return total_materiales;
	}

}
