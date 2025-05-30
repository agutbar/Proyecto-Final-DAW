package com.proyectofinal.OrtoLiberi.repositorios.personas;

import org.springframework.stereotype.Repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.proyectofinal.OrtoLiberi.entidades.personas.Cliente;

@Repository
public interface RepositorioCliente extends JpaRepository<Cliente, Long> {

	Cliente findBycorreo(String email);
	Cliente findByid (Long id);
	Cliente findByusuario (String usuario);
}
