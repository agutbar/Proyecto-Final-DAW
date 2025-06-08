package com.proyectofinal.OrtoLiberi.repositorios.pedidos;

import org.springframework.stereotype.Repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.proyectofinal.OrtoLiberi.entidades.pedidos.PedidoProveedor;

@Repository
public interface RepositorioPedidoProveedor extends JpaRepository<PedidoProveedor, Long> {

	PedidoProveedor findByid (Long id);
}
