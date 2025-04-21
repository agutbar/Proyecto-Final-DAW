package com.proyectofinal.OrtoLiberi.entidades.elementos;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Objects;

import com.proyectofinal.OrtoLiberi.entidades.personas.Hijo;
import com.proyectofinal.OrtoLiberi.entidades.personas.Trabajador;

import jakarta.persistence.*;
import jakarta.validation.constraints.*;

@Entity
@Table(name = "fabricacion")
public class Fabricacion {

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
	
	@NotBlank(message = "El nombre es obligatorio")
    @Size(min = 3, max = 100, message = "El nombre debe tener entre 3 y 100 caracteres")
    private String nombre;
	
	@Size(max = 255, message = "La descripción no debe superar los 255 caracteres")
    private String descripcion;
	
	@ManyToOne
    @JoinColumn(name = "codigo_id", nullable = false)
    private CodigosSAS codigo;
	
	@ManyToOne
    @JoinColumn(name = "hijo_id", nullable = false)
    private Hijo paciente;
	
	@ManyToOne
    @JoinColumn(name = "trabajador_id", nullable = false)
    private Trabajador responsable;
	
	@ElementCollection
    @CollectionTable(name = "fabricacion_materiales", joinColumns = @JoinColumn(name = "fabricacion_id"))
    @MapKeyJoinColumn(name = "material_id")
    private Map<Long, Integer> materiales;
	
	public Fabricacion() {
		
	}

	public Fabricacion(Long id,
			@NotBlank(message = "El nombre es obligatorio") @Size(min = 3, max = 100, message = "El nombre debe tener entre 3 y 100 caracteres") String nombre,
			@Size(max = 255, message = "La descripción no debe superar los 255 caracteres") String descripcion,
			CodigosSAS codigo, Hijo paciente, Trabajador responsable, Map<Long, Integer> materiales) {
		super();
		this.id = id;
		this.nombre = nombre;
		this.descripcion = descripcion;
		this.codigo = codigo;
		this.paciente = paciente;
		this.responsable = responsable;
		this.materiales = materiales;
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

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public CodigosSAS getCodigo() {
		return codigo;
	}

	public void setCodigo(CodigosSAS codigo) {
		this.codigo = codigo;
	}

	public Hijo getPaciente() {
		return paciente;
	}

	public void setPaciente(Hijo paciente) {
		this.paciente = paciente;
	}

	public Trabajador getResponsable() {
		return responsable;
	}

	public void setResponsable(Trabajador responsable) {
		this.responsable = responsable;
	}

	public Map<Long, Integer> getMateriales() {
		return materiales;
	}

	public void setMateriales(Map<Long, Integer> materiales) {
		this.materiales = materiales;
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
		Fabricacion other = (Fabricacion) obj;
		return Objects.equals(id, other.id);
	}

	@Override
	public String toString() {
		return "Fabricacion [id=" + id + ", nombre=" + nombre + ", descripcion=" + descripcion + ", codigo=" + codigo
				+ ", paciente=" + paciente + ", responsable=" + responsable + ", materiales=" + materiales + "]";
	}
	
	
}
