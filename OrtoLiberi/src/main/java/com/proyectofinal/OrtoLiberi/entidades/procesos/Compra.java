package com.proyectofinal.OrtoLiberi.entidades.procesos;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Objects;

import com.proyectofinal.OrtoLiberi.entidades.elementos.Producto;
import com.proyectofinal.OrtoLiberi.entidades.personas.Cliente;
import com.proyectofinal.OrtoLiberi.entidades.personas.Trabajador;

import jakarta.persistence.*;
import jakarta.validation.constraints.*;

@Entity
@Table(name = "compras")
public class Compra {

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
	
	@NotBlank(message = "La fecha de compra es obligatoria")
    private LocalDate fecha;
	
	@NotNull(message = "El pago debe ser en efectivo o con tarjeta")
	@Pattern(regexp= "^(Efectivo|Tarjeta)$")
	private String pago;
	
	@NotNull(message = "El tipo de compra debe ser online o presencial")
	@Pattern(regexp= "^(Online|Presencial)$")
	private String tipo;
	
	@ElementCollection
    @CollectionTable(name = "compra_productos", joinColumns = @JoinColumn(name = "compra_id"))
    @MapKeyJoinColumn(name = "producto_id")
    private Map<Long, Integer> productos;
	
	@ManyToOne
    @JoinColumn(name = "trabajador_id", nullable = false)
    private Trabajador vendedor;
	
	@ManyToOne
    @JoinColumn(name = "cliente_id", nullable = false)
    private Cliente comprador;

	public Compra() {
		
	}

	public Compra(Long id, @NotBlank(message = "La fecha de compra es obligatoria") LocalDate fecha,
			@NotNull(message = "El pago debe ser en efectivo o con tarjeta") @Pattern(regexp = "^(Efectivo|Tarjeta)$") String pago,
			@NotNull(message = "El tipo de compra debe ser online o presencial") @Pattern(regexp = "^(Online|Presencial)$") String tipo,
			Map<Long, Integer> productos, Trabajador vendedor, Cliente comprador) {
		super();
		this.id = id;
		this.fecha = fecha;
		this.pago = pago;
		this.tipo = tipo;
		this.productos = productos;
		this.vendedor = vendedor;
		this.comprador = comprador;
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

	public String getPago() {
		return pago;
	}

	public void setPago(String pago) {
		this.pago = pago;
	}

	public String getTipo() {
		return tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}

	public Map<Long, Integer> getProductos() {
		return productos;
	}

	public void setProductos(Map<Long, Integer> productos) {
		this.productos = productos;
	}

	public Trabajador getVendedor() {
		return vendedor;
	}

	public void setVendedor(Trabajador vendedor) {
		this.vendedor = vendedor;
	}

	public Cliente getComprador() {
		return comprador;
	}

	public void setComprador(Cliente comprador) {
		this.comprador = comprador;
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
		Compra other = (Compra) obj;
		return Objects.equals(id, other.id);
	}

	@Override
	public String toString() {
		return "Compra [id=" + id + ", fecha=" + fecha + ", pago=" + pago + ", tipo=" + tipo + ", productos="
				+ productos + ", vendedor=" + vendedor + ", comprador=" + comprador + "]";
	}
	
	
}
