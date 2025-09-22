/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.*;

/**
 *
 * @author User
 */
@WebServlet("/mealplanner")
public class MealPlannerServlet extends HttpServlet {
    private List<Meal> meals = new ArrayList<>();

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html lang='en'>");
            out.println("<head>");
            out.println("<meta charset='UTF-8'>");
            out.println("<meta name='viewport' content='width=device-width, initial-scale=1.0'>");
            out.println("<title>Meal Added Successfully</title>");
            out.println("<style>");
            out.println("    body { font-family: 'Arial', sans-serif; background-color: #f0f0f0; margin: 0; padding: 0; display: flex; justify-content: center; align-items: center; height: 100vh; }");
            out.println("    .container { background-color: white; border-radius: 10px; box-shadow: 0 0 20px rgba(0,0,0,0.1); padding: 40px; text-align: center; max-width: 400px; width: 100%; }");
            out.println("    h1 { color: #4CAF50; margin-bottom: 20px; }");
            out.println("    .success-icon { font-size: 60px; color: #4CAF50; margin-bottom: 20px; animation: bounce 1s infinite; }");
            out.println("    @keyframes bounce { 0%, 100% { transform: translateY(0); } 50% { transform: translateY(-20px); } }");
            out.println("    .message { font-size: 18px; color: #333; margin-bottom: 30px; }");
            out.println("    .btn { display: inline-block; padding: 10px 20px; background-color: #4CAF50; color: white; text-decoration: none; border-radius: 5px; font-weight: bold; transition: background-color 0.3s, transform 0.3s; }");
            out.println("    .btn:hover { background-color: #45a049; transform: scale(1.05); }");
            out.println("</style>");
            out.println("</head>");
            out.println("<body>");
            out.println("<div class='container'>");
            out.println("    <div class='success-icon'>&#10004;</div>");
            out.println("    <h1>Success!</h1>");
            out.println("    <p class='message'>Your meal has been successfully added to the planner.</p>");
            out.println("    <a href='Welcome.jsp' class='btn'>Go Back</a>");
            out.println("</div>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        request.setAttribute("meals", meals);
        request.getRequestDispatcher("/WEB-INF/mealplanner.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        String date = request.getParameter("date");
        String recipe = request.getParameter("recipe");
        String time = request.getParameter("time");

        meals.add(new Meal(date, recipe, time));

        doGet(request, response);
        
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
