package com.proyectofinal.OrtoLiberi.entidades.procesos;

import java.time.LocalDate;
import java.util.Objects;

import com.proyectofinal.OrtoLiberi.entidades.personas.Trabajador;

import jakarta.persistence.*;
import jakarta.validation.constraints.*;

@Entity
@Table(name = "ausenciaTrabajador")
public class AusenciaTrabajador {

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
	
	@NotNull(message = "La fecha de baja es obligatoria")
    private LocalDate baja;
	
	@NotNull(message = "La fecha de alta de entrega es obligatoria")
    private LocalDate alta;
	
	@NotNull(message = "El estado debe ser cita medica, enfermedad, vacaciones, baja medica o asuntos personales")
	@Pattern(regexp= "^(cita-medica|enfermedad|vacaciones|baja-medica|asuntos-personales)$")
	private String motivo;
	
	@NotNull(message = "Los dias de ausencia son obligatorios")
	@Min(value = 0, message = "Los dias de ausencia no pueden ser negativos")
    private Integer dias;
	
	@ManyToOne
    @JoinColumn(name = "trabajador_id", nullable = false)
    private Trabajador tecnico;

	public AusenciaTrabajador() {
		
	}

	public AusenciaTrabajador(Long id, @NotBlank(message = "La fecha de baja es obligatoria") LocalDate baja,
			@NotBlank(message = "La fecha de alta de entrega es obligatoria") LocalDate alta,
			@NotNull(message = "El estado debe ser cita medica, enfermedad, vacaciones, baja medica o asuntos personales") @Pattern(regexp = "^(Cita Medica|Enfermedad|Vacaciones|Baja Medica|Asuntos Personales)$") String motivo,
			@NotBlank(message = "Los dias de ausencia son obligatorios") Integer dias, Trabajador tecnico) {
		super();
		this.id = id;
		this.baja = baja;
		this.alta = alta;
		this.motivo = motivo;
		this.dias = dias;
		this.tecnico = tecnico;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public LocalDate getBaja() {
		return baja;
	}

	public void setBaja(LocalDate baja) {
		this.baja = baja;
	}

	public LocalDate getAlta() {
		return alta;
	}

	public void setAlta(LocalDate alta) {
		this.alta = alta;
	}

	public String getMotivo() {
		return motivo;
	}

	public void setMotivo(String motivo) {
		this.motivo = motivo;
	}

	public Integer getDias() {
		return dias;
	}

	public void setDias(Integer dias) {
		this.dias = dias;
	}

	public Trabajador getTecnico() {
		return tecnico;
	}

	public void setTecnico(Trabajador tecnico) {
		this.tecnico = tecnico;
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
		AusenciaTrabajador other = (AusenciaTrabajador) obj;
		return Objects.equals(id, other.id);
	}

	@Override
	public String toString() {
		return "AusenciaTrabajador [id=" + id + ", baja=" + baja + ", alta=" + alta + ", motivo=" + motivo + ", dias="
				+ dias + ", tecnico=" + tecnico + "]";
	}
	
	
}
