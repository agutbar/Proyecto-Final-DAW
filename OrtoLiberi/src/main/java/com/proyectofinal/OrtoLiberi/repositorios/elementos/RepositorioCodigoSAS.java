package com.proyectofinal.OrtoLiberi.repositorios.elementos;

import org.springframework.stereotype.Repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.proyectofinal.OrtoLiberi.entidades.elementos.CodigoSAS;

@Repository
public interface RepositorioCodigoSAS extends JpaRepository<CodigoSAS, String> {
	
	CodigoSAS findBycodigo (String codigo);

}
