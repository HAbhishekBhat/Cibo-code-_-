<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cibo-Code</title>
<style>
@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;700&display=swap');

body {
    font-family: 'Poppins', sans-serif;
    background: #f7f7f7;
    display: flex;
    align-items: center;
    justify-content: center;
    min-height: 100vh;
    margin: 0;
}

.container {
    background-color: #fff;
    border-radius: 10px;
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
    padding: 40px 50px;
    width: 400px; 
    text-align: center;
}

h2 {
    color: #333;
    margin-bottom: 30px;
}

input[type="text"],
input[type="email"],
input[type="password"] {
    width: calc(100% - 30px);
    padding: 15px;
    margin: 15px 0;
    border: 1px solid #ddd;
    border-radius: 5px; 
    background: #fafafa;
    transition: border-color 0.3s;
}

input[type="text"]:focus,
input[type="email"]:focus,
input[type="password"]:focus {
    outline: none;
    border-color: #5333ed;
}

input[type="submit"] {
    width: 100%;
    background: #5333ed;
    color: white;
    padding: 15px;
    margin-top: 20px;
    border: none;
    border-radius: 5px; 
    cursor: pointer;
    transition: background-color 0.3s; 
}

input[type="submit"]:hover {
    background: #4024d4; 
}

.secret-dish {
    margin-top: 20px;
    font-size: 14px;
    color: #777;
}
</style>
</head>
<body>
    <div class="container">
        <h2>Login here to get a secret dish</h2>
        <form action="LoginSServlet" method="post">
            <input type="text" id="username" name="username" placeholder="Username" required><br>
            <input type="email" id="email" name="email" placeholder="Email" required><br>
            <input type="password" id="password" name="password" placeholder="Password" required><br>
            <input type="submit" value="Log in">
        </form>
        <p class="secret-dish">Psst... a delicious surprise awaits! </p> 
    </div>
</body>
</html>