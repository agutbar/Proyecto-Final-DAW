package com.proyectofinal.OrtoLiberi.entidades.pedidos;

import java.time.LocalDate;
import java.util.Map;
import java.util.Objects;

import com.proyectofinal.OrtoLiberi.entidades.personas.Proveedor;

import jakarta.persistence.*;
import jakarta.validation.constraints.*;

@Entity
@Table(name = "pedidosProveedor")
public class PedidoProveedor {
	
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
	
	@NotBlank(message = "La fecha de peticion es obligatoria")
    private LocalDate peticion;
	
	@NotNull(message = "El estado debe ser realizado, recibido o cancelado")
	@Pattern(regexp= "^(realizado|recibido|cancelado)$")
	private String estado;
	
	@ManyToOne
    @JoinColumn(name = "proveedor_id", nullable = false)
    private Proveedor proveedor;
	
	@NotNull(message = "El importe no puede ser nulo")
    @Min(value = 0, message = "El importe no puede ser negativo")
    private double importe;
	
	@ElementCollection
    @CollectionTable(name = "pedidosProveedor_producto", joinColumns = @JoinColumn(name = "pedidosProveedor_id"))
    @MapKeyJoinColumn(name = "producto_id")
    private Map<Long, Integer> productos;
	
	@ElementCollection
    @CollectionTable(name = "pedidosProveedor_material", joinColumns = @JoinColumn(name = "pedidosProveedor_id"))
    @MapKeyJoinColumn(name = "materiales_id")
    private Map<Long, Integer> materiales;
	
	public PedidoProveedor() {
		
	}

	public PedidoProveedor(Long id, @NotBlank(message = "La fecha de peticion es obligatoria") LocalDate peticion,
			@NotNull(message = "El estado debe ser realizado, recibido o cancelado") @Pattern(regexp = "^(Realizado|Recibido|Cancelado)$") String estado,
			Proveedor proveedor, Map<Long, Integer> productos, Map<Long, Integer> materiales) {
		super();
		this.id = id;
		this.peticion = peticion;
		this.estado = estado;
		this.proveedor = proveedor;
		this.productos = productos;
		this.materiales = materiales;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public LocalDate getPeticion() {
		return peticion;
	}

	public void setPeticion(LocalDate peticion) {
		this.peticion = peticion;
	}

	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

	public Proveedor getProveedor() {
		return proveedor;
	}

	public void setProveedor(Proveedor proveedor) {
		this.proveedor = proveedor;
	}

	public Map<Long, Integer> getProductos() {
		return productos;
	}

	public void setProductos(Map<Long, Integer> productos) {
		this.productos = productos;
	}

	public Map<Long, Integer> getMateriales() {
		return materiales;
	}

	public void setMateriales(Map<Long, Integer> materiales) {
		this.materiales = materiales;
	}

	public double getImporte() {
		return importe;
	}

	public void setImporte(double importe) {
		this.importe = importe;
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
		PedidoProveedor other = (PedidoProveedor) obj;
		return Objects.equals(id, other.id);
	}

	@Override
	public String toString() {
		return "PedidoProveedor [id=" + id + ", peticion=" + peticion + ", estado=" + estado + ", proveedor="
				+ proveedor + ", productos=" + productos + ", materiales=" + materiales + "]";
	}
	
	

}
