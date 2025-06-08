package com.proyectofinal.OrtoLiberi.entidades.elementos;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import jakarta.persistence.*;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;

@Entity
@Table(name = "codigos")
public class CodigoSAS {

	@Id
    private String codigo;
	
	@NotBlank(message = "El nombre del producto es obligatorio")
    @Size(min = 3, max = 100, message = "El nombre del producto debe tener entre 3 y 100 caracteres")
    private String producto;
	
	@Size(max = 255, message = "La descripción no debe superar los 255 caracteres")
    private String descripcion;
	
	@NotNull(message = "El estado debe ser activo o inactivo")
	@Pattern(regexp= "^(activo|inactivo)$")
	private String estado;
	
	@NotNull(message = "El precio de coste no puede ser nulo")
    @Min(value = 0, message = "El precio de coste no puede ser negativo")
    private double cobertura;
	
	@OneToMany(mappedBy = "codigoAsociado", cascade = CascadeType.ALL, orphanRemoval = true, fetch = FetchType.EAGER)
    private List<Producto> productos = new ArrayList<>();
	
	@OneToMany(mappedBy = "codigo", cascade = CascadeType.ALL, orphanRemoval = true, fetch = FetchType.EAGER)
    private List<Fabricacion> fabricados = new ArrayList<>();
	
	public CodigoSAS() {
		
	}

	public CodigoSAS(String codigo,
			@NotBlank(message = "El nombre del producto es obligatorio") @Size(min = 3, max = 100, message = "El nombre del producto debe tener entre 3 y 100 caracteres") String producto,
			@Size(max = 255, message = "La descripción no debe superar los 255 caracteres") String descripcion,
			@NotNull(message = "El estado debe ser activo o inactivo") @Pattern(regexp = "^(activo|inactivo)$") String estado,
			@NotNull(message = "El precio de coste no puede ser nulo") @Min(value = 0, message = "El precio de coste no puede ser negativo") double cobertura,
			List<Producto> productos, List<Fabricacion> fabricados) {
		this.codigo = codigo;
		this.producto = producto;
		this.descripcion = descripcion;
		this.estado = estado;
		this.cobertura = cobertura;
		this.productos = productos;
		this.fabricados = fabricados;
	}

	public String getCodigo() {
		return codigo;
	}

	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}

	public String getProducto() {
		return producto;
	}

	public void setProducto(String producto) {
		this.producto = producto;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

	public double getCobertura() {
		return cobertura;
	}

	public void setCobertura(double cobertura) {
		this.cobertura = cobertura;
	}

	public List<Producto> getProductos() {
		return productos;
	}

	public void setProductos(List<Producto> productos) {
		this.productos = productos;
	}

	public List<Fabricacion> getFabricados() {
		return fabricados;
	}

	public void setFabricados(List<Fabricacion> fabricados) {
		this.fabricados = fabricados;
	}

	@Override
	public int hashCode() {
		return Objects.hash(codigo);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		CodigoSAS other = (CodigoSAS) obj;
		return Objects.equals(codigo, other.codigo);
	}

	@Override
	public String toString() {
		return "CodigoSAS [codigo=" + codigo + ", producto=" + producto + ", descripcion=" + descripcion + ", estado="
				+ estado + ", cobertura=" + cobertura + "]";
	}
	
}
