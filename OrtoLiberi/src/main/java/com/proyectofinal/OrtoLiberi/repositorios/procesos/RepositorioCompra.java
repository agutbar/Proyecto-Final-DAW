package com.proyectofinal.OrtoLiberi.repositorios.procesos;

import org.springframework.stereotype.Repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.proyectofinal.OrtoLiberi.entidades.procesos.Compra;

@Repository
public interface RepositorioCompra extends JpaRepository<Compra, Long> {

}
