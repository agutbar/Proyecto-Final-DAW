package com.proyectofinal.OrtoLiberi.entidades.personas;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import com.proyectofinal.OrtoLiberi.entidades.elementos.Fabricacion;
import com.proyectofinal.OrtoLiberi.entidades.elementos.Revision;

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
	
	@NotNull(message = "La fecha de nacimiento es obligatoria")
	@Past
    private LocalDate nacimiento;
	
	@ManyToOne
    @JoinColumn(name = "cliente_id", nullable = false)
    private Cliente tutor;
	
	@NotNull(message = "El estado debe ser activo o inactivo")
	@Pattern(regexp= "^(activo|inactivo)$")
	private String estado;
	
	@OneToMany(mappedBy = "paciente", cascade = CascadeType.ALL, orphanRemoval = true, fetch = FetchType.EAGER)
    private List<Fabricacion> productos_realizados = new ArrayList<>();
	
	@OneToMany(mappedBy = "paciente", cascade = CascadeType.ALL, orphanRemoval = true, fetch = FetchType.EAGER)
    private List<Revision> revisiones = new ArrayList<>();

	public Hijo() {
		
	}

	public Hijo(Long id,
			@NotBlank(message = "El nombre es obligatorio") @Size(min = 3, max = 100, message = "El nombre debe tener entre 3 y 100 caracteres") String nombre,
			@NotBlank(message = "Los apellidos son obligatorios") @Size(min = 3, max = 100, message = "Los apellidos deben tener entre 3 y 100 caracteres") String apellidos,
			@NotBlank(message = "La fecha de nacimiento es obligatoria") LocalDate nacimiento, Cliente tutor,
			List<Fabricacion> productos_realizados, List<Revision> revisiones) {
		super();
		this.id = id;
		this.nombre = nombre;
		this.apellidos = apellidos;
		this.nacimiento = nacimiento;
		this.tutor = tutor;
		this.productos_realizados = productos_realizados;
		this.revisiones = revisiones;
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

	public List<Fabricacion> getProductos_realizados() {
		return productos_realizados;
	}

	public void setProductos_realizados(List<Fabricacion> productos_realizados) {
		this.productos_realizados = productos_realizados;
	}

	public List<Revision> getRevisiones() {
		return revisiones;
	}

	public void setRevisiones(List<Revision> revisiones) {
		this.revisiones = revisiones;
	}

	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
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
				+  ", estado=" + estado + "]";
	}	
}
