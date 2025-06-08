package com.proyectofinal.OrtoLiberi.controladores.general;

import com.proyectofinal.OrtoLiberi.repositorios.personas.RepositorioSolicitanteEmpleo;

import java.io.IOException;
import java.time.LocalDate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import com.proyectofinal.OrtoLiberi.entidades.personas.SolicitanteEmpleo;

@Controller
@RequestMapping("/guardarSolicitud")
public class AlmacenarSolitantesEmpleo {
	
	@Autowired
	private RepositorioSolicitanteEmpleo repositorioSolicitanteEmpleo;

    @PostMapping
    public String guardarSolicitud (Model model, @RequestParam String nombre, @RequestParam String email, @RequestPart MultipartFile curriculum) {
    	SolicitanteEmpleo nuevoPostulante = new SolicitanteEmpleo();
    	LocalDate fechaHoy = LocalDate.now();
    	SolicitanteEmpleo postulanteRegistrado = repositorioSolicitanteEmpleo.findBycorreo(email);
    	if (postulanteRegistrado != null) {
    		model.addAttribute("error", "Con este correo ya tenemos registrado una solicitud");
	        return "general/trabajo";
    	} else {
    		nuevoPostulante.setNombre(nombre);
    		nuevoPostulante.setRegistro(fechaHoy);
    		nuevoPostulante.setCorreo(email);
    		if (curriculum.getSize() > 900 * 1024 ) { //Maximo de 900KB
    		    model.addAttribute("error", "El archivo es demasiado grande. Máximo permitido: 900KB");
    		    return "general/trabajo";
    		} else {
    			try {
                    nuevoPostulante.setCurriculum(curriculum.getBytes()); // Convertir el PDF en bytes
                } catch (IOException e) {
                    model.addAttribute("error", "Error al procesar el archivo PDF del curriculum");
                    return "general/trabajo";
                }
        		repositorioSolicitanteEmpleo.save(nuevoPostulante);
        		model.addAttribute("confirmacion", "Su solicitud ha sido registrada con éxito");
        		return "general/trabajo";
        	}
    	}    		
    }
}
