use clinica_dental;
SET FOREIGN_KEY_CHECKS = 0;

INSERT INTO `clinica_dental`.`paciente` (`apellido`, `direccion`, `documentoIdentidad`, `email`, `fechaCreacion`, `fechaNacimiento`, `genero`, `nombre`, `origenCliente`, `telefono`)
VALUES 
('García', 'Calle Falsa 123', '12345678A', 'garcia@example.com', NOW(), '1985-06-15', 'Masculino', 'Juan', 'Publicidad', '123456789'),
('López', 'Avenida Siempreviva 456', '87654321B', 'lopez@example.com', NOW(), '1990-08-20', 'Femenino', 'María', 'Recomendación', '987654321'),
('Pérez', 'Calle Luna 789', '11223344C', 'perez@example.com', NOW(), '1980-01-05', 'Masculino', 'Carlos', 'Online', '456123789'),
('Martínez', 'Avenida Sol 101', '22334455D', 'martinez@example.com', NOW(), '1995-03-10', 'Femenino', 'Lucía', 'Recomendación', '789456123'),
('Gómez', 'Calle Estrella 202', '33445566E', 'gomez@example.com', NOW(), '2000-12-25', 'Masculino', 'Pedro', 'Publicidad', '321654987');

INSERT INTO `clinica_dental`.`financiacion` (`cuotas`, `metodoFinanciacion`, `fechaFin`, `fechaInicio`, `montoCuota`, `montoTotal`, `idPaciente`)
VALUES 
(12, 'Tarjeta de crédito', '2025-01-01', '2024-01-01', 100.00, 1200.00, 1),
(6, 'Efectivo', '2024-07-01', '2024-01-01', 200.00, 1200.00, 2),
(24, 'Financiadora externa', '2026-01-01', '2024-01-01', 50.00, 1200.00, 3),
(10, 'Transferencia bancaria', '2025-10-01', '2024-12-01', 150.00, 1500.00, 4),
(8, 'Tarjeta de débito', '2025-09-01', '2024-05-01', 125.00, 1000.00, 5);

INSERT INTO `clinica_dental`.`caja` (`fechaPago`, `financiador`, `monto`, `metodoPago`, `idFinanciacion`, `idPaciente`)
VALUES 
(NOW(), 'Tarjeta Visa', 100.00, 'Tarjeta de crédito', 1, 1),
(NOW(), 'Cliente', 200.00, 'Efectivo', 2, 2),
(NOW(), 'Banco XYZ', 50.00, 'Transferencia', 3, 3),
(NOW(), 'Cliente', 150.00, 'Efectivo', 4, 4),
(NOW(), 'MasterCard', 125.00, 'Tarjeta de débito', 5, 5);

INSERT INTO `clinica_dental`.`cita` (`idPaciente`, `fecha`, `hora`, `estado`)
VALUES 
(1, '2024-11-20', '10:00:00', 'Pendiente'),
(2, '2024-11-21', '12:00:00', 'Confirmada'),
(3, '2024-11-22', '09:30:00', 'Pendiente'),
(4, '2024-11-23', '15:00:00', 'Cancelada'),
(5, '2024-11-24', '11:15:00', 'Confirmada');

INSERT INTO `clinica_dental`.`tratamiento` (`aprobado`, `descripcion`, `fechaFin`, `fechaInicio`, `nombre`, `presupuesto`, `idPaciente`)
VALUES 
(1, 'Blanqueamiento dental', '2024-12-15', '2024-11-01', 'Blanqueamiento', 200.00, 1),
(0, 'Ortodoncia', '2025-06-30', '2024-11-01', 'Brackets', 1500.00, 2),
(1, 'Implante dental', '2024-12-20', '2024-11-15', 'Implante', 1200.00, 3),
(1, 'Limpieza profunda', '2024-12-01', '2024-11-10', 'Limpieza', 100.00, 4),
(0, 'Carillas de porcelana', '2025-03-15', '2024-11-20', 'Carillas', 3000.00, 5);

INSERT INTO `clinica_dental`.`documento` (`fechaFirma`, `firmado`, `nombreDocumento`, `idPaciente`, `idTratamiento`)
VALUES 
(NOW(), 1, 'Consentimiento Blanqueamiento', 1, 1),
(NOW(), 0, 'Contrato Ortodoncia', 2, 2),
(NOW(), 1, 'Autorización Implante', 3, 3),
(NOW(), 1, 'Consentimiento Limpieza', 4, 4),
(NOW(), 0, 'Contrato Carillas', 5, 5);

INSERT INTO `clinica_dental`.`presupuesto` (`descripcion`, `estado`, `fechaAceptacion`, `fechaCreacion`, `monto`, `idPaciente`)
VALUES 
('Blanqueamiento dental completo', 'Aceptado', '2024-11-01', '2024-10-15', 200.00, 1),
('Brackets metálicos', 'Pendiente', NULL, '2024-10-20', 1500.00, 2),
('Implante dental único', 'Aceptado', '2024-11-10', '2024-10-25', 1200.00, 3),
('Limpieza profunda general', 'Rechazado', NULL, '2024-10-30', 100.00, 4),
('Carillas porcelana premium', 'Pendiente', NULL, '2024-10-05', 3000.00, 5);

INSERT INTO `clinica_dental`.`rol` (`nombreRol`)
VALUES 
('Administrador'),
('Paciente'),
('Recepcionista'),
('Higienista'),
('Doctor');

INSERT INTO `clinica_dental`.`usuario` (`email`, `nombreUsuario`, `password`, `idRol`, `idPaciente`)
VALUES 
('admin@example.com', 'admin', 'admin123', 1, 1),
('dentista@example.com', 'dentista1', 'paciente1', 2, 2),
('recepcionista@example.com', 'recep1', 'paciente2', 2, 3),
('higienista@example.com', 'higienista1', 'paciente3', 2, 4),
('paciente@example.com', 'paciente1', 'paciente4', 2, 5);

SET FOREIGN_KEY_CHECKS = 1;

show tables;
select * from cita;
select * from documento;
select * from financiacion;
select * from paciente;
select * from presupuesto;
select * from rol;
select * from tratamiento;
select * from usuario;
select * from tratamiento;

