package com.proyectofinal.OrtoLiberi.entidades.pedidos;

import java.time.LocalDate;
import java.util.Objects;

import com.proyectofinal.OrtoLiberi.entidades.elementos.Fabricacion;
import com.proyectofinal.OrtoLiberi.entidades.personas.Cliente;

import jakarta.persistence.*;
import jakarta.validation.constraints.*;

@Entity
@Table(name = "pedido_fabricacion")
public class PedidoFabricacion {
	
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
	
	@NotNull(message = "La fecha de peticion es obligatoria")
    private LocalDate peticion;
	
	@NotNull(message = "La fecha prevista de entrega es obligatoria")
    private LocalDate prevision;
	
	@NotNull(message = "El estado debe ser en cola, fabricando, terminado, entregado o cancelado")
	@Pattern(regexp= "^(en-cola|fabricando|terminado|entregado|cancelado)$")
	private String estado;
	
	@ManyToOne
    @JoinColumn(name = "cliente_id", nullable = false)
    private Cliente cliente;
	
	@ManyToOne
    @JoinColumn(name = "fabricacion_id", nullable = false)
    private Fabricacion producto;
	
	public PedidoFabricacion() {
		
	}

	public PedidoFabricacion(Long id, @NotBlank(message = "La fecha de peticion es obligatoria") LocalDate peticion,
			@NotBlank(message = "La fecha prevista de entrega es obligatoria") LocalDate prevision,
			@NotNull(message = "El estado debe ser en cola, fabricando, terminado, entregado o cancelado") @Pattern(regexp = "^(En cola|Fabricando|Terminado|Entregado|Cancelado)$") String estado,
			Cliente cliente, Fabricacion producto) {
		super();
		this.id = id;
		this.peticion = peticion;
		this.prevision = prevision;
		this.estado = estado;
		this.cliente = cliente;
		this.producto = producto;
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

	public Fabricacion getProducto() {
		return producto;
	}

	public void setProducto(Fabricacion producto) {
		this.producto = producto;
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
		PedidoFabricacion other = (PedidoFabricacion) obj;
		return Objects.equals(id, other.id);
	}

	@Override
	public String toString() {
		return "PedidoFabricacion [id=" + id + ", peticion=" + peticion + ", prevision=" + prevision + ", estado="
				+ estado + ", cliente=" + cliente + ", producto=" + producto + "]";
	}
	
	
}
