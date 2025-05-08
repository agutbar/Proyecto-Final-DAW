package com.proyectofinal.OrtoLiberi.repositorios.elementos;

import org.springframework.stereotype.Repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.proyectofinal.OrtoLiberi.entidades.elementos.Fabricacion;

@Repository
public interface RepositorioFabricacion extends JpaRepository<Fabricacion, Long> {

}
