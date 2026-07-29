package com.tecmilenio.barberia.model;

import java.time.LocalDateTime;

public class Cita {
    private final String id;
    private final String clienteId;
    private final String barberoId;
    private String servicioId;
    private LocalDateTime fechaHora;
    private EstadoCita estado;

    public Cita(String id, String clienteId, String barberoId, String servicioId, LocalDateTime fechaHora) {
        this.id = id;
        this.clienteId = clienteId;
        this.barberoId = barberoId;
        this.servicioId = servicioId;
        this.fechaHora = fechaHora;
        this.estado = EstadoCita.RESERVADA;
    }

    public String getId() {
        return id;
    }

    public String getClienteId() {
        return clienteId;
    }

    public String getBarberoId() {
        return barberoId;
    }

    public String getServicioId() {
        return servicioId;
    }

    public void setServicioId(String servicioId) {
        this.servicioId = servicioId;
    }

    public LocalDateTime getFechaHora() {
        return fechaHora;
    }

    public void setFechaHora(LocalDateTime fechaHora) {
        this.fechaHora = fechaHora;
    }

    public EstadoCita getEstado() {
        return estado;
    }

    public void setEstado(EstadoCita estado) {
        this.estado = estado;
    }

    @Override
    public String toString() {
        return "Cita{id='" + id + "', clienteId='" + clienteId + "', barberoId='" + barberoId +
                "', servicioId='" + servicioId + "', fechaHora=" + fechaHora + ", estado=" + estado + "}";
    }
}
