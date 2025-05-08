package com.proyectofinal.OrtoLiberi.repositorios.personas;

import org.springframework.stereotype.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.proyectofinal.OrtoLiberi.entidades.personas.Trabajador;

@Repository
public interface RepositorioTrabajador extends JpaRepository<Trabajador, Long> {

	List <Trabajador> findByCorreo(String email);
	List <Trabajador> findByCodigo(String codigo);
	Trabajador buscarPorID (Long id);
}
