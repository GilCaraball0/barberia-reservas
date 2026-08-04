<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Santiago Barber Lounge - Sistema de Reservas</title>
    <style>
       
              .banner-top {
            width: 100%;
            text-align: center;
            padding: 0;
            margin-top: 20px;
            margin-bottom: 10px;
        }
        .banner-top img {
            width: 100%;
            max-width: 1200px; 
            height: auto;
            object-fit: cover;
            border: 2px solid #E5A93C; 
            border-radius: 8px;
            display: inline-block;
            box-sizing: border-box;
}

        
        body {
            background-color: #121212;
            color: #E5A93C;
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
            position: relative;
        }
        
  
        input[type="date"]::-webkit-calendar-picker-indicator {
        filter: invert(1) sepia(1) saturate(5) hue-rotate(15deg);
        cursor: pointer;
}
       
        .barbero-esquina-btn {
            position: absolute;
            top: 15px;
            right: 15px;
            background-color: rgba(38, 38, 38, 0.6);
            border: 1px solid rgba(229, 169, 60, 0.4);
            color: rgba(255, 255, 255, 0.6);
            padding: 6px 12px;
            font-size: 11px;
            text-transform: uppercase;
            cursor: pointer;
            border-radius: 4px;
            letter-spacing: 1px;
            transition: all 0.3s;
        }
        .barbero-esquina-btn:hover {
            border-color: #E5A93C;
            color: #E5A93C;
            background-color: #1A1A1A;
        }

        .main-content {
            width: 100%;
            max-width: 900px;
            background-color: #1A1A1A;
            border: 2px solid #E5A93C;
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0px 4px 10px rgba(229, 169, 60, 0.2);
            margin-top: 20px;
        }
        
        /* Control de Vistas */
        .view-content {
            display: none;
        }
        /* Cliente por defecto */
        #cliente-view {
            display: block;
        }
        
        /* Estructura de Texto de Introducción */
        .intro-text h2 {
            color: #FFFFFF;
            text-transform: uppercase;
            letter-spacing: 1px;
            margin-top: 0;
        }
        .info-section {
            margin-bottom: 20px;
            padding-bottom: 15px;
            border-bottom: 1px solid #262626;
        }
        .info-section h3 {
            color: #FFFFFF;
            margin-bottom: 10px;
        }
        .barbero-block {
            background-color: #262626;
            padding: 12px;
            border-radius: 4px;
            margin-bottom: 10px;
            border-left: 3px solid #E5A93C;
        }
        .barbero-block strong {
            color: #FFFFFF;
        }
        .barbero-block p {
            margin: 4px 0;
            font-size: 14px;
        }
        
        /* Diseño del Formulario */
        .columna-derecha {
            background-color: #262626;
            padding: 20px;
            border-radius: 6px;
            margin-top: 20px;
        }
        .fila-doble {
            display: flex;
            justify-content: space-between;
            gap: 15px;
            margin-bottom: 15px;
        }
        .campo {
            flex: 1;
            display: flex;
            flex-direction: column;
            margin-bottom: 15px;
        }
        .campo label {
            color: #FFFFFF;
            margin-bottom: 6px;
            font-size: 14px;
        }
        .campo input, .campo select {
            padding: 10px;
            background-color: #1A1A1A;
            border: 1px solid #E5A93C;
            color: #FFFFFF;
            border-radius: 4px;
            box-sizing: border-box;
        }
        .submit-btn {
            width: 100%;
            background-color: #E5A93C;
            color: #121212;
            border: none;
            padding: 14px;
            font-weight: bold;
            font-size: 16px;
            text-transform: uppercase;
            cursor: pointer;
            border-radius: 4px;
        }
        .submit-btn:hover {
            background-color: #D4982B;
        }
        
        /* Tabla del Barbero */
        .agenda-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background-color: #262626;
        }
        .agenda-table th, .agenda-table td {
            border: 1px solid #E5A93C;
            padding: 12px;
            text-align: center;
            font-size: 14px;
        }
        .agenda-table th {
            background-color: #1A1A1A;
            color: #FFFFFF;
        }
        .status-badge {
            background-color: #E5A93C;
            color: #121212;
            padding: 4px 10px;
            font-weight: bold;
            border-radius: 3px;
            font-size: 12px;
        }
        .regresar-btn {
            background-color: transparent;
            border: 1px solid #E5A93C;
            color: #E5A93C;
            padding: 8px 16px;
            cursor: pointer;
            border-radius: 4px;
            font-weight: bold;
            margin-top: 25px;
            text-transform: uppercase;
        }
        .regresar-btn:hover {
            background-color: #E5A93C;
            color: #121212;
        }
    </style>
</head>
<body>
    
        <!-- 1. CINTA DE BANNER SUPERIOR DE LADO A LADO -->
    <div class="banner-top">
        <img src="images/bannerSBL.png" alt="Santiago Barber Lounge">
    </div>


    <!-- Botón Pequeño y Discreto en la Esquina Superior Derecha -->
    <button class="barbero-esquina-btn" id="btn-cambio-contexto" onclick="gestionarAccesoBarbero()">Modo Barbero</button>

    <div class="main-content">

        <!-- VISTA 1: FLUJO DE RESERVA DEL CLIENTE (POR DEFECTO) -->
        <div id="cliente-view" class="view-content">
            <div class="intro-text">
                <h2>Estilo clasico, precision moderna.</h2>
                <p>Reserva tu cita en segundos y olvidate de las filas y las dobles reservas.</p>
            </div>

            <!-- SECCIÓN: NUESTROS SERVICIOS -->
            <div class="info-section">
                <h3>Nuestros servicios</h3>
                <p>Corte clasico, fade, barba con vapor, facial express y paquete premium.</p>
            </div>

            <!-- SECCIÓN: BARBEROS -->
            <div class="info-section">
                <h3>Barberos</h3>
                <div class="barbero-block">
                    <strong>Mateo (Dueño)</strong>
                    <p>Especialidad: Todos los servicios premium</p>
                    <p>Descripcion: Fundador de Santiago Barber Lounge. Maestro barbero con mas de 12 años de experiencia.</p>
                    <p>Horario: Mie, Jue, Dom: 12 PM - 9 PM | Vie, Sab: 1 PM - 11 PM</p>
                </div>
                <div class="barbero-block">
                    <strong>Oscar</strong>
                    <p>Especialidad: Fade alto, medio, bajo, taper fade</p>
                    <p>Descripcion: Experto en transiciones limpias y estilos urbanos.</p>
                    <p>Horario: Mie, Jue, Dom: 12 PM - 9 PM | Vie, Sab: 1 PM - 11 PM</p>
                </div>
                <div class="barbero-block">
                    <strong>Gilberto</strong>
                    <p>Especialidad: Corte clasico, scissor cut, estilos ejecutivos</p>
                    <p>Descripcion: Conocido por su precision y estilo limpio.</p>
                    <p>Horario: Mie, Jue, Dom: 12 PM - 9 PM | Vie, Sab: 1 PM - 11 PM</p>
                </div>
                <div class="barbero-block">
                    <strong>Carly</strong>
                    <p>Especialidad: Barba con vapor, perfilado, afeitado clasico</p>
                    <p>Descripcion: Su tratamiento de barba con vapor es uno de los más solicitados.</p>
                    <p>Horario: Mie, Jue, Dom: 12 PM - 9 PM | Vie, Sab: 1 PM - 11 PM</p>
                </div>
            </div>

            <!-- CONTENEDOR DEL FORMULARIO DE RESERVA -->
            <div class="columna-derecha">
                <section id="reservar">
                    <div style="margin-bottom: 20px; font-family: 'Arial', serif; font-size: 24px; font-weight: bold; color: #FFFFFF; text-align: center;">
                        Reservar mi cita
                    </div>
                    
                    <form class="reserva-wrap" id="form-reserva"  action="./servicios" method="POST">
                        <div class="fila-doble">
                            <div class="campo">
                                <label for="nombre">Nombre completo</label>
                                <input type="text" id="nombre" name="nombre" required placeholder="Ej. Juan Perez">
                            </div>
                            <div class="campo">
                                <label for="telefono">Telefono</label>
                                <input type="tel" id="telefono" name="telefono" required placeholder="787-555-0100">
                            </div>
                        </div>
                        
                        <div class="campo">
                            <label for="barbero">Barbero</label>
                            <select id="barbero" name="barbero" required>
                                <option value="">-- Selecciona un barbero --</option>
                                <option value="mateo">Mateo (Dueno - Todos los servicios premium)</option>
                                <option value="oscar">Oscar (Fade alto, medio, bajo, taper fade)</option>
                                <option value="gilberto">Gilberto (Corte clasico, scissor cut)</option>
                                <option value="carly">Carly (Barba con vapor, perfilado)</option>
                            </select>
                        </div>
                        
                        <div class="campo">
                            <label for="servicio">Servicio</label>
                            <select id="servicio" name="servicio" required>
                                <option value="">-- Selecciona un servicio --</option>
                                <option value="corte">Corte clasico - $25 (45 min)</option>
                                <option value="fade">Fade - $40 (50 min)</option>
                                <option value="barba">Barba con vapor - $30 (30 min)</option>
                                <option value="facial">Facial express - $25 (20 min)</option>
                                <option value="paquete">Paquete premium - $70 (1 hora)</option>
                            </select>
                        </div>
                        
                        <div class="fila-doble">
                            <div class="campo">
                                <label for="fecha">Fecha (Seleccionar de Calendario)</label>
                                <input type="date" id="fecha" name="fecha" required>
                            </div>
                            <div class="campo">
                                <label for="hora">Hora</label>
                                <select id="hora" name="hora" required>
                                    <option value="">--:--</option>
                                    <option value="12:00">12:00</option>
                                    <option value="12:30">12:30</option>
                                    <option value="13:00">13:00</option>
                                    <option value="13:30">13:30</option>
                                    <option value="14:00">14:00</option>
                                    <option value="14:30">14:30</option>
                                    <option value="15:00">15:00</option>
                                    <option value="15:30">15:30</option>
                                    <option value="16:00">16:00</option>
                                    <option value="16:30">16:30</option>
                                    <option value="17:00">17:00</option>
                                    <option value="17:30">17:30</option>
                                    <option value="18:00">18:00</option>
                                    <option value="18:30">18:30</option>
                                    <option value="19:00">19:00</option>
                                    <option value="19:30">19:30</option>
                                    <option value="20:00">20:00</option>
                                    <option value="20:30">20:30</option>
                                    <option value="21:00">21:00</option>
                                    <option value="21:30">21:30</option>
                                    <option value="22:00">22:00</option>
                                    <option value="22:30">22:30</option>
                                    <option value="23:00">23:00</option>
                                </select>
                            </div>
                        </div>
                        <button type="button" class="submit-btn" onclick="procesarYValidarCita()">Agendar mi Reserva</button>
                    </form>
                </section>
            </div>
        </div>

               <!-- VISTA 2: PANEL DE CONSULTA DEL BARBERO -->
        <div id="barbero-view" class="view-content">
            <div class="intro-text">
                <h2>Panel de Consulta del Barbero</h2>
                <p>Filtra y revisa los compromisos asignados para tu jornada diaria.</p>
            </div>
            
            <div class="campo">
                <label for="filtro-barbero">Selecciona tu Perfil de Barbero:</label>
                <select id="filtro-barbero" onchange="simularFiltrado()">
                    <option value="mateo">Mateo (Dueño)</option>
                    <option value="oscar">Oscar</option>
                    <option value="gilberto">Gilberto</option>
                    <option value="carly">Carly</option>
                </select>
            </div>
            
            <table class="agenda-table">
                <thead>
                    <tr>
                        <th>Fecha</th>
                        <th>Hora</th>
                        <th>Cliente</th>
                        <th>Servicio</th>
                        <th>Estado</th>
                    </tr>
                </thead>
                <tbody id="tabla-citas-body">
                    <tr>
                        <td>31/07/2026</td>
                        <td>12:30</td>
                        <td>Carlos Rivera</td>
                        <td>Paquete premium ($70)</td>
                        <td><span class="status-badge">Confirmada</span></td>
                    </tr>
                    <tr>
                        <td>31/07/2026</td>
                        <td>15:00</td>
                        <td>Luis Cancel</td>
                        <td>Corte clasico ($25)</td>
                        <td><span class="status-badge">Confirmada</span></td>
                    </tr>
                </tbody>
            </table>
            
            <button class="regresar-btn" onclick="regresarACliente()">Cerrar Sesión Barbero</button>
        </div>
    </div>

            <!-- SCRIPT DE SEGURIDAD, NAVEGACIÓN Y FILTRADO INTELIGENTE -->
    <script>
        var registroCitasGlobal = [
            { fecha: "2026-07-31", hora: "12:30", barbero: "mateo", cliente: "Carlos Rivera", servicio: "Paquete premium - $70 (1 hora)" },
            { fecha: "2026-07-31", hora: "15:00", barbero: "mateo", cliente: "Luis Vargas", servicio: "Corte clasico - $25 (45 min)" },
            { fecha: "2026-08-01", hora: "13:00", barbero: "oscar", cliente: "Enrique Ortiz", servicio: "Fade - $40 (50 min)" },
            { fecha: "2026-08-01", hora: "17:30", barbero: "oscar", cliente: "Yamil Suárez", servicio: "Fade - $40 (50 min)" },
            { fecha: "2026-08-02", hora: "14:00", barbero: "gilberto", cliente: "Ramón Mendez", servicio: "Corte clasico - $25 (45 min)" },
            { fecha: "2026-08-02", hora: "16:30", barbero: "carly", cliente: "José Delgado", servicio: "Barba con vapor - $30 (30 min)" },
            { fecha: "2026-08-03", hora: "19:00", barbero: "carly", cliente: "Angel Torres", servicio: "Facial express - $25 (20 min)" }
        ];

        function procesarYValidarCita() {
            var nombre = document.getElementById('nombre').value.trim();
            var telefono = document.getElementById('telefono').value.trim();
            var barberoSelect = document.getElementById('barbero');
            var servicioSelect = document.getElementById('servicio');
            var fecha = document.getElementById('fecha').value;
            var hora = document.getElementById('hora').value;

            var barberoValue = barberoSelect.value;
            var servicioTexto = servicioSelect.options[servicioSelect.selectedIndex].text;

            if (!nombre || !telefono || !barberoValue || !servicioSelect.value || !fecha || !hora) {
                alert("Error: Por favor complete todos los campos obligatorios del formulario.");
                return;
            }

            var conflicto = registroCitasGlobal.some(function(cita) {
                return cita.fecha === fecha && cita.hora === hora && cita.barbero === barberoValue;
            });

            if (conflicto) {
                alert("¡HORARIO OCUPADO!\n\nEl barbero seleccionado ya tiene una reserva para el " + fecha + " a las " + hora + ".\nPor favor, seleccione otra hora, fecha o cambie de barbero.");
            } else {
                registroCitasGlobal.push({ 
                    fecha: fecha, 
                    hora: hora, 
                    barbero: barberoValue, 
                    cliente: nombre, 
                    servicio: servicioTexto 
                });
                
                alert("¡RESERVA AGENDADA CON ÉXITO!\n\nSu cita con " + barberoValue.toUpperCase() + " para el día " + fecha + " a las " + hora + " ha sido validada y guardada en esta sesión.");
                document.getElementById('form-reserva').reset();
                simularFiltrado();
            }
        }

        function gestionarAccesoBarbero() {
            var password = prompt("Control de Seguridad: Ingrese la contraseña de administrador/barbero:");
            
            if (password === "SBL2026") {
                document.getElementById('cliente-view').style.display = 'none';
                document.getElementById('barbero-view').style.display = 'block';
                document.getElementById('btn-cambio-contexto').style.display = 'none';
                simularFiltrado();
            } else {
                alert("Acceso Denegado: Contraseña incorrecta. Solo personal autorizado.");
            }
        }

        function regresarACliente() {
            document.getElementById('barbero-view').style.display = 'none';
            document.getElementById('cliente-view').style.display = 'block';
            document.getElementById('btn-cambio-contexto').style.display = 'block';
        }

        function simularFiltrado() {
            var seleccion = document.getElementById('filtro-barbero').value;
            var tabla = document.getElementById('tabla-citas-body');
            tabla.innerHTML = "";

            var citasFiltradas = registroCitasGlobal.filter(function(cita) {
                return cita.barbero === seleccion;
            });

            if (citasFiltradas.length === 0) {
                tabla.innerHTML = `<tr><td colspan="5" style="color: #666; padding: 15px;">No hay citas agendadas para este barbero.</td></tr>`;
                return;
            }

            citasFiltradas.forEach(function(cita) {
                var formatoFecha = cita.fecha.split("-").reverse().join("/");
                
                tabla.innerHTML += `
                    <tr>
                        <td>` + formatoFecha + `</td>
                        <td>` + cita.hora + `</td>
                        <td>` + cita.cliente + `</td>
                        <td>` + cita.servicio + `</td>
                        <td><span class="status-badge">Confirmada</span></td>
                    </tr>
                `;
            });
        }
                document.addEventListener("DOMContentLoaded", function() {
            var hoy = new Date();
            var dd = String(hoy.getDate()).padStart(2, '0');
            var mm = String(hoy.getMonth() + 1).padStart(2, '0');
            var yyyy = hoy.getFullYear();
            var fechaMinima = yyyy + '-' + mm + '-' + dd;
            document.getElementById('fecha').setAttribute('min', fechaMinima);
        });
    </script>
    <!-- PANEL DE CONTROL FLOTANTE INDESTRUCTIBLE PARA MODIFICAR Y CANCELAR CITAS -->
<div id="menu-control-barbero" style="position: fixed; top: 20px; right: 20px; background-color: #111111; border: 2px solid #D4AF37; border-radius: 8px; padding: 20px; box-shadow: 0 4px 15px rgba(212, 175, 55, 0.3); z-index: 9999; width: 300px; display: none; color: white; font-family: Arial, sans-serif;">
    <h3 style="color: #D4AF37; margin-top: 0; text-transform: uppercase; font-size: 14px; text-align: center; letter-spacing: 1px;">Acciones de Control</h3>
    
    <div style="margin-bottom: 12px;">
        <label style="color: #D4AF37; font-size: 12px; font-weight: bold; display: block; margin-bottom: 4px;">Seleccionar Cita:</label>
        <select id="select-cita-menu" style="width: 100%; padding: 6px; background-color: #222222; border: 1px solid #444444; color: white; border-radius: 4px; font-size: 12px;">
            <option value="0">Cita 1: Carlos Rivera (12:30)</option>
            <option value="1">Cita 2: Luis Vargas (15:00)</option>
            <option value="2">Cita 3: Rey Soto (14:00)</option>
            <option value="3">Cita 4: Ramón Méndez (14:00)</option>
            <option value="4">Cita 5: José Delgado (16:30)</option>
            <option value="5">Cita 6: Yamil Suárez (17:30)</option>
            <option value="6">Cita 7: Ángel Torres (19:00)</option>

            
        </select>
    </div>

    <div style="margin-bottom: 12px;">
        <label style="color: #D4AF37; font-size: 12px; font-weight: bold; display: block; margin-bottom: 4px;">Nuevo Horario:</label>
        <input type="datetime-local" id="nueva-hora-menu" style="width: 95%; padding: 6px; background-color: #222222; border: 1px solid #D4AF37; color: white; border-radius: 4px; font-size: 12px;">
    </div>

    <div style="display: flex; justify-content: space-between; margin-top: 15px;">
        <button id="btn-cancelar-menu" style="background-color: #ff4444; color: white; border: none; padding: 8px 15px; font-weight: bold; border-radius: 4px; cursor: pointer; width: 45%; font-size: 12px;">Cancelar Cita</button>
        <button id="btn-modificar-menu" style="background-color: #ffbb00; color: black; border: none; padding: 8px 15px; font-weight: bold; border-radius: 4px; cursor: pointer; width: 45%; font-size: 12px;">Modificar</button>
    </div>
</div>

<script>
document.addEventListener("DOMContentLoaded", function() {
    // 1. Monitoreamos cuando el usuario entra a la vista del barbero para mostrar el menú
    var barberoView = document.getElementById("barbero-view");
    var menuFlotante = document.getElementById("menu-control-barbero");

    // Verificar cambios de visibilidad mediante un intervalo rápido para asegurar que aparezca
    setInterval(function() {
        if (barberoView && (barberoView.style.display === "block" || barberoView.classList.contains("active") || window.getComputedStyle(barberoView).display !== "none")) {
            menuFlotante.style.display = "block";
        } else {
            menuFlotante.style.display = "none";
        }
    }, 500);

    // 2. LÓGICA DEL BOTÓN CANCELAR
    document.getElementById("btn-cancelar-menu").onclick = function(e) {
        e.preventDefault();
        var index = document.getElementById("select-cita-menu").value;
        var filas = document.querySelectorAll("#tabla-citas-body tr");
        
        if (filas[index]) {
            if (confirm("¿Seguro que deseas cancelar esta reserva de la barbería?")) {
                filas[index].remove(); // Elimina la fila físicamente de la pantalla
                alert("La cita seleccionada fue cancelada correctamente de la memoria RAM.");
                actualizarSelector();
            }
        }
    };

    // 3. LÓGICA DEL BOTÓN MODIFICAR
    document.getElementById("btn-modificar-menu").onclick = function(e) {
        e.preventDefault();
        var index = document.getElementById("select-cita-menu").value;
        var nuevaHoraInput = document.getElementById("nueva-hora-menu").value;
        var filas = document.querySelectorAll("#tabla-citas-body tr");

        if (!nuevaHoraInput) {
            alert("Por favor, selecciona una nueva fecha y hora en el calendario.");
            return;
        }

        if (filas[index]) {
            var celdas = filas[index].querySelectorAll("td");
            if (celdas.length >= 5) {
                // El formato de datetime-local es: YYYY-MM-DDTHH:MM
                var partes = nuevaHoraInput.split("T");
                var fechaFormateada = partes[0].split("-").reverse().join("/"); // Pasa a DD/MM/YYYY
                var horaFormateada = partes[1]; // HH:MM

                // Modificamos directamente las columnas de la tabla estática
                celdas[0].innerText = fechaFormateada; // Columna Fecha
                celdas[1].innerText = horaFormateada;  // Columna Hora

                // Actualizamos el estado visual
                var badge = celdas[4].querySelector(".status-badge") || celdas[4];
                badge.innerText = "Modificada";
                badge.style.backgroundColor = "#ffbb00";
                badge.style.color = "#000000";

                alert("El horario de la cita fue actualizado con éxito en la memoria.");
            }
        }
    };

    function actualizarSelector() {
        var selector = document.getElementById("select-cita-menu");
        selector.innerHTML = "";
        var filasRestantes = document.querySelectorAll("#tabla-citas-body tr");
        filasRestantes.forEach(function(fila, idx) {
            var celdas = fila.querySelectorAll("td");
            if (celdas.length >= 3) {
                var option = document.createElement("option");
                option.value = idx;
                option.innerText = "Cita " + (idx + 1) + ": " + celdas[2].innerText + " (" + celdas[1].innerText + ")";
                selector.appendChild(option);
            }
        });
        if (filasRestantes.length === 0) {
            menuFlotante.style.display = "none";
        }
    }
});
</script>

</body>
</html>

  
