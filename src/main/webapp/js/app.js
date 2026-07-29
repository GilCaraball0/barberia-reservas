// =========================
// LLENAR SELECT DE BARBEROS
// =========================

const selectBarbero = document.getElementById("barbero");

barberos.forEach(b => {
  const option = document.createElement("option");
  option.value = b.nombre;
  option.textContent = b.nombre;
  selectBarbero.appendChild(option);
});

// =========================
// LLENAR SELECT DE SERVICIOS
// =========================

const selectServicio = document.getElementById("servicio");

servicios.forEach(s => {
  const option = document.createElement("option");
  option.value = s.nombre;
  option.textContent = `${s.nombre} — $${s.precio}`;
  selectServicio.appendChild(option);
});

// =========================
// TARJETAS DE SERVICIOS
// =========================

const serviciosGrid = document.getElementById("servicios-grid");

servicios.forEach(s => {
  const card = document.createElement("div");
  card.className = "servicio-card";

  card.innerHTML = `
    <div class="servicio-info">
      <h3>${s.nombre}</h3>
      <p>${s.descripcion}</p>
      <span class="precio">$${s.precio}</span>
      <span class="duracion">${s.duracion}</span>
    </div>
  `;

  serviciosGrid.appendChild(card);
});

// =========================
// TARJETAS DE BARBEROS
// =========================

const barberosGrid = document.getElementById("barberos-grid");

barberos.forEach(b => {
  const card = document.createElement("div");
  card.className = "barbero-card";

  card.innerHTML = `
    <div class="barbero-info">
      <h3>${b.nombre}${b.rol ? " — " + b.rol : ""}</h3>
      <p><strong>Especialidad:</strong> ${b.especialidad}</p>
      <p>${b.descripcion}</p>
      <p><strong>Horario:</strong> ${b.horario}</p>
    </div>
  `;

  barberosGrid.appendChild(card);
});

