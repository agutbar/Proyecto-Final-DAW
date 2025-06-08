package com.proyectofinal.OrtoLiberi;

import java.time.DayOfWeek;
import java.time.LocalDate;

public class CalcularDiasLaborables {
	
	public static LocalDate sumarDiasLaborables(LocalDate fechaInicio, int numeroDias) {
        LocalDate fechaResultante = fechaInicio;
        int diasSumados = 0;

        while (diasSumados < numeroDias) {
        	fechaResultante = fechaResultante.plusDays(1);
            if (fechaResultante.getDayOfWeek() != DayOfWeek.SATURDAY && fechaResultante.getDayOfWeek() != DayOfWeek.SUNDAY) {
            	diasSumados++;
            }
        }

        return fechaResultante;
    }
	
	public static Integer contarDiasLaborables(LocalDate fechaInicio, LocalDate fechaFin) {
        Integer diasLaborables = 0;
        LocalDate fechaActual = fechaInicio;

        while (!fechaActual.isAfter(fechaFin)) {
            DayOfWeek diaSemana = fechaActual.getDayOfWeek();

            // Contar solo días que no sean sábado ni domingo
            if (diaSemana != DayOfWeek.SATURDAY && diaSemana != DayOfWeek.SUNDAY) {
                diasLaborables++;
            }

            fechaActual = fechaActual.plusDays(1);
        }

        return diasLaborables;
    }

}
