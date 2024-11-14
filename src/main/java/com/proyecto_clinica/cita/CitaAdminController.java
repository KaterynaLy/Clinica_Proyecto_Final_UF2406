/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.proyecto_clinica.cita;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;

@RestController
@RequestMapping("/api/admin/citas")
public class CitaAdminController {

    @Autowired
    private CitaService citaService;

    // Obtener todas las citas pendientes
    @GetMapping("/pendientes")
    public ResponseEntity<List<Cita>> obtenerCitasPendientes() {
        List<Cita> citasPendientes = citaService.obtenerCitasPorEstado("Pendiente");
        return new ResponseEntity<>(citasPendientes, HttpStatus.OK);
    }

    // Aprobar una cita o proponer una nueva fecha y hora
    @PutMapping("/{id}/aprobar")
    public ResponseEntity<Cita> aprobarCita(
            @PathVariable Long id,
            @RequestParam(required = false) LocalDate nuevaFecha,
            @RequestParam(required = false) LocalTime nuevaHora) {
        Cita citaAprobada = citaService.aprobarOReprogramarCita(id, nuevaFecha, nuevaHora);
        return new ResponseEntity<>(citaAprobada, HttpStatus.OK);
    }
}
