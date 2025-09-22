<%-- 
    Document   : Logout
    Created on : 30-Oct-2024, 11:39:27 pm
    Author     : User
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Logout Confirmation</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            background: linear-gradient(120deg, #2980b9, #8e44ad);
        }

        .logout-container {
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
            text-align: center;
            max-width: 400px;
            width: 90%;
        }

        .logout-icon {
            font-size: 50px;
            color: #e74c3c;
            margin-bottom: 20px;
        }

        h2 {
            color: #2c3e50;
            margin-bottom: 20px;
        }

        .message {
            color: #7f8c8d;
            margin-bottom: 30px;
            line-height: 1.6;
        }

        .button-container {
            display: flex;
            justify-content: center;
            gap: 20px;
        }

        .btn {
            padding: 12px 30px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            transition: all 0.3s ease;
            text-decoration: none;
        }

        .btn-logout {
            background-color: #e74c3c;
            color: white;
        }

        .btn-logout:hover {
            background-color: #c0392b;
        }

        .btn-back {
            background-color: #95a5a6;
            color: white;
        }

        .btn-back:hover {
            background-color: #7f8c8d;
        }

        /* Animation for container */
        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(-20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .logout-container {
            animation: fadeIn 0.5s ease-out;
        }
    </style>
</head>
<body>
    <div class="logout-container">
        <div class="logout-icon">
            ⚠️
        </div>
        <h2>Logout Confirmation</h2>
        <div class="message">
            Are you sure you want to logout? 
            <br>
            This will end your current session.
        </div>
        <div class="button-container">
            <a href="index.html" class="btn btn-logout">Yes, Logout</a>
            <a href="javascript:history.back()" class="btn btn-back">Go Back</a>
        </div>
    </div>
</body>
</html>