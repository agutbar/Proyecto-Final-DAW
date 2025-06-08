package com.proyectofinal.OrtoLiberi.repositorios.pedidos;

import org.springframework.stereotype.Repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.proyectofinal.OrtoLiberi.entidades.pedidos.PedidoCliente;

@Repository
public interface RepositorioPedidoCliente extends JpaRepository<PedidoCliente, Long> {

	PedidoCliente findByid (Long id);
}
