package com.tecmilenio.barberia.model;

import java.math.BigDecimal;

public class Servicio {
    private final String id;
    private String nombre;
    private BigDecimal precio;
    private int duracionMinutos;

    public Servicio(String id, String nombre, BigDecimal precio, int duracionMinutos) {
        this.id = id;
        this.nombre = nombre;
        this.precio = precio;
        this.duracionMinutos = duracionMinutos;
    }

    public String getId() {
        return id;
    }

    public String getNombre() {
        return nombre;
    }

    public BigDecimal getPrecio() {
        return precio;
    }

    public int getDuracionMinutos() {
        return duracionMinutos;
    }

    @Override
    public String toString() {
        return nombre + " ($" + precio + ", " + duracionMinutos + " min)";
    }
}
