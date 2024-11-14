package com.proyecto_clinica.cita;

import com.proyecto_clinica.cita.Cita;
import com.proyecto_clinica.cita.CitaRepository;
import com.proyecto_clinica.paciente.Paciente;
import com.proyecto_clinica.paciente.PacienteRepository;
import java.time.LocalDate;
import java.time.LocalTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Optional;

@Service
public class CitaService {

    @Autowired
    private CitaRepository citaRepository;

    @Autowired
    private PacienteRepository pacienteRepository;

    // Crear una cita para el paciente con documentoIdentidad
    public Cita crearCita(String documentoIdentidad, LocalDate fecha, LocalTime hora) {
        Optional<Paciente> pacienteOpt = pacienteRepository.findByDocumentoIdentidad(documentoIdentidad);
        if (pacienteOpt.isPresent()) {
            Cita cita = new Cita();
            cita.setIdPaciente(pacienteOpt.get().getId());
            cita.setFecha(fecha);
            cita.setHora(hora);
            cita.setEstado("Pendiente");
            return citaRepository.save(cita);
        } else {
            throw new RuntimeException("Paciente no encontrado con documento de identidad: " + documentoIdentidad);
        }
    }

    // Listar citas de un paciente por su idPaciente
    public List<Cita> obtenerCitasPorIdPaciente(Long idPaciente) {
        return citaRepository.findByIdPaciente(idPaciente);
    }
    
    public List<Cita> obtenerCitasPorDocumentoIdentidad(String documentoIdentidad) {
    Optional<Paciente> paciente = pacienteRepository.findByDocumentoIdentidad(documentoIdentidad);
    if (paciente.isPresent()) {
        return citaRepository.findByIdPaciente(paciente.get().getId());
    } else {
        throw new RuntimeException("Paciente no encontrado con documento de identidad: " + documentoIdentidad);
    }
}

    List<Cita> obtenerCitasPorEstado(String pendiente) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    Cita aprobarOReprogramarCita(Long id, LocalDate nuevaFecha, LocalTime nuevaHora) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
