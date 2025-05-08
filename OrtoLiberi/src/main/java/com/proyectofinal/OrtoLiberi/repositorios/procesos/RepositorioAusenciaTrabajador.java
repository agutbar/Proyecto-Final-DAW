package com.proyectofinal.OrtoLiberi.repositorios.procesos;

import org.springframework.stereotype.Repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.proyectofinal.OrtoLiberi.entidades.procesos.AusenciaTrabajador;

@Repository
public interface RepositorioAusenciaTrabajador extends JpaRepository<AusenciaTrabajador, Long> {

}
