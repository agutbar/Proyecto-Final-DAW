package com.proyectofinal.OrtoLiberi.entidades.elementos;

import java.util.Objects;

import com.proyectofinal.OrtoLiberi.entidades.personas.Cliente;
import com.proyectofinal.OrtoLiberi.entidades.personas.Hijo;

import jakarta.persistence.*;
import jakarta.validation.constraints.*;

@Entity
@Table(name = "revisiones")
public class Revision {

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
	
	@Size(max = 255, message = "La descripción no debe superar los 255 caracteres")
    private String descripcion;
	
	@OneToOne
	@JoinColumn(name = "cita_id", nullable = false)
	private Cita cita;
	
	@ManyToOne
    @JoinColumn(name = "cliente_id", nullable = false)
    private Cliente solicitante;
	
	@ManyToOne
    @JoinColumn(name = "hijo_id", nullable = false)
    private Hijo paciente;
	
	public Revision() {
		
	}

	public Revision(Long id,
			@Size(max = 255, message = "La descripción no debe superar los 255 caracteres") String descripcion,
			Cita cita, Cliente solicitante, Hijo paciente) {
		super();
		this.id = id;
		this.descripcion = descripcion;
		this.cita = cita;
		this.solicitante = solicitante;
		this.paciente = paciente;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public Cita getCita() {
		return cita;
	}

	public void setCita(Cita cita) {
		this.cita = cita;
	}

	public Cliente getSolicitante() {
		return solicitante;
	}

	public void setSolicitante(Cliente solicitante) {
		this.solicitante = solicitante;
	}

	public Hijo getPaciente() {
		return paciente;
	}

	public void setPaciente(Hijo paciente) {
		this.paciente = paciente;
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
		Revision other = (Revision) obj;
		return Objects.equals(id, other.id);
	}

	@Override
	public String toString() {
		return "Revision [id=" + id + ", descripcion=" + descripcion + ", cita=" + cita + ", solicitante=" + solicitante
				+ ", paciente=" + paciente + "]";
	}
	
	
}
