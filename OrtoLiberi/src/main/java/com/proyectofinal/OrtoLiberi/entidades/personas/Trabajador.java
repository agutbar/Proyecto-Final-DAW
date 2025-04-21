package com.proyectofinal.OrtoLiberi.entidades.personas;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import com.proyectofinal.OrtoLiberi.entidades.elementos.Fabricacion;
import com.proyectofinal.OrtoLiberi.entidades.procesos.AusenciaTrabajador;
import com.proyectofinal.OrtoLiberi.entidades.procesos.Compra;

import jakarta.persistence.*;
import jakarta.validation.constraints.*;

@Entity
@Table(name = "trabajadores")
public class Trabajador {

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
	
	@NotBlank(message = "El nombre es obligatorio")
    @Size(min = 3, max = 100, message = "El nombre debe tener entre 3 y 100 caracteres")
    private String nombre;
	
	@NotBlank(message = "Los apellidos son obligatorios")
    @Size(min = 3, max = 100, message = "Los apellidos debe tener entre 3 y 100 caracteres")
    private String apellidos;
	
	@NotBlank(message = "La fecha de nacimiento es obligatoria")
    private LocalDate nacimiento;
	
	@NotNull(message = "El teléfono no puede ser nulo")
    @Pattern(regexp = "\\d{9,15}", message = "El teléfono debe contener entre 9 y 15 dígitos")
    private String telefono;
	
	@NotBlank(message = "El correo no puede estar vacío.")
    @Email(message = "Debe ser un correo electrónico válido.")
    private String correo;

    @NotNull(message = "La dirección no puede ser nula")
    @Size(min = 5, max = 255, message = "La dirección debe tener entre 5 y 255 caracteres")
    private String direccion;
    
    @NotBlank(message = "El usuario es obligatorio")
    @Size(min = 3, max = 10, message = "El usuario debe tener entre 3 y 10 caracteres")
    private String usuario;
    
    @NotBlank(message = "La contraseña es obligatorio")
    @Size(min = 8, max = 12, message = "La contraseña debe tener entre 8 y 12 caracteres")
    @Pattern(regexp = "^(?=.*[A-Z])(?=.*[a-z])(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]+$", message = "La contraseña debe incluir al menos una mayúscula, una minúscula, un número y un carácter especial")
    private String password;
    
    @OneToMany(mappedBy = "vendedor", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Compra> ventas = new ArrayList<>();
    
    @OneToMany(mappedBy = "responsable", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Fabricacion> trabajos = new ArrayList<>();
    
    @OneToMany(mappedBy = "tecnico", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<AusenciaTrabajador> ausencias = new ArrayList<>();

	public Trabajador() {
		
	}

	public Trabajador(Long id,
			@NotBlank(message = "El nombre es obligatorio") @Size(min = 3, max = 100, message = "El nombre debe tener entre 3 y 100 caracteres") String nombre,
			@NotBlank(message = "Los apellidos son obligatorios") @Size(min = 3, max = 100, message = "Los apellidos debe tener entre 3 y 100 caracteres") String apellidos,
			@NotBlank(message = "La fecha de nacimiento es obligatoria") LocalDate nacimiento,
			@NotNull(message = "El teléfono no puede ser nulo") @Pattern(regexp = "\\d{9,15}", message = "El teléfono debe contener entre 9 y 15 dígitos") String telefono,
			@NotBlank(message = "El correo no puede estar vacío.") @Email(message = "Debe ser un correo electrónico válido.") String correo,
			@NotNull(message = "La dirección no puede ser nula") @Size(min = 5, max = 255, message = "La dirección debe tener entre 5 y 255 caracteres") String direccion,
			@NotBlank(message = "El usuario es obligatorio") @Size(min = 3, max = 10, message = "El usuario debe tener entre 3 y 10 caracteres") String usuario,
			@NotBlank(message = "La contraseña es obligatorio") @Size(min = 8, max = 12, message = "La contraseña debe tener entre 8 y 12 caracteres") @Pattern(regexp = "^(?=.*[A-Z])(?=.*[a-z])(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]+$", message = "La contraseña debe incluir al menos una mayúscula, una minúscula, un número y un carácter especial") String password,
			List<Compra> ventas, List<Fabricacion> trabajos, List<AusenciaTrabajador> ausencias) {
		super();
		this.id = id;
		this.nombre = nombre;
		this.apellidos = apellidos;
		this.nacimiento = nacimiento;
		this.telefono = telefono;
		this.correo = correo;
		this.direccion = direccion;
		this.usuario = usuario;
		this.password = password;
		this.ventas = ventas;
		this.trabajos = trabajos;
		this.ausencias = ausencias;
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

	public LocalDate getNacimiento() {
		return nacimiento;
	}

	public void setNacimiento(LocalDate nacimiento) {
		this.nacimiento = nacimiento;
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

	public String getDireccion() {
		return direccion;
	}

	public void setDireccion(String direccion) {
		this.direccion = direccion;
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

	public List<Compra> getVentas() {
		return ventas;
	}

	public void setVentas(List<Compra> ventas) {
		this.ventas = ventas;
	}

	public List<Fabricacion> getTrabajos() {
		return trabajos;
	}

	public void setTrabajos(List<Fabricacion> trabajos) {
		this.trabajos = trabajos;
	}

	public List<AusenciaTrabajador> getAusencias() {
		return ausencias;
	}

	public void setAusencias(List<AusenciaTrabajador> ausencias) {
		this.ausencias = ausencias;
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
		Trabajador other = (Trabajador) obj;
		return Objects.equals(id, other.id);
	}

	@Override
	public String toString() {
		return "Trabajador [id=" + id + ", nombre=" + nombre + ", apellidos=" + apellidos + ", nacimiento=" + nacimiento
				+ ", telefono=" + telefono + ", correo=" + correo + ", direccion=" + direccion + ", usuario=" + usuario
				+ ", password=" + password + ", ventas=" + ventas + ", trabajos=" + trabajos + "]";
	}
    
    
}
