package com.proyectofinal.OrtoLiberi.repositorios.elementos;

import org.springframework.stereotype.Repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.proyectofinal.OrtoLiberi.entidades.elementos.Revision;

@Repository
public interface RepositorioRevision extends JpaRepository<Revision, Long> {
	
	Revision findByid (Long id);

}
