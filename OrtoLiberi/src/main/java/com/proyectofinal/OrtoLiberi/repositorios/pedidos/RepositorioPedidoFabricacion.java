package com.proyectofinal.OrtoLiberi.repositorios.pedidos;

import org.springframework.stereotype.Repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.proyectofinal.OrtoLiberi.entidades.pedidos.PedidoFabricacion;
import com.proyectofinal.OrtoLiberi.entidades.elementos.Fabricacion;

@Repository
public interface RepositorioPedidoFabricacion extends JpaRepository<PedidoFabricacion, Long> {

	PedidoFabricacion findByid(Long id);
	PedidoFabricacion findByproducto(Fabricacion producto);
}
