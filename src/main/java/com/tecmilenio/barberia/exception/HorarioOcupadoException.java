package com.tecmilenio.barberia.exception;

public class HorarioOcupadoException extends RuntimeException {

    private static final long serialVersionUID = 1L;

    public HorarioOcupadoException(String mensaje) {
        super(mensaje);
    }
}