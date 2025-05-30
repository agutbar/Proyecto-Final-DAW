package com.proyectofinal.OrtoLiberi.entidades.procesos;

import java.time.LocalDate;
import java.util.Objects;

import com.proyectofinal.OrtoLiberi.entidades.elementos.SegundaMano;
import com.proyectofinal.OrtoLiberi.entidades.personas.Cliente;

import jakarta.persistence.*;
import jakarta.validation.constraints.*;

@Entity
@Table(name = "reciclaje")
public class Reciclaje {
	
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
	
	@ManyToOne
    @JoinColumn(name = "cliente_id", nullable = false)
    private Cliente comprador;
	
	@ManyToOne
    @JoinColumn(name = "segundaMano_id", nullable = false)
    private SegundaMano producto;
	
	@NotBlank(message = "La fecha de venta es obligatoria")
    private LocalDate venta;
	
	@NotNull(message = "El pago debe ser en efectivo o con tarjeta")
	@Pattern(regexp= "^(Efectivo|Tarjeta)$")
	private String pago;

	public Reciclaje() {

	}

	public Reciclaje(Long id, Cliente comprador, SegundaMano producto,
			@NotBlank(message = "La fecha de venta es obligatoria") LocalDate venta,
			@NotNull(message = "El pago debe ser en efectivo o con tarjeta") @Pattern(regexp = "^(Efectivo|Tarjeta)$") String pago) {
		super();
		this.id = id;
		this.comprador = comprador;
		this.producto = producto;
		this.venta = venta;
		this.pago = pago;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Cliente getComprador() {
		return comprador;
	}

	public void setComprador(Cliente comprador) {
		this.comprador = comprador;
	}

	public SegundaMano getProducto() {
		return producto;
	}

	public void setProducto(SegundaMano producto) {
		this.producto = producto;
	}

	public LocalDate getVenta() {
		return venta;
	}

	public void setVenta(LocalDate venta) {
		this.venta = venta;
	}

	public String getPago() {
		return pago;
	}

	public void setPago(String pago) {
		this.pago = pago;
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
		Reciclaje other = (Reciclaje) obj;
		return Objects.equals(id, other.id);
	}

	@Override
	public String toString() {
		return "Reciclaje [id=" + id + ", comprador=" + comprador + ", producto=" + producto + ", venta=" + venta
				+ ", pago=" + pago + "]";
	}
	
	
}
