package com.proyectofinal.OrtoLiberi.entidades.elementos;

import java.time.LocalDate;
import java.util.Objects;

import com.proyectofinal.OrtoLiberi.entidades.personas.Cliente;

import jakarta.persistence.*;
import jakarta.validation.constraints.*;

@Entity
@Table(name = "segundaMano")
public class SegundaMano {

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
	
	@ManyToOne
    @JoinColumn(name = "cliente_id", nullable = false)
    private Cliente vendedor;
	
	@ManyToOne
    @JoinColumn(name = "producto_id", nullable = true)
    private Producto prefabricado;
	
	@ManyToOne
    @JoinColumn(name = "fabricacion_id", nullable = true)
    private Fabricacion fabricado;

	@NotBlank(message = "La fecha de entrega es obligatoria")
    private LocalDate entrega;
    
    @NotNull(message = "El precio de venta original no puede ser nulo")
    @Min(value = 0, message = "El precio de venta original no puede ser negativo")
    private double original;
    
    @NotNull(message = "El precio de venta de segunda mano no puede ser nulo")
    @Min(value = 0, message = "El precio de venta de segunda mano no puede ser negativo")
    private double reciclado;
    
    @NotNull(message = "El porcentaje para el cliente original no puede ser nulo")
    @Min(value = 0, message = "El porcentaje para el cliente original no puede ser negativo")
    @Max(value = 100, message = "El porcentaje para el cliente original no puede ser superior a 100")
    private Integer paciente;
    
    @NotNull(message = "El porcentaje para la empresa no puede ser nulo")
    @Min(value = 0, message = "El porcentaje para la empresa no puede ser negativo")
    @Max(value = 100, message = "El porcentaje para la empresa no puede ser superior a 100")
    private Integer empresa;
    
    public SegundaMano() {
		
	}

	public SegundaMano(Long id, Cliente vendedor, Producto prefabricado, Fabricacion fabricado,
			@NotBlank(message = "La fecha de entrega es obligatoria") LocalDate entrega,
			@NotNull(message = "El precio de venta original no puede ser nulo") @Min(value = 0, message = "El precio de venta original no puede ser negativo") double original,
			@NotNull(message = "El precio de venta de segunda mano no puede ser nulo") @Min(value = 0, message = "El precio de venta de segunda mano no puede ser negativo") double reciclado,
			@NotNull(message = "El porcentaje para el cliente original no puede ser nulo") @Min(value = 0, message = "El porcentaje para el cliente original no puede ser negativo") @Max(value = 100, message = "El porcentaje para el cliente original no puede ser superior a 100") Integer paciente,
			@NotNull(message = "El porcentaje para la empresa no puede ser nulo") @Min(value = 0, message = "El porcentaje para la empresa no puede ser negativo") @Max(value = 100, message = "El porcentaje para la empresa no puede ser superior a 100") Integer empresa) {
		super();
		this.id = id;
		this.vendedor = vendedor;
		this.prefabricado = prefabricado;
		this.fabricado = fabricado;
		this.entrega = entrega;
		this.original = original;
		this.reciclado = reciclado;
		this.paciente = paciente;
		this.empresa = empresa;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Cliente getVendedor() {
		return vendedor;
	}

	public void setVendedor(Cliente vendedor) {
		this.vendedor = vendedor;
	}

	public Producto getPrefabricado() {
		return prefabricado;
	}

	public void setPrefabricado(Producto prefabricado) {
		this.prefabricado = prefabricado;
	}

	public Fabricacion getFabricado() {
		return fabricado;
	}

	public void setFabricado(Fabricacion fabricado) {
		this.fabricado = fabricado;
	}

	public LocalDate getEntrega() {
		return entrega;
	}

	public void setEntrega(LocalDate entrega) {
		this.entrega = entrega;
	}

	public double getOriginal() {
		return original;
	}

	public void setOriginal(double original) {
		this.original = original;
	}

	public double getReciclado() {
		return reciclado;
	}

	public void setReciclado(double reciclado) {
		this.reciclado = reciclado;
	}

	public Integer getPaciente() {
		return paciente;
	}

	public void setPaciente(Integer paciente) {
		this.paciente = paciente;
	}

	public Integer getEmpresa() {
		return empresa;
	}

	public void setEmpresa(Integer empresa) {
		this.empresa = empresa;
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
		SegundaMano other = (SegundaMano) obj;
		return Objects.equals(id, other.id);
	}

	@Override
	public String toString() {
		return "SegundaMano [id=" + id + ", vendedor=" + vendedor + ", prefabricado=" + prefabricado + ", fabricado="
				+ fabricado + ", entrega=" + entrega + ", original=" + original + ", reciclado=" + reciclado
				+ ", paciente=" + paciente + ", empresa=" + empresa + "]";
	}
	
    
}
