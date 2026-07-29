package com.tecmilenio.barberia.model;

/**
 * Representa a uno de los barberos de Santiago Barber Lounge.
 */
public class Barbero {

    private final String id;
    private final String nombre;

    public Barbero(String id, String nombre) {
        this.id = id;
        this.nombre = nombre;
    }

    public String getId() {
        return id;
    }

    public String getNombre() {
        return nombre;
    }
}
