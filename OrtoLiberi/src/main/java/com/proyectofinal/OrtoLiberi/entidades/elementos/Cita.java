package com.proyectofinal.OrtoLiberi.entidades.elementos;

import java.time.LocalDate;
import java.util.Objects;

import com.proyectofinal.OrtoLiberi.entidades.personas.Trabajador;

import jakarta.persistence.*;
import jakarta.validation.constraints.*;

@Entity
@Table(name = "citas")
public class Cita {
	
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
	
	@NotBlank(message = "La fecha es obligatoria")
    private LocalDate fecha;
	
	@NotNull(message = "El estado debe ser libre o ocupada")
	@Pattern(regexp= "^(Libre|Ocupada)$")
	private String estado;
	
	@ManyToOne
    @JoinColumn(name = "trabajador_id", nullable = false)
    private Trabajador tecnico;
	
	public Cita() {
		
	}

	public Cita(Long id, @NotBlank(message = "La fecha es obligatoria") LocalDate fecha,
			@NotNull(message = "El estado debe ser libre o ocupada") @Pattern(regexp = "^(Libre|Ocupada)$") String estado,
			Trabajador tecnico) {
		super();
		this.id = id;
		this.fecha = fecha;
		this.estado = estado;
		this.tecnico = tecnico;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public LocalDate getFecha() {
		return fecha;
	}

	public void setFecha(LocalDate fecha) {
		this.fecha = fecha;
	}

	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

	public Trabajador getTecnico() {
		return tecnico;
	}

	public void setTecnico(Trabajador tecnico) {
		this.tecnico = tecnico;
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
		Cita other = (Cita) obj;
		return Objects.equals(id, other.id);
	}

	@Override
	public String toString() {
		return "Cita [id=" + id + ", fecha=" + fecha + ", estado=" + estado + ", tecnico=" + tecnico + "]";
	}
	
	
}
