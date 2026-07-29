package com.tecmilenio.barberia.service;

import com.tecmilenio.barberia.model.Cliente;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

public class ClienteService {
    private final List<Cliente> clientes = new ArrayList<>();

    public Cliente registrar(String nombre, String telefono) {
        Cliente cliente = new Cliente(UUID.randomUUID().toString(), nombre, telefono);
        clientes.add(cliente);
        return cliente;
    }

    public List<Cliente> buscarPorNombreOTelefono(String texto) {
        String textoBusqueda = texto.toLowerCase();
        List<Cliente> resultado = new ArrayList<>();
        for (Cliente c : clientes) {
            if (c.getNombre().toLowerCase().contains(textoBusqueda) || c.getTelefono().contains(texto)) {
                resultado.add(c);
            }
        }
        return resultado;
    }

    public Optional<Cliente> buscarPorId(String id) {
        return clientes.stream().filter(c -> c.getId().equals(id)).findFirst();
    }

    public List<Cliente> listarTodos() {
        return new ArrayList<>(clientes);
    }
}
