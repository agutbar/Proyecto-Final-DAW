package com.proyectofinal.OrtoLiberi.entidades.personas;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import com.proyectofinal.OrtoLiberi.entidades.elementos.Revision;
import com.proyectofinal.OrtoLiberi.entidades.pedidos.PedidoFabricacion;
import com.proyectofinal.OrtoLiberi.entidades.procesos.Compra;

import jakarta.persistence.*;
import jakarta.validation.constraints.*;

@Entity
@Table(name = "clientes")
public class Cliente {
	
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
	
	@NotBlank(message = "El nombre es obligatorio")
    @Size(min = 3, max = 100, message = "El nombre debe tener entre 3 y 100 caracteres")
    private String nombre;
	
	@NotBlank(message = "Los apellidos son obligatorios")
    @Size(min = 3, max = 100, message = "Los apellidos deben tener entre 3 y 100 caracteres")
    private String apellidos;
	
	@NotNull(message = "El teléfono no puede ser nulo")
    @Pattern(regexp = "\\d{9,15}", message = "El teléfono debe contener entre 9 y 15 dígitos")
    private String telefono;

    @NotNull(message = "La dirección no puede ser nula")
    @Size(min = 5, max = 255, message = "La dirección debe tener entre 5 y 255 caracteres")
    private String direccion;
    
    @NotBlank(message = "El correo no puede estar vacío.")
    @Email(message = "Debe ser un correo electrónico válido.")
    private String correo;
    
    @NotBlank(message = "El usuario es obligatorio")
    @Size(min = 3, max = 10, message = "El usuario debe tener entre 3 y 10 caracteres")
    private String usuario;
    
    @NotBlank(message = "La contraseña es obligatorio")
    @Size(min = 8, max = 12, message = "La contraseña debe tener entre 8 y 12 caracteres")
    @Pattern(regexp = "^(?=.*[A-Z])(?=.*[a-z])(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]+$", message = "La contraseña debe incluir al menos una mayúscula, una minúscula, un número y un carácter especial")
    private String password;
    
    @OneToMany(mappedBy = "tutor", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Hijo> menores = new ArrayList<>();
    
    @OneToMany(mappedBy = "solicitante", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Revision> citas = new ArrayList<>();
    
    @OneToMany(mappedBy = "cliente", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<PedidoFabricacion> productos_taller = new ArrayList<>();
    
    @OneToMany(mappedBy = "comprador", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Compra> compras = new ArrayList<>();
    
    public Cliente() {
		
	}

	public Cliente(Long id,
			@NotBlank(message = "El nombre es obligatorio") @Size(min = 3, max = 100, message = "El nombre debe tener entre 3 y 100 caracteres") String nombre,
			@NotBlank(message = "Los apellidos son obligatorios") @Size(min = 3, max = 100, message = "Los apellidos deben tener entre 3 y 100 caracteres") String apellidos,
			@NotNull(message = "El teléfono no puede ser nulo") @Pattern(regexp = "\\d{9,15}", message = "El teléfono debe contener entre 9 y 15 dígitos") String telefono,
			@NotNull(message = "La dirección no puede ser nula") @Size(min = 5, max = 255, message = "La dirección debe tener entre 5 y 255 caracteres") String direccion,
			@NotBlank(message = "El correo no puede estar vacío.") @Email(message = "Debe ser un correo electrónico válido.") String correo,
			@NotBlank(message = "El usuario es obligatorio") @Size(min = 3, max = 10, message = "El usuario debe tener entre 3 y 10 caracteres") String usuario,
			@NotBlank(message = "La contraseña es obligatorio") @Size(min = 8, max = 12, message = "La contraseña debe tener entre 8 y 12 caracteres") @Pattern(regexp = "^(?=.*[A-Z])(?=.*[a-z])(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]+$", message = "La contraseña debe incluir al menos una mayúscula, una minúscula, un número y un carácter especial") String password,
			List<Hijo> menores, List<Revision> citas, List<PedidoFabricacion> productos_taller, List<Compra> compras) {
		super();
		this.id = id;
		this.nombre = nombre;
		this.apellidos = apellidos;
		this.telefono = telefono;
		this.direccion = direccion;
		this.correo = correo;
		this.usuario = usuario;
		this.password = password;
		this.menores = menores;
		this.citas = citas;
		this.productos_taller = productos_taller;
		this.compras = compras;
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

	public String getApellidos() {
		return apellidos;
	}

	public void setApellidos(String apellidos) {
		this.apellidos = apellidos;
	}

	public String getTelefono() {
		return telefono;
	}

	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}

	public String getDireccion() {
		return direccion;
	}

	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}

	public String getCorreo() {
		return correo;
	}

	public void setCorreo(String correo) {
		this.correo = correo;
	}

	public String getUsuario() {
		return usuario;
	}

	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public List<Hijo> getMenores() {
		return menores;
	}

	public void setMenores(List<Hijo> menores) {
		this.menores = menores;
	}

	public List<Revision> getCitas() {
		return citas;
	}

	public void setCitas(List<Revision> citas) {
		this.citas = citas;
	}

	public List<PedidoFabricacion> getProductos_taller() {
		return productos_taller;
	}

	public void setProductos_taller(List<PedidoFabricacion> productos_taller) {
		this.productos_taller = productos_taller;
	}

	public List<Compra> getCompras() {
		return compras;
	}

	public void setCompras(List<Compra> compras) {
		this.compras = compras;
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
		Cliente other = (Cliente) obj;
		return Objects.equals(id, other.id);
	}

	@Override
	public String toString() {
		return "Cliente [id=" + id + ", nombre=" + nombre + ", apellidos=" + apellidos + ", telefono=" + telefono
				+ ", direccion=" + direccion + ", correo=" + correo + ", usuario=" + usuario + ", password=" + password
				+ ", menores=" + menores + ", citas=" + citas + ", productos_taller=" + productos_taller + ", compras="
				+ compras + "]";
	}

    
}
