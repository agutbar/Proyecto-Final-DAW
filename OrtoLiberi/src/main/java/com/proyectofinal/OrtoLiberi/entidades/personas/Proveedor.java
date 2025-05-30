package com.proyectofinal.OrtoLiberi.entidades.personas;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import com.proyectofinal.OrtoLiberi.entidades.pedidos.PedidoProveedor;

import jakarta.persistence.*;
import jakarta.validation.constraints.*;

@Entity
@Table(name = "proveedores")
public class Proveedor {

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
	
	@NotBlank(message = "El cif es obligatorio")
    @Size(min = 8, max = 9, message = "El cif debe tener entre 8 y 9 caracteres")
    private String cif;
	
	@NotBlank(message = "El nombre es obligatorio")
    @Size(min = 3, max = 100, message = "El nombre debe tener entre 3 y 100 caracteres")
    private String nombre;
	
	@NotNull(message = "El teléfono no puede ser nulo")
    @Pattern(regexp = "\\d{9,15}", message = "El teléfono debe contener entre 9 y 15 dígitos")
    private String telefono;
	
	@NotBlank(message = "El correo no puede estar vacío.")
	@Email(message = "Debe ser un correo electrónico válido.")
	private String correo;
	
	@NotNull(message = "El estado debe ser normal, de vacaciones, desabastecido o cerrado")
	@Pattern(regexp= "^(normal|de-vacaciones|desabastecido|cerrado)$")
	private String estado;
	
	@OneToMany(mappedBy = "proveedor", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<PedidoProveedor> pedidos = new ArrayList<>();
	
	public Proveedor() {
		
	}

	public Proveedor(Long id,
			@NotBlank(message = "El cif es obligatorio") @Size(min = 8, max = 9, message = "El cif debe tener entre 8 y 9 caracteres") String cif,
			@NotBlank(message = "El nombre es obligatorio") @Size(min = 3, max = 100, message = "El nombre debe tener entre 3 y 100 caracteres") String nombre,
			@NotNull(message = "El teléfono no puede ser nulo") @Pattern(regexp = "\\d{9,15}", message = "El teléfono debe contener entre 9 y 15 dígitos") String telefono,
			@NotBlank(message = "El correo no puede estar vacío.") @Email(message = "Debe ser un correo electrónico válido.") String correo,
			@NotNull(message = "El estado debe ser normal, de vacaciones, desabastecido o cerrado") @Pattern(regexp = "^(Normal|De Vacaciones|Desabastecido|Cerrado)$") String estado,
			List<PedidoProveedor> pedidos) {
		this.id = id;
		this.cif = cif;
		this.nombre = nombre;
		this.telefono = telefono;
		this.correo = correo;
		this.estado = estado;
		this.pedidos = pedidos;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getCif() {
		return cif;
	}

	public void setCif(String cif) {
		this.cif = cif;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getTelefono() {
		return telefono;
	}

	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}

	public String getCorreo() {
		return correo;
	}

	public void setCorreo(String correo) {
		this.correo = correo;
	}

	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

	public List<PedidoProveedor> getPedidos() {
		return pedidos;
	}

	public void setPedidos(List<PedidoProveedor> pedidos) {
		this.pedidos = pedidos;
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
		Proveedor other = (Proveedor) obj;
		return Objects.equals(id, other.id);
	}

	@Override
	public String toString() {
		return "Proveedor [id=" + id + ", nombre=" + nombre + ", telefono=" + telefono + ", correo=" + correo
				+ ", estado=" + estado + ", pedidos=" + pedidos + "]";
	}
	
	
}
