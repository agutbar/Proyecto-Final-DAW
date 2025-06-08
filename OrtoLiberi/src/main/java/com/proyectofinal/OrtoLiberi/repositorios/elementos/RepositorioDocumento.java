package com.proyectofinal.OrtoLiberi.repositorios.elementos;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.proyectofinal.OrtoLiberi.entidades.elementos.Documento;

@Repository
public interface RepositorioDocumento extends JpaRepository<Documento, Long>{

}
