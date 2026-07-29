const iconosServicio = {
  "Corte clasico": "✂️",
  "Fade": "💈",
  "Barba con vapor": "🪒",
  "Facial express": "🧖"
};

async function cargarServicios() {
  const respuesta = await fetch('/api/servicios');
  const servicios = await respuesta.json();

  const grid = document.getElementById('servicios-grid');
  const select = document.getElementById('servicio');

  grid.innerHTML = servicios.map(s => `
    <div class="servicio-card">
      <div class="icono">${iconosServicio[s.nombre] || '💇'}</div>
      <h3>${s.nombre}</h3>
      <div class="precio">$${s.precio}</div>
      <div class="duracion">${s.duracionMinutos} min</div>
    </div>
  `).join('');

  select.innerHTML = servicios.map(s => `<option value="${s.id}">${s.nombre} — $${s.precio}</option>`).join('');
}

async function cargarBarberos() {
  const respuesta = await fetch('/api/barberos');
  const barberos = await respuesta.json();
  const select = document.getElementById('barbero');
  select.innerHTML = barberos.map(b => `<option value="${b.id}">${b.nombre}</option>`).join('');
}

function mostrarMensaje(texto, tipo) {
  const caja = document.getElementById('mensaje-reserva');
  caja.textContent = texto;
  caja.className = 'mensaje ' + tipo;
}

document.getElementById('form-reserva').addEventListener('submit', async (evento) => {
  evento.preventDefault();

  const fecha = document.getElementById('fecha').value;
  const hora = document.getElementById('hora').value;

  const cuerpo = {
    clienteNombre: document.getElementById('nombre').value,
    clienteTelefono: document.getElementById('telefono').value,
    barberoId: document.getElementById('barbero').value,
    servicioId: document.getElementById('servicio').value,
    fechaHora: `${fecha}T${hora}:00`
  };

  try {
    const respuesta = await fetch('/api/citas', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify(cuerpo)
    });
    const datos = await respuesta.json();

    if (respuesta.ok && datos.ok) {
      mostrarMensaje('¡Listo! Tu cita quedó reservada. Te esperamos en Santiago Barber Lounge.', 'ok');
      document.getElementById('form-reserva').reset();
      cargarBarberos();
      cargarServicios();
    } else {
      mostrarMensaje(datos.error || 'Ese horario ya está ocupado con ese barbero, intenta con otra hora.', 'error');
    }
  } catch (error) {
    mostrarMensaje('No se pudo conectar con el servidor. Intenta de nuevo.', 'error');
  }
});

cargarServicios();
cargarBarberos();
