package com.tecmilenio.barberia.service;

import com.tecmilenio.barberia.model.Servicio;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

public class ServicioService {
    private final List<Servicio> servicios = new ArrayList<>();

    public Servicio agregar(String nombre, BigDecimal precio, int duracionMinutos) {
        Servicio servicio = new Servicio(UUID.randomUUID().toString(), nombre, precio, duracionMinutos);
        servicios.add(servicio);
        return servicio;
    }

    public List<Servicio> listarServicios() {
        return new ArrayList<>(servicios);
    }

    public Optional<Servicio> buscarPorId(String id) {
        return servicios.stream().filter(s -> s.getId().equals(id)).findFirst();
    }
}
