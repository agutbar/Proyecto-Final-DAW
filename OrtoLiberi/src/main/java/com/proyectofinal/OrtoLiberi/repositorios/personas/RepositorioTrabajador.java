package com.proyectofinal.OrtoLiberi.repositorios.personas;

import org.springframework.stereotype.Repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.proyectofinal.OrtoLiberi.entidades.personas.Trabajador;

@Repository
public interface RepositorioTrabajador extends JpaRepository<Trabajador, Long> {

	Trabajador findBycorreo(String email);
	Trabajador findBycodigo(String codigo);
	Trabajador findByid (Long id);
}
