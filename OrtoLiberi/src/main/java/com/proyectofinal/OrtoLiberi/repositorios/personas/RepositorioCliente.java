package com.proyectofinal.OrtoLiberi.repositorios.personas;

import org.springframework.stereotype.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.proyectofinal.OrtoLiberi.entidades.personas.Cliente;

@Repository
public interface RepositorioCliente extends JpaRepository<Cliente, Long> {

	List <Cliente> findByCorreo(String email);
	List <Cliente> findByUsuario(String usuario);
}
