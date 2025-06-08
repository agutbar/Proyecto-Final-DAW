package com.proyectofinal.OrtoLiberi.repositorios.elementos;

import org.springframework.stereotype.Repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.proyectofinal.OrtoLiberi.entidades.elementos.Material;

@Repository
public interface RepositorioMaterial extends JpaRepository<Material, Long> {
	
	Material findByid(Long id);
	Material findBylote(String lote);

}
