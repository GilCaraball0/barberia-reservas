package com.tecmilenio.barberia.service;

import java.util.HashMap;
import java.util.Map;

public class AutenticacionService {
    private final Map<String, String> usuarios = new HashMap<>();

    public AutenticacionService() {
        usuarios.put("admin", "barberia2026");
    }

    public boolean autenticar(String usuario, String contrasena) {
        return contrasena != null && contrasena.equals(usuarios.get(usuario));
    }
}
