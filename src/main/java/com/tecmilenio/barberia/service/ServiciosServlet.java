package com.tecmilenio.barberia.service;

import com.tecmilenio.barberia.model.Servicio;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ServiciosServlet", urlPatterns = {"/servicios"})
public class ServiciosServlet extends HttpServlet {

    private final List<Servicio> servicios = new ArrayList<>();

    @Override
    public void init() throws ServletException {
        // Inicializamos los datos semilla idénticos a tu lógica original
        servicios.add(new Servicio("1", "Corte clasico", new BigDecimal("15.00"), 30));
        servicios.add(new Servicio("2", "Fade", new BigDecimal("18.00"), 40));
        servicios.add(new Servicio("3", "Barba con vapor", new BigDecimal("12.00"), 20));
        servicios.add(new Servicio("4", "Facial express", new BigDecimal("20.00"), 25));
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("application/json;charset=UTF-8");
        
        try (PrintWriter out = response.getWriter()) {
            StringBuilder json = new StringBuilder("[");
            for (int i = 0; i < servicios.size(); i++) {
                Servicio s = servicios.get(i);
                json.append("{\"nombre\":\"").append(s.getNombre())
                    .append("\",\"precio\":").append(s.getPrecio())
                    .append(",\"duracionMinutos\":").append(s.getDuracionMinutos())
                    .append("}");
                if (i < servicios.size() - 1) {
                    json.append(",");
                }
            }
            json.append("]");
            out.print(json.toString());
        }
    }
}
