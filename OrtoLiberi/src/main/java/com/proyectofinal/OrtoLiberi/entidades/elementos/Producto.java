package com.proyectofinal.OrtoLiberi.entidades.elementos;

import java.util.Objects;

import com.proyectofinal.OrtoLiberi.entidades.personas.Proveedor;

import jakarta.persistence.*;
import jakarta.validation.constraints.*;

@Entity
@Table(name = "productos")
public class Producto {
	
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
	
	@NotNull(message = "La cantidad no puede ser nula")
    @Min(value = 0, message = "La cantidad no puede ser negativa")
    private Integer stock;
	
	@NotNull(message = "El precio de coste no puede ser nulo")
    @Min(value = 0, message = "El precio de coste no puede ser negativo")
    private double coste;
	
	@NotNull(message = "El precio de venta no puede ser nulo")
    @Min(value = 0, message = "El precio de venta no puede ser negativo")
    private double precio;
	
	@NotNull(message = "La devolucion debe ser si o no")
	@Pattern(regexp= "^(si|no)$")
	private String devolución;
	
	@ManyToOne
    @JoinColumn(name = "proveedor_id", nullable = false)
    private Proveedor proveedor;
	
	@ManyToOne
    @JoinColumn(name = "codigos_codigo", nullable = false)
    private CodigoSAS codigoAsociado;
	
	@NotNull(message = "El estado debe ser activo o descatalogado")
	@Pattern(regexp= "^(activo|descatalogado)$")
	private String estado;
	
	public Producto() {
		
	}

	public Producto(Long id,
			@NotBlank(message = "El nombre es obligatorio") @Size(min = 3, max = 100, message = "El nombre debe tener entre 3 y 100 caracteres") String nombre,
			@Size(max = 255, message = "La descripción no debe superar los 255 caracteres") String descripcion,
			@NotBlank(message = "El número de lote es obligatorio") @Size(min = 3, max = 100, message = "El número de lote debe tener entre 3 y 100 caracteres") String lote,
			@NotNull(message = "La cantidad no puede ser nula") @Min(value = 0, message = "La cantidad no puede ser negativa") Integer stock,
			@NotNull(message = "El precio de coste no puede ser nulo") @Min(value = 0, message = "El precio de coste no puede ser negativo") double coste,
			@NotNull(message = "El precio de venta no puede ser nulo") @Min(value = 0, message = "El precio de venta no puede ser negativo") double precio,
			@NotNull(message = "La devolucion debe ser si o no") @Pattern(regexp = "^(si|no)$") String devolución,
			Proveedor proveedor) {
		this.id = id;
		this.nombre = nombre;
		this.descripcion = descripcion;
		this.lote = lote;
		this.stock = stock;
		this.coste = coste;
		this.precio = precio;
		this.devolución = devolución;
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

	public Integer getStock() {
		return stock;
	}

	public void setStock(Integer stock) {
		this.stock = stock;
	}

	public double getCoste() {
		return coste;
	}

	public void setCoste(double coste) {
		this.coste = coste;
	}

	public double getPrecio() {
		return precio;
	}

	public void setPrecio(double precio) {
		this.precio = precio;
	}

	public Proveedor getProveedor() {
		return proveedor;
	}

	public void setProveedor(Proveedor proveedor) {
		this.proveedor = proveedor;
	}

	public String getDevolución() {
		return devolución;
	}

	public void setDevolución(String devolución) {
		this.devolución = devolución;
	}

	public CodigoSAS getCodigoAsociado() {
		return codigoAsociado;
	}

	public void setCodigoAsociado(CodigoSAS codigoAsociado) {
		this.codigoAsociado = codigoAsociado;
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
		Producto other = (Producto) obj;
		return Objects.equals(id, other.id);
	}

	@Override
	public String toString() {
		return "Producto [id=" + id + ", nombre=" + nombre + ", descripcion=" + descripcion + ", lote=" + lote
				+ ", stock=" + stock + ", coste=" + coste + ", precio=" + precio + ", devolución=" + devolución
				+ ", proveedor=" + proveedor + "]";
	}

	
}
