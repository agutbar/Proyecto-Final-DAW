package com.proyectofinal.OrtoLiberi.repositorios.pedidos;

import org.springframework.stereotype.Repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.proyectofinal.OrtoLiberi.entidades.pedidos.PedidoFabricacion;

@Repository
public interface RepositorioPedidoFabricacion extends JpaRepository<PedidoFabricacion, Long> {

	PedidoFabricacion findByid(Long id);
}
