package com.proyectofinal.OrtoLiberi.repositorios.elementos;

import org.springframework.stereotype.Repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.proyectofinal.OrtoLiberi.entidades.elementos.Cita;

@Repository
public interface RepositorioCita extends JpaRepository<Cita, Long> {

}
