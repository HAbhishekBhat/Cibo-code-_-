<%-- 
    Document   : Sign_Up
    Created on : 27-Oct-2024, 9:15:35 pm
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <title>SignUp</title>
         <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;700&display=swap');

        * {
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(to bottom, #e9ecf1, #e4e9f0);
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
            margin: 0;
        }

        .container {
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
            overflow: hidden;
            width: 400px;
            max-width: 90%;
        }

        h2 {
            text-align: center;
            margin: 0 0 30px;
            color: #333;
        }

        form {
            padding: 30px;
        }

        input {
            display: block;
            width: 100%;
            padding: 15px;
            margin: 10px 0 20px;
            border: none;
            background-color: #f0f2f5;
            border-radius: 5px;
            font-family: inherit;
        }

        input:focus {
            outline: none;
            box-shadow: 0 0 0 2px rgba(66, 133, 244, 0.5);
        }

        button {
            background-color: #3498db; /* Blue color */
            color: #fff;
            border: none;
            padding: 15px 20px;
            margin-top: 20px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            width: 100%;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #2980b9; /* Darker blue on hover */
        }

        .error-message {
            color: red;
            margin-top: 10px;
            text-align: center;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Signup</h2>
    <form action="SignupServlet" method="post">
        <input type="text" name="username" placeholder="Username" required>
        <input type="email" name="email" placeholder="Email" required>
        <input type="password" name="password" placeholder="Password" required>
        <button type="submit">Signup</button>
        <% if(request.getAttribute("errorMessage") != null){ %>
        <p class="error-message"><%= request.getAttribute("errorMessage") %></p>
        <% } %>
    </form>
</div>
</body>
</html>