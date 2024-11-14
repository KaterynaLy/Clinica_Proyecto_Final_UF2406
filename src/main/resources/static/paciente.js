// Buscar perfil completo por documento de identidad
async function obtenerPerfilCompletoPorDocumento() {
    const documentoIdentidad = document.getElementById('pacienteDocumento').value;
    const response = await fetch(`/api/paciente/documento/${documentoIdentidad}/perfil-completo`);

    if (response.ok) {
        const perfilCompleto = await response.json();
        mostrarPerfil(perfilCompleto);
    } else {
        alert('Error al cargar el perfil del paciente.');
    }
}

// Mostrar perfil completo del paciente
function mostrarPerfil(perfilCompleto) {
    const perfilDiv = document.getElementById('perfil');
    perfilDiv.innerHTML = `
        <h2>Perfil del Paciente</h2>
        <p><strong>Nombre:</strong> ${perfilCompleto.perfil.nombre} ${perfilCompleto.perfil.apellido}</p>
        <p><strong>Email:</strong> ${perfilCompleto.perfil.email}</p>
        <p><strong>Teléfono:</strong> ${perfilCompleto.perfil.telefono}</p>
        <p><strong>Dirección:</strong> ${perfilCompleto.perfil.direccion}</p>
        <p><strong>Fecha de Nacimiento:</strong> ${new Date(perfilCompleto.perfil.fechaNacimiento).toLocaleDateString()}</p>
        <p><strong>Género:</strong> ${perfilCompleto.perfil.genero}</p>
        <h3>Documentos</h3>
        <ul>${perfilCompleto.documentos.map(doc => `<li>${doc.nombre}</li>`).join('')}</ul>
        <h3>Presupuestos</h3>
        <ul>${perfilCompleto.presupuestos.map(pres => `<li>${pres.descripcion}</li>`).join('')}</ul>
        <h3>Tratamientos</h3>
        <ul>${perfilCompleto.tratamientos.map(trat => `<li>${trat.descripcion}</li>`).join('')}</ul>
    `;
    
    // Guardar el documentoIdentidad e idPaciente en dataset para futuras solicitudes
    perfilDiv.dataset.documentoIdentidad = perfilCompleto.perfil.documentoIdentidad;
    perfilDiv.dataset.idPaciente = perfilCompleto.perfil.id; // Asegúrate de que el ID del paciente está disponible

    // Mostrar el formulario de asignar cita
    document.getElementById('asignarCita').style.display = 'block';
}

// Solicitar una cita con documentoIdentidad
async function solicitarCita() {
    const documentoIdentidad = document.getElementById('perfil').dataset.documentoIdentidad;
    const fecha = document.getElementById('fechaCita').value;
    const hora = document.getElementById('horaCita').value;

    const response = await fetch(`/api/citas/solicitar/${documentoIdentidad}`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ fecha, hora })
    });

    if (response.ok) {
        alert('Cita solicitada con éxito');
        listarCitas();
    } else {
        alert('Error al solicitar la cita');
    }
}

// Listar citas del paciente
async function listarCitas() {
    const idPaciente = document.getElementById('perfil').dataset.idPaciente;
    const response = await fetch(`/api/citas/mis-citas/${idPaciente}`);
    const citas = await response.json();
    const lista = document.getElementById('listaCitas');
    lista.innerHTML = '';

    citas.forEach(cita => {
        const li = document.createElement('li');
        li.textContent = `${cita.fecha} - ${cita.hora} - Estado: ${cita.estado}`;
        lista.appendChild(li);
    });
}
