package com.proyectofinal.OrtoLiberi.repositorios.elementos;

import org.springframework.stereotype.Repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.proyectofinal.OrtoLiberi.entidades.elementos.Producto;

@Repository
public interface RepositorioProducto extends JpaRepository<Producto, Long> {
	
	Producto findByid (Long id);
	Producto findBylote (String lote);

}
