<%-- 
    Document   : index
    Created on : Jul 29, 2026, 1:15:31 PM
    Author     : gil34
--%>

<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Santiago Barber Lounge — Reservas</title>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600;700&family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">

<link rel="stylesheet" href="/css/styles.css">
</head>
<body>

<!-- NAVBAR -->
<div class="navbar">
  <div class="brand">Santiago Barber Lounge</div>
  <nav>
    <a href="#servicios">Servicios</a>
    <a href="#barberos">Barberos</a>
    <a href="#reservar">Reservar</a>
    <a href="/admin">Panel del barbero</a>
  </nav>
</div>

<!-- HERO / BANNER -->
<section class="hero">
  <div class="eyebrow">Santurce · Puerto Rico</div>
  <h1>Estilo clásico, <span>precisión</span> moderna.</h1>
  <p>Reserva tu cita en segundos y olvídate de las filas y las dobles reservas. Cuatro barberos, un solo lugar.</p>
  <a href="#reservar" class="btn">Reservar mi cita</a>
</section>

<!-- SERVICIOS -->
<section id="servicios">
  <div class="section-title">
    <div class="eyebrow">Lo que ofrecemos</div>
    <h2>Nuestros servicios</h2>
  </div>

  <div class="servicios-grid" id="servicios-grid">
    <!-- tarjetas llenadas por JS -->
  </div>
</section>

<!-- BARBEROS -->
<section id="barberos">
  <div class="section-title">
    <div class="eyebrow">Nuestro equipo</div>
    <h2>Barberos</h2>
  </div>

  <div class="barberos-grid" id="barberos-grid">
    <!-- tarjetas llenadas por JS -->
  </div>
</section>

<!-- FORMULARIO DE RESERVA -->
<section id="reservar">
  <div class="section-title">
    <div class="eyebrow">Agenda tu cita</div>
    <h2>Reservar</h2>
  </div>

  <form class="reserva-wrap" id="form-reserva">
    <div class="fila-doble">
      <div class="campo">
        <label for="nombre">Nombre completo</label>
        <input type="text" id="nombre" required placeholder="Ej. Juan Pérez">
      </div>

      <div class="campo">
        <label for="telefono">Teléfono</label>
        <input type="tel" id="telefono" required placeholder="787-555-0100">
      </div>
    </div>

    <div class="campo">
      <label for="barbero">Barbero</label>
      <select id="barbero" required></select>
    </div>

    <div class="campo">
      <label for="servicio">Servicio</label>
      <select id="servicio" required></select>
    </div>

    <div class="fila-doble">
      <div class="campo">
        <label for="fecha">Fecha</label>
        <input type="date" id="fecha" required>
      </div>

      <div class="campo">
        <label for="hora">Hora</label>
        <input type="time" id="hora" required>
      </div>
    </div>

    <button type="submit" class="btn" style="width:100%;">Confirmar reserva</button>
    <div class="mensaje" id="mensaje-reserva"></div>
  </form>
</section>

<!-- FOOTER -->
<footer>
  <span class="brand">Santiago Barber Lounge</span>
  Santurce, Puerto Rico &middot; Corte clásico, fade, barba con vapor, facial express y paquete premium.
</footer>

<!-- SCRIPTS (ORDEN CORRECTO) -->
<script src="/js/data.js"></script>
<script src="/js/app.js"></script>

</body>
</html>
