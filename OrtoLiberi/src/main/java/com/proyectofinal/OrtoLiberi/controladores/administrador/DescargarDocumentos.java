package com.proyectofinal.OrtoLiberi.controladores.administrador;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.proyectofinal.OrtoLiberi.servicios.ServicioSolicitanteEmpleo;

@Controller
@RequestMapping("/descargar")
public class DescargarDocumentos {
	
	@Autowired
	private ServicioSolicitanteEmpleo servicioSolicitanteEmpleo;
	
	@GetMapping("/curriculum/{id}")
	public ResponseEntity<byte[]> descargarDocumento(@PathVariable Long id) {
	    byte[] documento = servicioSolicitanteEmpleo.recuperarPDF(id);

	    if (documento == null || documento.length == 0) {
	        return ResponseEntity.status(HttpStatus.NOT_FOUND).body(null);
	    }

	    HttpHeaders headers = new HttpHeaders();
	    headers.add("Content-Disposition", "attachment; filename=documento.pdf");
	    headers.add("Content-Type", "application/pdf");

	    return ResponseEntity.ok().headers(headers).body(documento);
	}

}
