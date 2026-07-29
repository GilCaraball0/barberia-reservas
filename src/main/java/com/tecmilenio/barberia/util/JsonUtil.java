package com.tecmilenio.barberia.util;

import java.util.LinkedHashMap;
import java.util.Map;

/**
 * Utilidad muy simple para leer y escribir JSON, sin depender de una
 * libreria externa (Gson/Jackson), para que el proyecto compile solo
 * con el JDK + Maven basico.
 *
 * Solo soporta objetos "planos" (sin arreglos ni objetos anidados),
 * que es todo lo que este proyecto necesita para los formularios
 * de cliente, cita y login.
 */
public final class JsonUtil {

    private JsonUtil() {
    }

    /** Convierte {"a":"1","b":"2"} en un Map&lt;String,String&gt;. */
    public static Map<String, String> parseFlatObject(String json) {
        Map<String, String> resultado = new LinkedHashMap<>();
        if (json == null) {
            return resultado;
        }
        String contenido = json.trim();
        if (contenido.startsWith("{")) {
            contenido = contenido.substring(1);
        }
        if (contenido.endsWith("}")) {
            contenido = contenido.substring(0, contenido.length() - 1);
        }
        for (String par : splitTopLevel(contenido)) {
            if (par.isBlank()) {
                continue;
            }
            int idx = par.indexOf(':');
            if (idx < 0) {
                continue;
            }
            String clave = limpiar(par.substring(0, idx));
            String valor = limpiar(par.substring(idx + 1));
            resultado.put(clave, valor);
        }
        return resultado;
    }

    private static String[] splitTopLevel(String contenido) {
        return contenido.split(",(?=(?:[^\"]*\"[^\"]*\")*[^\"]*$)");
    }

    private static String limpiar(String texto) {
        String limpio = texto.trim();
        if (limpio.startsWith("\"") && limpio.endsWith("\"") && limpio.length() >= 2) {
            limpio = limpio.substring(1, limpio.length() - 1);
        }
        return limpio.trim();
    }

    public static String escapar(String texto) {
        if (texto == null) {
            return "";
        }
        return texto.replace("\\", "\\\\").replace("\"", "\\\"");
    }
}
