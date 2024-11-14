/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.proyecto_clinica.cita;

import com.proyecto_clinica.paciente.PacienteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/paciente/citas")
public class CitaPacienteController {

    @Autowired
    private CitaService citaService;

    @Autowired
    private PacienteService pacienteService;

    // Solicitar una nueva cita
    @PostMapping("/solicitar/{documentoIdentidad}")
    public ResponseEntity<Cita> solicitarCita(
            @PathVariable String documentoIdentidad,
            @RequestBody CitaRequest citaRequest) {
        Cita nuevaCita = citaService.crearCita(
                documentoIdentidad,
                citaRequest.getFecha(),
                citaRequest.getHora());
        return new ResponseEntity<>(nuevaCita, HttpStatus.CREATED);
    }

    // Listar citas de un paciente
    @GetMapping("/mis-citas/{documentoIdentidad}")
    public ResponseEntity<List<Cita>> listarCitasDelPaciente(@PathVariable String documentoIdentidad) {
        List<Cita> citas = citaService.obtenerCitasPorDocumentoIdentidad(documentoIdentidad);
        return new ResponseEntity<>(citas, HttpStatus.OK);
    }
}
