# Clinica_Proyecto_Final_UF2406
Aplicación de Gestión para Clínicas Dentales

Descripción del Proyecto
Objetivo: Desarrollar una aplicación de gestión para clínicas dentales que optimice la administración de citas, pacientes, tratamientos y presupuestos.
Funcionalidades Principales:
Registro y gestión de pacientes.
Asignación y aprobación de citas.
Visualización de tratamientos y presupuestos.
Público Objetivo: Administradores y pacientes de la clínica dental, beneficiándose de una gestión más eficiente y accesible.
Registro y Gestión de Pacientes
Registro de Pacientes:
Los pacientes se registran mediante un formulario que envía datos al backend, donde se almacenan en la base de datos.
El servicio PacienteService valida la información y previene duplicados.
Búsqueda y Consulta:
Permite buscar pacientes por ID o documento de identidad, recuperando su perfil y citas asociadas.
Actualización y Eliminación:
Actualización de datos en desarrollo.
Eliminación de pacientes y citas asociadas, en desarrollo.
Asignación y Aprobación de Citas
Solicitud de Citas:
Los pacientes pueden solicitar citas mediante un formulario, que se guarda en la base de datos con estado "Pendiente".
Aprobación por el Administrador:
El administrador puede aprobar, rechazar o proponer nuevas fechas para citas, con funcionalidades en desarrollo.
Listado de Citas:
Visualización de citas activas por pacientes y administradores, en desarrollo.
Visualización de Tratamientos y Presupuestos
Tratamientos:
Información sobre tratamientos asignados visible en el perfil del paciente.
Presupuestos:
Gestión de presupuestos por el administrador, con visualización en el perfil del paciente.
2.Planificación
Cronograma de desarrollo: [Detalles a especificar]

Requisitos Funcionales
Gestión de Pacientes: Registro, búsqueda, actualización y visualización de historial.
Gestión de Citas: Solicitud, aprobación y consulta de citas.
Gestión de Tratamientos: Visualización y administración de tratamientos.
Gestión de Presupuestos: Creación y asociación de presupuestos a pacientes.
Notificaciones y Recordatorios: Envío de recordatorios (en desarrollo).
Control de Acceso: Sistema de roles en desarrollo.
Requisitos No Funcionales
Rendimiento: Respuesta rápida y optimización de consultas.
Usabilidad: Interfaz intuitiva y adaptable.
Seguridad: Autenticación y encriptación de contraseñas, validación de datos.
Mantenibilidad: Código estructurado y documentado.
Compatibilidad: Soporte para navegadores comunes y bases de datos.
Escalabilidad: Diseño que soporte aumento de usuarios y futuras funcionalidades.
3. Análisis y Diseño
Diagramas de Flujo y UML
Se introducirán diagramas de flujo y UML para visualizar el proceso y la estructura del sistema.

Arquitectura General del Proyecto
La arquitectura del proyecto sigue un enfoque Cliente-Servidor dividido en frontend y backend. El backend, construido con Java Spring Boot, gestiona la lógica de negocio y la base de datos, mientras que el frontend proporciona una interfaz de usuario en HTML, CSS y JavaScript.
Estructura del Backend
El backend sigue una arquitectura de tres capas:
Controladores (Controllers):
Manejan las solicitudes HTTP del frontend.
Cada controlador se corresponde con una entidad principal (Paciente, Cita, Tratamiento, Presupuesto) y expone endpoints para operaciones CRUD.
Ejemplos:
PacienteController: Gestiona solicitudes relacionadas con pacientes.
CitaPacienteController y CitaAdminController: Gestionan operaciones de citas.
Responden en formato JSON, facilitando la interpretación de datos por el frontend.
Servicios (Services):
Contienen la lógica de negocio y procesan los datos.
Invocados por los controladores, validan datos y verifican permisos.
Ejemplos:
PacienteService: Valida y gestiona datos de pacientes.
CitaService: Maneja solicitudes y verifica conflictos de horarios.
Repositorios (Repositories):
Utilizan Spring Data JPA para simplificar la interacción con la base de datos.
Proporcionan métodos para operaciones CRUD automáticas y consultas personalizadas.
Ejemplos:
PacienteRepository: Acceso a datos de pacientes.
CitaRepository: Administra operaciones sobre citas.
Estructura del Frontend
El frontend está diseñado para ser amigable tanto para administradores como para pacientes:
HTML y CSS:
HTML estructura las páginas con formularios y botones.
CSS estiliza el contenido para una interfaz limpia y fácil de usar.
Dos vistas principales:
Panel del Administrador: Gestión de pacientes, citas y presupuestos.
Panel del Paciente: Búsqueda de perfil, solicitud de citas y visualización de tratamientos.
JavaScript:
Maneja la lógica del lado del cliente, incluyendo validación de formularios y solicitudes asíncronas al backend.
Funciones específicas:
obtenerPerfilCompletoPorDocumento(): Recupera el perfil de un paciente.
solicitarCita(): Permite a los pacientes solicitar citas.
listarCitasPendientes(): Lista citas pendientes para el administrador.
El uso de AJAX mejora la experiencia del usuario al evitar recargas de página.
Flujo de Interacción
Un usuario (paciente o administrador) interactúa con el frontend.
Las acciones del usuario envían una solicitud HTTP a un endpoint en el backend mediante JavaScript.
El controlador adecuado procesa la solicitud, aplicando la lógica de negocio correspondiente.
Los servicios interactúan con los repositorios para acceder a los datos en la base de datos.
Los datos se envían de vuelta al frontend en formato JSON, donde JavaScript los procesa para mostrarlos en la interfaz.
4. Implementación
Herramientas y Tecnologías
Backend:
Java Spring Boot: Framework principal para el backend, que facilita la creación de aplicaciones Java independientes. Organiza la lógica del negocio en controladores, servicios y repositorios.
Spring Data JPA: Utilizado para la interacción con la base de datos de forma sencilla, generando automáticamente consultas básicas y permitiendo la creación de consultas personalizadas.
Base de Datos:
MySQL: Base de datos relacional que almacena de forma estructurada la información de pacientes, citas, tratamientos y presupuestos, asegurando integridad de datos y acceso rápido a grandes volúmenes de registros.
Frontend:
JavaScript: Maneja la lógica del cliente, incluyendo validación de datos, envío de solicitudes asíncronas al backend y actualización de la interfaz sin recarga de página (usando fetch para solicitudes AJAX).
HTML y CSS básico:
HTML: Organiza el contenido y estructura de cada vista (panel del administrador y panel del paciente).
CSS básico: Estiliza los elementos HTML, creando una interfaz simple y funcional, priorizando la claridad y facilidad de uso con un diseño de dos columnas.

5. Pruebas
Plan de Pruebas
Dado que el proyecto aún no cuenta con pruebas automatizadas, se realizaron pruebas manuales desde el frontend para validar el correcto funcionamiento de las principales funcionalidades. Estas pruebas aseguraron que el sistema responde adecuadamente a las interacciones de usuario, verificando tanto la interfaz como la conexión con el backend.
Objetivo de las pruebas:
Validar que las funcionalidades clave (registro y gestión de pacientes, solicitud y gestión de citas, visualización de tratamientos y presupuestos) funcionan correctamente desde el frontend.
Confirmar que el frontend puede enviar y recibir datos del backend sin errores.
Pruebas manuales desde el Frontend:
Pruebas de conexión: Validar que el frontend puede comunicarse con el backend correctamente.
Pruebas de funcionalidad:
Registro de pacientes: Verificar que el formulario permite crear un nuevo paciente y que los datos se almacenan correctamente en la base de datos.
Búsqueda de pacientes por documento de identidad: Asegurar que el paciente puede ser encontrado y que sus datos se muestran en la interfaz.
Solicitud de citas: Comprobar que los pacientes pueden solicitar citas desde el frontend y que la cita aparece en el sistema con el estado "Pendiente".
Gestión de citas por el administrador: Probar que el administrador puede aprobar o rechazar citas desde su panel de control, y que estos cambios se reflejan en el estado de la cita.
Visualización de tratamientos y presupuestos: Validar que los tratamientos y presupuestos del paciente se muestran correctamente.
Resultados esperados:
Cada funcionalidad debe responder adecuadamente al usuario sin errores en la interfaz.
La información enviada desde el frontend debe reflejarse en la base de datos, y las actualizaciones realizadas desde el administrador deben ser visibles para los pacientes.
Pruebas futuras:
Pruebas unitarias: Implementar pruebas unitarias en el backend para validar la lógica de negocio en cada método de los servicios, como solicitarCita y gestionarCita.
Pruebas de integración: Asegurar que la integración entre los controladores y servicios en el backend funciona como se espera.
Pruebas de interfaz de usuario (UI): Probar la interfaz completa, usando herramientas como Selenium o Cypress, para automatizar las pruebas de interacción en el frontend.
6. Login y Autenticación
Integración del Sistema de Autenticación:
Aún falta integrar el sistema de autenticación de usuarios para que el login redirija a los perfiles correspondientes de acuerdo al rol.
El componente de login está desarrollado en un proyecto separado y debe ser integrado con el proyecto actual.
Una vez implementada la autenticación, los pasos para redirigir al perfil adecuado serán:
Paciente: Redirigir al perfil del paciente, donde pueda ver su información personal y gestionar sus citas.
Administrador: Redirigir al panel de administración, con acceso a las herramientas de gestión de pacientes y citas.
Pasos Futuros para Integrar el Login con los Perfiles:
Unir el Componente de Login:
Importar el componente de login existente en el proyecto actual y configurar la autenticación usando Spring Security.
Configurar Redirección Post-Login:
Implementar la lógica de redirección después del login en función del rol del usuario. Esto permitirá que un paciente sea dirigido a su perfil y el administrador a su panel de gestión.
Autorización:
Configurar permisos en las rutas del backend para que solo los usuarios autenticados con el rol adecuado puedan acceder a sus respectivas funcionalidades.

7. Mantenimiento
Plan de Mejoras
Para mejorar la experiencia de usuario y la eficiencia del sistema, se proponen las siguientes mejoras y nuevas funcionalidades para futuras actualizaciones:
Implementar Notificaciones de Citas:
Notificaciones automáticas para recordar al paciente sus citas próximas, con opción de recordatorio a través de email o mensaje de texto.
Notificaciones para el administrador cuando un paciente solicite o modifique una cita, facilitando la gestión.
Optimización de Consultas a la Base de Datos:
Revisar y optimizar consultas SQL para reducir la carga en la base de datos y mejorar el rendimiento general del sistema.
Aplicar índices y técnicas de optimización en las consultas más frecuentes o que involucran grandes volúmenes de datos.
Integración de Login con Perfiles de Usuario:
Vincular el proyecto con el sistema de autenticación, permitiendo que los usuarios accedan a su perfil específico (administrador o paciente) después de iniciar sesión.
Asignar permisos de acuerdo al rol, de modo que solo los pacientes puedan acceder a su información personal y los administradores al panel de gestión de pacientes y citas.
Mejoras en la Gestión del Perfil de Paciente:
Anulación y Modificación de Citas: Permitir que los pacientes anulen o modifiquen citas que hayan solicitado o que ya hayan sido confirmadas.
Actualización de Información Personal: Permitir que los pacientes actualicen su información (dirección, nombre, apellido, documento de identidad) directamente desde su perfil.
Firma de Documentos Online: Implementar un sistema para la firma electrónica de documentos, permitiendo que los pacientes firmen documentos necesarios sin necesidad de acudir a la clínica.
Tratamientos Detallados en PDF/Word: Ofrecer la posibilidad de descargar información sobre sus tratamientos en formato PDF o Word, brindando una visión detallada.
Carga de Foto de Perfil: Habilitar una opción para que el paciente suba su foto de perfil, haciendo su perfil más personal y completo.
Historial Completo de Tratamientos: Crear un historial accesible desde el perfil del paciente, donde se puedan ver tratamientos realizados y pendientes junto con su respectivo presupuesto.
Ampliaciones en el Menú de Administrador:
Carga de Informes Médicos: Facilitar que los administradores puedan cargar informes médicos específicos para cada paciente.
Sistema de Pagos en el Menú de Caja: Implementar opciones de pago, que incluyan tarjeta, efectivo y pagos en línea para que el administrador pueda gestionar y registrar los pagos.
Flujo de Documentación Electrónico: Automatizar el flujo de documentos entre la clínica y el paciente, permitiendo que todos los documentos puedan firmarse y compartirse electrónicamente.
Gestión de Citas con Opciones Adicionales:
Habilitar la opción para que el administrador proponga otra fecha y hora de cita en caso de conflicto de agenda.
Integrar un botón de llamada directa desde el perfil de cita para coordinar los detalles de la cita directamente con el paciente.
Futuras Integraciones y Optimización de UX/UI:
Mejorar la interfaz de usuario para hacerla más intuitiva y fácil de usar para ambos tipos de usuarios.
Implementar integraciones futuras con sistemas de mensajería o correo electrónico para mejorar la comunicación.
8. Manual del Usuario
Instrucciones de Uso
Inicio de Sesión
Nota: Actualmente, el sistema de inicio de sesión está en desarrollo y no está completamente integrado con los perfiles de administrador y paciente.

Perfil de Paciente
Buscar Paciente por DNI
Ingresa el DNI en el campo de texto bajo la sección "Documento de Identidad".
Haz clic en el botón "Buscar Paciente".
La aplicación buscará el perfil del paciente en la base de datos y mostrará la información correspondiente, que incluye:
Nombre y apellido
Email
Teléfono
Dirección
Fecha de nacimiento
Género
Solicitar Cita
Una vez cargado el perfil del paciente, se habilitará el formulario de "Asignar Cita".
Selecciona la fecha y la hora deseadas en los campos correspondientes.
Haz clic en el botón "Solicitar Cita".
Nota: Actualmente, la funcionalidad de gestionar el estado de las citas solicitadas está en desarrollo. Una vez implementada, el administrador podrá ver y aprobar las citas solicitadas.
Ver Información Completa
La sección de perfil del paciente también incluye listas detalladas de documentos, presupuestos y tratamientos si están disponibles.
La información de cada sección se mostrará como una lista, con la opción de descargar algunos documentos en formato PDF o Word (en desarrollo).

Perfil de Administrador
Buscar Paciente
El administrador puede buscar pacientes por DNI, ID o nombre.
Para buscar por DNI, introduce el número de documento en el campo "Documento de Identidad" y haz clic en "Obtener Perfil por Documento".
Para buscar por ID, introduce el ID del paciente en el campo correspondiente y haz clic en "Obtener Perfil por ID".
Para buscar por nombre, introduce el nombre completo o parcial del paciente en el campo de "Buscar por Nombre" y haz clic en "Buscar".
El administrador verá la información completa del paciente, incluyendo:
Datos personales
Historial de citas (en desarrollo)
Documentos médicos (en desarrollo)
Tratamientos y presupuestos asociados al paciente.
Agregar Paciente
En el formulario "Agregar Paciente", completa los datos del nuevo paciente, como nombre, apellido, email, dirección, fecha de nacimiento, género y documento de identidad.
Haz clic en "Agregar Paciente" para registrar el nuevo paciente en la base de datos.
Gestión de Citas (en desarrollo)
El administrador podrá ver todas las citas pendientes y, una vez implementado, podrá aprobar o proponer una nueva fecha para la cita solicitada.
También se implementará la posibilidad de llamar directamente al paciente desde la interfaz para coordinar detalles.

Problemas Comunes y Soluciones
Fallo en la Búsqueda por DNI o ID
Problema: Al buscar un paciente por DNI o ID, no se muestra ninguna información.
Solución: Asegúrate de haber introducido el DNI o ID correctamente. Verifica que el paciente esté registrado en la base de datos. Si el problema persiste, verifica la conexión a la base de datos.
Problemas de Conexión al Intentar Solicitar una Cita
Problema: Al hacer clic en "Solicitar Cita", no sucede nada o se muestra un error.
Solución: Comprueba que la fecha y la hora estén correctamente seleccionadas. Si el problema continúa, revisa la configuración del servidor y la conexión a la base de datos.
Error al Agregar un Nuevo Paciente
Problema: Al completar el formulario de "Agregar Paciente" y hacer clic en "Agregar", no se guarda la información.
Solución: Revisa que todos los campos obligatorios estén completos y correctos. Asegúrate de que la base de datos esté conectada y configurada correctamente.
 

 


