package com.proyectofinal.OrtoLiberi.entidades.pedidos;

import java.time.LocalDate;
import java.util.Map;
import java.util.Objects;

import com.proyectofinal.OrtoLiberi.entidades.personas.Cliente;

import jakarta.persistence.*;
import jakarta.validation.constraints.*;

@Entity
@Table(name = "pedidosCliente")
public class PedidoCliente {
	
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
	
	@NotBlank(message = "La fecha de peticion es obligatoria")
    private LocalDate peticion;
	
	@NotBlank(message = "La fecha prevista de entrega es obligatoria")
    private LocalDate prevision;
	
	@NotNull(message = "El estado debe ser en cola, en tramite, enviado, recibido o cancelado")
	@Pattern(regexp= "^(En cola|En tramite|Enviado|Recibido|Cancelado)$")
	private String estado;
	
	@ManyToOne
    @JoinColumn(name = "cliente_id", nullable = false)
    private Cliente cliente;
	
	@ElementCollection
    @CollectionTable(name = "pedidosCliente_producto", joinColumns = @JoinColumn(name = "pedidosCliente_id"))
    @MapKeyJoinColumn(name = "producto_id")
    private Map<Long, Integer> productos;
	
	public PedidoCliente() {
		
	}

	public PedidoCliente(Long id, @NotBlank(message = "La fecha de peticion es obligatoria") LocalDate peticion,
			@NotBlank(message = "La fecha prevista de entrega es obligatoria") LocalDate prevision,
			@NotNull(message = "El estado debe ser en cola, en tramite, enviado, recibido o cancelado") @Pattern(regexp = "^(En cola|En tramite|Enviado|Recibido|Cancelado)$") String estado,
			Cliente cliente, Map<Long, Integer> productos) {
		super();
		this.id = id;
		this.peticion = peticion;
		this.prevision = prevision;
		this.estado = estado;
		this.cliente = cliente;
		this.productos = productos;
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

	public LocalDate getPrevision() {
		return prevision;
	}

	public void setPrevision(LocalDate prevision) {
		this.prevision = prevision;
	}

	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

	public Cliente getCliente() {
		return cliente;
	}

	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}

	public Map<Long, Integer> getProductos() {
		return productos;
	}

	public void setProductos(Map<Long, Integer> productos) {
		this.productos = productos;
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
		PedidoCliente other = (PedidoCliente) obj;
		return Objects.equals(id, other.id);
	}

	@Override
	public String toString() {
		return "PedidoCliente [id=" + id + ", peticion=" + peticion + ", prevision=" + prevision + ", estado=" + estado
				+ ", cliente=" + cliente + ", productos=" + productos + "]";
	}
	
	

}
