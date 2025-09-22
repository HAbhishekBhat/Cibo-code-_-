<%-- 
    Document   : Welcome
    Created on : 27-Oct-2024, 10:13:52 pm
    Author     : User
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Welcome to Your Recipe App!</title>
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(to bottom, #a1c4fd, #c2e9fb);
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
            margin: 0;
            overflow: hidden;
        }

        .container {
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
            padding: 40px;
            text-align: center;
            width: 80%;
            max-width: 800px;
        }

        h1 {
            color: #333;
        }

        .button-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr)); /* Responsive columns */
            gap: 20px;
            margin-top: 30px;
        }

        a {
            display: block; 
            padding: 15px 20px;
            background-color: #4CAF50; /* Green */
            color: white;
            text-decoration: none;
            border: none;
            border-radius: 5px;
            text-align: center;
            transition: background-color 0.3s ease;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        a:hover {
            background-color: #45a049; /* Darker green on hover */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* More pronounced shadow */
        }

    </style>
</head>
<body>
<div class="container">
    <h1>Welcome to Your Recipe App!</h1>

    <div class="button-grid">
        <a href="SSL.jsp">Smart Shopping List</a>
        <a href="Mealplanner.jsp">Meal Planner</a>
        <a href="cutss.jsp">Customizable Serving Sizes</a>
        <a href="AI.jsp">Nutritional Information Calculator</a>
        <a href="Step_by_Step.jsp">Step-by-Step Cooking Mode</a>
        <a href="AI.jsp">AI Recipe Generator</a>
        
        <a href="AI.jsp">Recipe To-Do / Guided Cooking Mode</a>   
    </div>

    <!-- Logout button -->
    <a href="Logout.jsp" style="margin-top: 30px;">Logout</a>
</div>
</body>
</html>
