package com.proyectofinal.OrtoLiberi.entidades.elementos;

import java.time.LocalDate;
import java.util.Objects;

import com.proyectofinal.OrtoLiberi.entidades.personas.Proveedor;

import jakarta.persistence.*;
import jakarta.validation.constraints.*;

@Entity
@Table(name = "materiales")
public class Material {

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
	
	@NotBlank(message = "El nombre es obligatorio")
    @Size(min = 3, max = 100, message = "El nombre debe tener entre 3 y 100 caracteres")
    private String nombre;
	
	@Size(max = 255, message = "La descripción no debe superar los 255 caracteres")
    private String descripcion;
	
	@NotBlank(message = "El número de lote es obligatorio")
    @Size(min = 3, max = 100, message = "El número de lote debe tener entre 3 y 100 caracteres")
    private String lote;
	
	@NotNull(message = "El precio de coste no puede ser nulo")
    @Min(value = 0, message = "El precio de coste no puede ser negativo")
    private double coste;
	
	@NotNull(message = "La fecha de caducidad es obligatoria")
    private LocalDate caducidad;
	
	@NotNull(message = "El stock no puede ser nulo")
    @Min(value = 0, message = "El stock no puede ser negativa")
    private Integer stock;
	
	@ManyToOne
    @JoinColumn(name = "proveedor_id", nullable = false)
    private Proveedor proveedor;
	
	@NotNull(message = "El estado debe ser activo o descatalogado")
	@Pattern(regexp= "^(activo|descatalogado)$")
	private String estado;
	
	public Material() {
		
	}

	public Material(Long id,
			@NotBlank(message = "El nombre es obligatorio") @Size(min = 3, max = 100, message = "El nombre debe tener entre 3 y 100 caracteres") String nombre,
			@Size(max = 255, message = "La descripción no debe superar los 255 caracteres") String descripcion,
			@NotBlank(message = "El número de lote es obligatorio") @Size(min = 3, max = 100, message = "El número de lote debe tener entre 3 y 100 caracteres") String lote,
			@NotNull(message = "El precio de coste no puede ser nulo") @Min(value = 0, message = "El precio de coste no puede ser negativo") double coste,
			@NotBlank(message = "La fecha de caducidad es obligatoria") LocalDate caducidad,
			@NotNull(message = "El stock no puede ser nulo") @Min(value = 0, message = "El stock no puede ser negativa") Integer stock,
			Proveedor proveedor) {
		this.id = id;
		this.nombre = nombre;
		this.descripcion = descripcion;
		this.lote = lote;
		this.coste = coste;
		this.caducidad = caducidad;
		this.stock = stock;
		this.proveedor = proveedor;
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

	public String getLote() {
		return lote;
	}

	public void setLote(String lote) {
		this.lote = lote;
	}

	public LocalDate getCaducidad() {
		return caducidad;
	}

	public void setCaducidad(LocalDate caducidad) {
		this.caducidad = caducidad;
	}

	public Integer getStock() {
		return stock;
	}

	public void setStock(Integer stock) {
		this.stock = stock;
	}

	public Proveedor getProveedor() {
		return proveedor;
	}

	public void setProveedor(Proveedor proveedor) {
		this.proveedor = proveedor;
	}

	public double getCoste() {
		return coste;
	}

	public void setCoste(double coste) {
		this.coste = coste;
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
		Material other = (Material) obj;
		return Objects.equals(id, other.id);
	}

	@Override
	public String toString() {
		return "Material [id=" + id + ", nombre=" + nombre + ", descripcion=" + descripcion + ", lote=" + lote
				+ ", caducidad=" + caducidad + ", stock=" + stock + ", proveedor=" + proveedor + "]";
	}
	
	
	
}
