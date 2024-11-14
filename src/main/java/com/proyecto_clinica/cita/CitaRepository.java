/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.proyecto_clinica.cita;

import com.proyecto_clinica.paciente.Paciente;
import java.util.List;
import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;
public interface CitaRepository extends JpaRepository<Cita, Long> {
    // Buscar citas por el ID del paciente
    List<Cita> findByIdPaciente(Long idPaciente); 

    // Buscar citas por estado
    List<Cita> findByEstado(String estado);
}
