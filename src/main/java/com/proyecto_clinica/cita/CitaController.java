package com.proyecto_clinica.cita;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;

@RestController
@RequestMapping("/api/citas")
public class CitaController {

    @Autowired
    private CitaService citaService;

    // Solicitar una cita
    @PostMapping("/solicitar/{documentoIdentidad}")
    public ResponseEntity<Cita> solicitarCita(
            @PathVariable String documentoIdentidad,
            @RequestBody CitaRequest citaRequest) {
        Cita cita = citaService.crearCita(
                documentoIdentidad,
                citaRequest.getFecha(),
                citaRequest.getHora());
        return new ResponseEntity<>(cita, HttpStatus.CREATED);
    }

    // Listar citas del paciente
    @GetMapping("/mis-citas/{idPaciente}")
    public ResponseEntity<List<Cita>> listarCitas(@PathVariable Long idPaciente) {
        List<Cita> citas = citaService.obtenerCitasPorIdPaciente(idPaciente);
        return new ResponseEntity<>(citas, HttpStatus.OK);
    }
}
