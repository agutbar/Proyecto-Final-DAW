package com.proyectofinal.OrtoLiberi.servicios;

import org.springframework.stereotype.Service;

import com.proyectofinal.OrtoLiberi.entidades.personas.SolicitanteEmpleo;
import com.proyectofinal.OrtoLiberi.repositorios.personas.RepositorioSolicitanteEmpleo;

@Service
public class ServicioSolicitanteEmpleo {
	private final RepositorioSolicitanteEmpleo repositorioSolicitanteEmpleo;

    public ServicioSolicitanteEmpleo(RepositorioSolicitanteEmpleo repositorioSolicitanteEmpleo) {
        this.repositorioSolicitanteEmpleo = repositorioSolicitanteEmpleo;
    }

    public byte[] recuperarPDF(Long idSolicitante) {
        // Buscar al solicitante por ID
        SolicitanteEmpleo solicitante = repositorioSolicitanteEmpleo.findById(idSolicitante)
                .orElseThrow(() -> new RuntimeException("Solicitante no encontrado"));

        return solicitante.getCurriculum(); // Retornar el PDF en formato BLOB
    }

}
