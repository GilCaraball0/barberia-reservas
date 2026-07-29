package com.tecmilenio.barberia.service;

import com.tecmilenio.barberia.exception.HorarioOcupadoException;
import com.tecmilenio.barberia.model.Cita;
import com.tecmilenio.barberia.model.EstadoCita;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

public class CitaService {
    private final List<Cita> citas = new ArrayList<>();

    public Cita reservarCita(String clienteId, String barberoId, String servicioId, LocalDateTime fechaHora) {
        if (existeConflictoDeHorario(barberoId, fechaHora, null)) {
            throw new HorarioOcupadoException(
                    "El barbero " + barberoId + " ya tiene una cita reservada el " + fechaHora);
        }
        Cita cita = new Cita(UUID.randomUUID().toString(), clienteId, barberoId, servicioId, fechaHora);
        citas.add(cita);
        return cita;
    }

    public void cancelarCita(String citaId) {
        Cita cita = obtenerCitaOLanzar(citaId);
        if (cita.getFechaHora().isBefore(LocalDateTime.now())) {
            throw new IllegalStateException("No se puede cancelar una cita que ya pasó.");
        }
        cita.setEstado(EstadoCita.CANCELADA);
    }

    public Cita modificarCita(String citaId, LocalDateTime nuevaFechaHora, String nuevoServicioId) {
        Cita cita = obtenerCitaOLanzar(citaId);
        if (existeConflictoDeHorario(cita.getBarberoId(), nuevaFechaHora, citaId)) {
            throw new HorarioOcupadoException(
                    "El barbero " + cita.getBarberoId() + " ya tiene una cita reservada el " + nuevaFechaHora);
        }
        cita.setFechaHora(nuevaFechaHora);
        if (nuevoServicioId != null) {
            cita.setServicioId(nuevoServicioId);
        }
        return cita;
    }

    public List<Cita> visualizarAgendaDelDia(String barberoId, LocalDateTime dia) {
        List<Cita> agenda = new ArrayList<>();
        for (Cita cita : citas) {
            boolean mismoBarbero = cita.getBarberoId().equals(barberoId);
            boolean mismoDia = cita.getFechaHora().toLocalDate().equals(dia.toLocalDate());
            boolean activa = cita.getEstado() == EstadoCita.RESERVADA;
            if (mismoBarbero && mismoDia && activa) {
                agenda.add(cita);
            }
        }
        return agenda;
    }

    public boolean existeConflictoDeHorario(String barberoId, LocalDateTime fechaHora, String citaIdAExcluir) {
        for (Cita cita : citas) {
            boolean esOtraCita = citaIdAExcluir == null || !cita.getId().equals(citaIdAExcluir);
            boolean mismoBarbero = cita.getBarberoId().equals(barberoId);
            boolean mismoHorario = cita.getFechaHora().isEqual(fechaHora);
            boolean activa = cita.getEstado() == EstadoCita.RESERVADA;
            if (esOtraCita && mismoBarbero && mismoHorario && activa) {
                return true;
            }
        }
        return false;
    }

    public List<Cita> historialPorCliente(String clienteId) {
        List<Cita> historial = new ArrayList<>();
        for (Cita cita : citas) {
            if (cita.getClienteId().equals(clienteId)) {
                historial.add(cita);
            }
        }
        return historial;
    }

    private Cita obtenerCitaOLanzar(String citaId) {
        Optional<Cita> cita = citas.stream().filter(c -> c.getId().equals(citaId)).findFirst();
        return cita.orElseThrow(() -> new IllegalArgumentException("No existe la cita con id " + citaId));
    }

    public List<Cita> listarTodas() {
        return new ArrayList<>(citas);
    }
}
