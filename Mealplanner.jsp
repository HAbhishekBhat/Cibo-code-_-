<%-- 
    Document   : Mealplanner
    Created on : 30-Oct-2024, 9:22:34 pm
    Author     : User
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Meal Planner</title>
    <style>
                body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 20px;
                background-color: #f0f0f0;
            }

            h1 {
                text-align: center;
                color: #333;
            }

            .calendar {
                display: flex;
                flex-wrap: wrap;
                justify-content: space-between;
            }

            .day {
                width: 13%;
                background-color: #fff;
                border-radius: 5px;
                padding: 10px;
                margin-bottom: 20px;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            }

            .day h2 {
                font-size: 16px;
                margin-top: 0;
                color: #444;
            }

            form {
                margin-bottom: 10px;
            }

            input[type="text"], input[type="time"] {
                width: 100%;
                padding: 5px;
                margin-bottom: 5px;
                border: 1px solid #ddd;
                border-radius: 3px;
            }

            input[type="submit"] {
                background-color: #4CAF50;
                color: white;
                border: none;
                padding: 5px 10px;
                cursor: pointer;
                border-radius: 3px;
            }

            input[type="submit"]:hover {
                background-color: #45a049;
            }

            ul {
                list-style-type: none;
                padding: 0;
            }

            li {
                font-size: 14px;
                margin-bottom: 5px;
                color: #666;
            }    
    </style>
</head>
<body>
    <h1>Meal Planner</h1>
    <div class="calendar">
        <% 
            Calendar cal = Calendar.getInstance();
            SimpleDateFormat sdf = new SimpleDateFormat("EEEE, MMMM d");
            for (int i = 0; i < 7; i++) {
                String date = sdf.format(cal.getTime());
        %>
        <div class="day">
            <h2><%= date %></h2>
            <form action="MealPlannerServlet" method="post">
                <input type="hidden" name="date" value="<%= date %>">
                <input type="text" name="recipe" placeholder="Enter recipe">
                <input type="time" name="time" required>
                <input type="checkbox" name="reminder" value="true"> Set Reminder
                <input type="submit" value="Add Meal">
            </form>
            <ul>
                <% 
                    List<String> meals = (List<String>) request.getAttribute(date);
                    if (meals != null) {
                        for (String meal : meals) {
                %>
                <li><%= meal %></li>
                <% 
                        }
                    }
                %>
            </ul>
        </div>
        <% 
                cal.add(Calendar.DAY_OF_MONTH, 1);
            }
        %>
    </div>
</body>
</html>