# Santiago Barber Lounge - Sistema de Reservas
Bienvenido al repositorio del Sistema de Reservas para Santiago Barber Lounge. Este proyecto se encuentra actualmente en su Fase III, bajo el ciclo de madurez de producto Version Beta.

El sistema gestiona la reserva de turnos, la disponibilidad de barberos y expone un servidor web ligero para la visualización de servicios.

---

## Arquitectura de la Solución
La solucion ha sido disenada bajo una arquitectura desacoplada:
* Servidor de Aplicacion: Desarrollado en Java SE, gestionando modulos de Citas, Clientes y Autenticacion en memoria.
* Servidor Web Embebido: Implementado mediante com.sun.net.httpserver en el puerto 8080, exponiendo endpoints en formato JSON.
* Sistema de Repositorios: Administrado en GitHub utilizando la estrategia de ramificacion estructurada (master y develop).
* Integracion Continua (CI): Conectado con Travis-CI para la ejecucion de pruebas unitarias automatizadas.

---

## Alcance del Producto

### Incluido en la Version Actual (Beta)
* Gestion de Clientes: Registro basico de clientes en memoria.
* Modulo de Servicios: Catalogo inicial de servicios de la barberia con precios y tiempos de duracion.
* Control de Citas y Disponibilidad: Registro, modificacion y cancelacion de citas validando activamente conflictos de horarios por barbero.
* Seguridad Basica: Modulo de autenticacion simple en memoria para roles administrativos.
* Servidor de Servicios: Exposicion del endpoint GET /servicios para consumo web.
* Pruebas Automatizadas: Suite de pruebas unitarias implementadas con JUnit.

### Excluido (Postergado para la Version General Availability - GA)
* Persistencia de Datos: Migracion del almacenamiento de memoria hacia un sistema de base de datos relacional (MySQL).
* Seguridad Avanzada: Cifrado criptografico de contrasenas de administracion mediante algoritmos robustos (BCrypt).
* Interfaz Grafica Completa: Migracion del servidor web basico hacia un framework empresarial (Spring Boot / Tomcat Embebido) con frontend interactivo.

---

## Requisitos Previos y Ejecución
Para compilar y ejecutar localmente esta version del software desde la terminal:

```bash
# 1. Corre las pruebas unitarias JUnit
mvn -B test

# 2. Genera el archivo ejecutable .jar en la carpeta target
mvn -B package

Sprint 1 completado con éxito.



# 3. Inicia el servidor web
java -jar target/barberia-reservas.jar
```
Una vez iniciado, acceda a la lista de servicios abriendo su navegador web en: http://localhost:8080/servicios
