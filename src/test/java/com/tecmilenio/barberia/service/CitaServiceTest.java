package com.tecmilenio.barberia.service;

import com.tecmilenio.barberia.exception.HorarioOcupadoException;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.time.LocalDateTime;
import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.junit.jupiter.api.Assertions.assertTrue;

/**
 * Pruebas unitarias del modulo de Citas.
 * Ejecutadas automaticamente por Travis CI en cada push (ver .travis.yml).
 */
class CitaServiceTest {

    private CitaService citaService;
    private static final String BARBERO_MATEO = "barbero-mateo";
    private static final String CLIENTE_1 = "cliente-1";
    private static final String CLIENTE_2 = "cliente-2";
    private static final String SERVICIO_CORTE = "servicio-corte";

    @BeforeEach
    void setUp() {
        citaService = new CitaService();
    }

    @Test
    void reservarCita_conHorarioLibre_seGuardaCorrectamente() {
        LocalDateTime horario = LocalDateTime.of(2026, 8, 3, 10, 0);

        var cita = citaService.reservarCita(CLIENTE_1, BARBERO_MATEO, SERVICIO_CORTE, horario);

        assertEquals(CLIENTE_1, cita.getClienteId());
        assertEquals(1, citaService.listarTodas().size());
    }

    @Test
    void reservarCita_mismoBarberoMismoHorario_lanzaHorarioOcupado() {
        // RF10 - Control de Disponibilidad: no debe permitirse doble reserva
        LocalDateTime horario = LocalDateTime.of(2026, 8, 3, 10, 0);
        citaService.reservarCita(CLIENTE_1, BARBERO_MATEO, SERVICIO_CORTE, horario);

        assertThrows(HorarioOcupadoException.class, () ->
                citaService.reservarCita(CLIENTE_2, BARBERO_MATEO, SERVICIO_CORTE, horario));
    }

    @Test
    void reservarCita_mismoHorarioDistintoBarbero_siSePermite() {
        LocalDateTime horario = LocalDateTime.of(2026, 8, 3, 10, 0);
        citaService.reservarCita(CLIENTE_1, BARBERO_MATEO, SERVICIO_CORTE, horario);

        var cita2 = citaService.reservarCita(CLIENTE_2, "barbero-luis", SERVICIO_CORTE, horario);

        assertEquals("barbero-luis", cita2.getBarberoId());
        assertEquals(2, citaService.listarTodas().size());
    }

    @Test
    void cancelarCita_liberaElHorarioParaOtroCliente() {
        // RF3 - Cancelar Cita
        LocalDateTime horario = LocalDateTime.now().plusDays(1).withHour(10).withMinute(0).withSecond(0).withNano(0);
        var cita = citaService.reservarCita(CLIENTE_1, BARBERO_MATEO, SERVICIO_CORTE, horario);

        citaService.cancelarCita(cita.getId());
        var nuevaCita = citaService.reservarCita(CLIENTE_2, BARBERO_MATEO, SERVICIO_CORTE, horario);

        assertEquals(CLIENTE_2, nuevaCita.getClienteId());
    }

    @Test
    void visualizarAgendaDelDia_soloMuestraCitasActivasDeEseBarbero() {
        // RF5 - Visualizar Agenda
        LocalDateTime dia = LocalDateTime.now().plusDays(2).withHour(9).withMinute(0);
        citaService.reservarCita(CLIENTE_1, BARBERO_MATEO, SERVICIO_CORTE, dia);
        citaService.reservarCita(CLIENTE_2, "barbero-luis", SERVICIO_CORTE, dia);

        List<?> agenda = citaService.visualizarAgendaDelDia(BARBERO_MATEO, dia);

        assertEquals(1, agenda.size());
        assertTrue(agenda.get(0).toString().contains(CLIENTE_1));
    }
}
