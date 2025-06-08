package com.proyectofinal.OrtoLiberi.repositorios.personas;

import org.springframework.stereotype.Repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.proyectofinal.OrtoLiberi.entidades.personas.Proveedor;

@Repository
public interface RepositorioProveedor extends JpaRepository<Proveedor, Long> {

	Proveedor findByid (Long id);
	Proveedor findBycif (String cif);
}
