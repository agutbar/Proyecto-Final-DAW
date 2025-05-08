package com.proyectofinal.OrtoLiberi.entidades.elementos;

import java.util.Objects;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;

@Entity
@Table(name = "codigos")
public class CodigosSAS {

	@Id
    private String codigo;
	
	@NotBlank(message = "El nombre del producto es obligatorio")
    @Size(min = 3, max = 100, message = "El nombre del producto debe tener entre 3 y 100 caracteres")
    private String producto;
	
	@Size(max = 255, message = "La descripción no debe superar los 255 caracteres")
    private String descripcion;
	
	public CodigosSAS() {
		
	}

	public CodigosSAS(String codigo,
			@NotBlank(message = "El nombre del producto es obligatorio") @Size(min = 3, max = 100, message = "El nombre del producto debe tener entre 3 y 100 caracteres") String producto,
			@Size(max = 255, message = "La descripción no debe superar los 255 caracteres") String descripcion) {
		super();
		this.codigo = codigo;
		this.producto = producto;
		this.descripcion = descripcion;
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
		CodigosSAS other = (CodigosSAS) obj;
		return Objects.equals(codigo, other.codigo);
	}

	@Override
	public String toString() {
		return "CodigosSAS [codigo=" + codigo + ", producto=" + producto + ", descripcion=" + descripcion + "]";
	}
	
	
}
