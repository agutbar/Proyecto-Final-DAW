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

}
