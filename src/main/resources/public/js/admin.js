async function cargarBarberosFiltro() {
  const respuesta = await fetch('/api/barberos');
  const barberos = await respuesta.json();
  document.getElementById('filtro-barbero').innerHTML =
    barberos.map(b => `<option value="${b.id}">${b.nombre}</option>`).join('');
}

document.getElementById('form-login').addEventListener('submit', async (evento) => {
  evento.preventDefault();
  const usuario = document.getElementById('usuario').value;
  const contrasena = document.getElementById('contrasena').value;

  const respuesta = await fetch('/api/admin/login', {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({ usuario, contrasena })
  });
  const datos = await respuesta.json();

  if (datos.ok) {
    document.getElementById('login-view').style.display = 'none';
    document.getElementById('panel-view').style.display = 'block';
    document.getElementById('filtro-fecha').value = new Date().toISOString().slice(0, 10);
    cargarBarberosFiltro();
  } else {
    const caja = document.getElementById('mensaje-login');
    caja.textContent = 'Usuario o contraseña incorrectos.';
    caja.className = 'mensaje error';
  }
});

async function consultarAgenda() {
  const barberoId = document.getElementById('filtro-barbero').value;
  const fecha = document.getElementById('filtro-fecha').value;

  const respuesta = await fetch(`/api/citas/agenda?barberoId=${barberoId}&fecha=${fecha}`);
  const citas = await respuesta.json();

  const cuerpo = document.getElementById('agenda-body');
  if (citas.length === 0) {
    cuerpo.innerHTML = `<tr><td colspan="4" class="vacio">No hay citas para este día.</td></tr>`;
    return;
  }

  cuerpo.innerHTML = citas.map(c => `
    <tr>
      <td>${c.fechaHora.split('T')[1]?.slice(0,5) || ''}</td>
      <td>${c.cliente}</td>
      <td>${c.servicio}</td>
      <td><button class="btn-mini" onclick="cancelarCita('${c.id}')">Cancelar</button></td>
    </tr>
  `).join('');
}

async function cancelarCita(id) {
  await fetch(`/api/citas/cancelar?id=${id}`, { method: 'POST' });
  consultarAgenda();
}

document.getElementById('btn-consultar').addEventListener('click', consultarAgenda);
