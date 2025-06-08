package com.proyectofinal.OrtoLiberi;

import java.time.LocalDate;

import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

import com.proyectofinal.OrtoLiberi.entidades.personas.Trabajador;
import com.proyectofinal.OrtoLiberi.repositorios.personas.RepositorioTrabajador;


@Component
public class CrearAdmin implements CommandLineRunner {

    private final RepositorioTrabajador repositorioTrabajador;

    public CrearAdmin(RepositorioTrabajador repositorioTrabajador) {
        this.repositorioTrabajador = repositorioTrabajador;
    }

    @Override
    public void run(String... args) {
        try {
        	LocalDate nacimiento = LocalDate.of(1999, 12, 12);
        	Trabajador admin = new Trabajador();
        	admin.setNombre("Administador");
        	admin.setApellidos("De Prueba");
        	admin.setNacimiento(nacimiento);
        	admin.setCodigo("admin123");
        	admin.setCorreo("administrador@deprueba.com");
        	admin.setDireccion("Plaza del pueblo");
        	admin.setEstado("activo");
        	admin.setTelefono("000000000");
        	admin.setPassword(EncriptadoPasswords.cifrarPassword("Admin-1234"));
        	Trabajador otro = repositorioTrabajador.findBycodigo("admin123");
        	if (otro == null) {
        		repositorioTrabajador.save(admin);
    			System.out.println("Administrador creado con éxito.");
        	} else {
        		System.out.println("Administrador ya creado en otra ejecucion.");
        	}
			
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
