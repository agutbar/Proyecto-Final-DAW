package com.proyectofinal.OrtoLiberi.entidades.personas;

import java.time.LocalDate;
import java.util.Objects;

import jakarta.persistence.*;
import jakarta.validation.constraints.*;

@Entity
@Table(name = "menores")
public class Hijo {

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
	
	@NotBlank(message = "El nombre es obligatorio")
    @Size(min = 3, max = 100, message = "El nombre debe tener entre 3 y 100 caracteres")
    private String nombre;
	
	@NotBlank(message = "Los apellidos son obligatorios")
    @Size(min = 3, max = 100, message = "Los apellidos deben tener entre 3 y 100 caracteres")
    private String apellidos;
	
	@NotBlank(message = "La fecha de nacimiento es obligatoria")
    private LocalDate nacimiento;
	
	@ManyToOne
    @JoinColumn(name = "cliente_id", nullable = false)
    private Cliente tutor;

	public Hijo() {
		
	}

	public Hijo(Long id,
			@NotBlank(message = "El nombre es obligatorio") @Size(min = 3, max = 100, message = "El nombre debe tener entre 3 y 100 caracteres") String nombre,
			@NotBlank(message = "Los apellidos son obligatorios") @Size(min = 3, max = 100, message = "Los apellidos deben tener entre 3 y 100 caracteres") String apellidos,
			@NotBlank(message = "La fecha de nacimiento es obligatoria") LocalDate nacimiento, Cliente tutor) {
		super();
		this.id = id;
		this.nombre = nombre;
		this.apellidos = apellidos;
		this.nacimiento = nacimiento;
		this.tutor = tutor;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getApellidos() {
		return apellidos;
	}

	public void setApellidos(String apellidos) {
		this.apellidos = apellidos;
	}

	public LocalDate getNacimiento() {
		return nacimiento;
	}

	public void setNacimiento(LocalDate nacimiento) {
		this.nacimiento = nacimiento;
	}

	public Cliente getTutor() {
		return tutor;
	}

	public void setTutor(Cliente tutor) {
		this.tutor = tutor;
	}

	@Override
	public int hashCode() {
		return Objects.hash(id);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Hijo other = (Hijo) obj;
		return Objects.equals(id, other.id);
	}

	@Override
	public String toString() {
		return "Hijo [id=" + id + ", nombre=" + nombre + ", apellidos=" + apellidos + ", nacimiento=" + nacimiento
				+ ", tutor=" + tutor + "]";
	}
	
	
}
