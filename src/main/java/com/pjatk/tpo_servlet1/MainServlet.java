package com.pjatk.tpo_servlet1;

import java.io.*;

import com.pjatk.tpo_servlet1.Services.DatabaseService;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "mainServlet", value = "/main-servlet")
public class MainServlet extends HttpServlet {
    private String message;
    public void init() {
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");

        var games = DatabaseService.instance.getGames(
                request.getParameter("sortbyval"),
                request.getParameter("fgamename"),
                request.getParameter("fgameauthor"),
                request.getParameter("fgamegenre"),
                request.getParameter("fgames"),
                request.getParameterValues("additional-settings"));

        request.setAttribute("games", games);

        try {
            request.getRequestDispatcher("/games.jsp").forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        }
    }

    public void destroy() {
    }
}