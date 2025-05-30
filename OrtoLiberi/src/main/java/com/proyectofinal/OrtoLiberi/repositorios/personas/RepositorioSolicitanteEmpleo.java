package com.proyectofinal.OrtoLiberi.repositorios.personas;

import org.springframework.stereotype.Repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.proyectofinal.OrtoLiberi.entidades.personas.SolicitanteEmpleo;

@Repository
public interface RepositorioSolicitanteEmpleo extends JpaRepository<SolicitanteEmpleo, Long> {

	SolicitanteEmpleo findBycorreo(String email);
	SolicitanteEmpleo findByid (Long id);
}
