package com.tecmilenio.barberia.service;

import com.tecmilenio.barberia.model.Barbero;

import java.util.List;

/**
 * Los 4 barberos de Santiago Barber Lounge (dato fijo del negocio).
 */
public class BarberoService {

    private final List<Barbero> barberos = List.of(
            new Barbero("barbero-mateo", "Mateo Santiago"),
            new Barbero("barbero-luis", "Luis Rivera"),
            new Barbero("barbero-carlos", "Carlos Ortiz"),
            new Barbero("barbero-jose", "Jose Medina")
    );

    public List<Barbero> listarTodos() {
        return barberos;
    }
}
