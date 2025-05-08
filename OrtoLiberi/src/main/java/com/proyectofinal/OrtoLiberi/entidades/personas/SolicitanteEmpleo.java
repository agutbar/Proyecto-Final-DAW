package com.proyectofinal.OrtoLiberi.entidades.personas;

import java.util.Objects;

import jakarta.persistence.*;
import jakarta.validation.constraints.*;

@Entity
@Table(name = "solicitantesEmpleo")
public class SolicitanteEmpleo {
	
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
	
	@NotBlank(message = "El nombre es obligatorio")
    @Size(min = 3, max = 100, message = "El nombre debe tener entre 3 y 100 caracteres")
    private String nombre;
	
	@NotBlank(message = "El correo no puede estar vacío.")
    @Email(message = "Debe ser un correo electrónico válido.")
    private String correo;
	
	@NotBlank(message = "El curriculum es obligatorio")
    private String curriculum;

	public SolicitanteEmpleo() {
		
	}

	public SolicitanteEmpleo(Long id,
			@NotBlank(message = "El nombre es obligatorio") @Size(min = 3, max = 100, message = "El nombre debe tener entre 3 y 100 caracteres") String nombre,
			@NotBlank(message = "El correo no puede estar vacío.") @Email(message = "Debe ser un correo electrónico válido.") String correo,
			@NotBlank(message = "El curriculum es obligatorio") String curriculum) {
		super();
		this.id = id;
		this.nombre = nombre;
		this.correo = correo;
		this.curriculum = curriculum;
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

	public String getCorreo() {
		return correo;
	}

	public void setCorreo(String correo) {
		this.correo = correo;
	}

	public String getCurriculum() {
		return curriculum;
	}

	public void setCurriculum(String curriculum) {
		this.curriculum = curriculum;
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
		SolicitanteEmpleo other = (SolicitanteEmpleo) obj;
		return Objects.equals(id, other.id);
	}

	@Override
	public String toString() {
		return "SolicitanteEmpleo [id=" + id + ", nombre=" + nombre + ", correo=" + correo + ", curriculum="
				+ curriculum + "]";
	}
	
	
}
