# Sistema de Reservas - Santiago Barber Lounge (Fase III)

Este repositorio contiene la implementación de la Fase III del Sistema de Reservas Web para Santiago Barber Lounge, desarrollado como una aplicación web Java empresarial basada en arquitectura desacoplada.

## Arquitectura de la Solución
La solución ha sido diseñada bajo una arquitectura desacoplada organizada en tres capas principales:
*   Frontend: Interfaz gráfica web adaptativa maquetada con HTML5 y CSS nativo corporativo (negro mate y dorado) integrada en index.jsp, con compatibilidad para Google Chrome y Edge.
*   Controlador (Backend): Servlet de Java (ServiciosServlet) que expone el catálogo de servicios en formato JSON vía HTTP GET; el procesamiento directo de reservas mediante POST forma parte del roadmap de integración         técnica backend.
*   Lógica de Negocio: Clase centralizada CitaService que procesa las reglas operativas, control de horarios fijos y prevención estricta de dobles reservas.
*   Capa de Almacenamiento (Persistencia): Colecciones dinámicas indexadas en memoria RAM (ArrayList) administradas con precisión financiera mediante la clase java.math.BigDecimal.

## Alcance del Producto

### Incluido en la Versión Actual
*   RF1 — Registro de Clientes: Captura y sanitización de información básica de contacto (Nombre y Teléfono).
*   RF2 — Reservar Cita: Gestión de turnos en bloques fijos de 30 minutos en hora militar.
*   RF3 — Cancelar Cita: Remoción de reservas de la colección liberando disponibilidad del empleado.
*   RF4 — Modificar Cita: Modificación de parámetros activando prevención de dobles citas.
*   RF5 — Visualizar Agenda: Despliegue estructurado de reservas activas filtradas por barbero y día de atención.
*   RF6 — Mostrar Servicios: Catálogo interactivo de servicios con manejo preciso de costos mediante BigDecimal.
*   RF8 — Capa de Logica de Negocio CitaService: Encapsulamiento de reglas comerciales en el backend Java.
*   RF9 — Controlador de Peticiones ServiciosServlet: Extensión de HttpServlet para el canal limpio cliente-servidor.
*   RF10 — Modulo de Pruebas Unitarias JUnit 5: Suite de automatización de pruebas lógicas críticas.
*   RF11 — Interfaz Grafica Web Adaptativa SBL: Maquetación responsiva integrada en index.jsp con controles nativos de autenticación y acceso restringido por contraseña para barberos.

### Excluido (Postergado / Trabajo Futuro)
*   RF7 — Notificación de Cita: Envío automático de confirmaciones y recordatorios a través de medios digitales (correo electrónico o SMS). Requiere integración avanzada de APIs de mensajería externas (como Twilio o SendGrid) e hilos asíncronos en el servidor Tomcat. Queda congelado en el Backlog.

## Organización del Repositorio y Flujo Git
El proyecto sigue una estrategia de flujo de trabajo estructurada en dos ramas principales obligatorias para garantizar el control de cambios:
*   master: Contiene el código de la versión final estable listo para producción (Hito General Availability - GA).
*   develop: Canal central donde se realiza la integración del trabajo en progreso y código base de desarrollo (Hito Beta).

## Integración Continua (CI)
El repositorio se encuentra integrado de forma nativa con GitHub Actions a través del flujo automatizado definido en maven.yml. Ante cada Push o Pull Request hacia las ramas master o develop, el motor en la nube levanta un entorno virtual Linux con soporte para OpenJDK 17 y Maven, ejecutando de manera autónoma el comando técnico 'mvn -B clean test'. Esto valida la suite de pruebas unitarias automatizadas con JUnit 5, garantizando la estabilidad de la lógica de negocio ante cambios concurrentes antes de permitir cualquier fusión de código.
