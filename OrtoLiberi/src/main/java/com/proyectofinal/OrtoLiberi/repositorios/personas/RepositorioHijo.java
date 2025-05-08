package com.proyectofinal.OrtoLiberi.repositorios.personas;

import org.springframework.stereotype.Repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.proyectofinal.OrtoLiberi.entidades.personas.Hijo;

@Repository
public interface RepositorioHijo extends JpaRepository<Hijo, Long> {

	Hijo buscarPorID (Long id);
}
