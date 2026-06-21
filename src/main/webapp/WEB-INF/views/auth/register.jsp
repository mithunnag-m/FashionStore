<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Register - Fashion Store</title>

<style>

body{
    font-family: Arial, sans-serif;
    background-color: #f5f5f5;
}

.container{
    width: 400px;
    margin: 50px auto;
    background-color: white;
    padding: 30px;
    border-radius: 10px;
}

h2{
    text-align: center;
    margin-bottom: 20px;
}

input, textarea{
    width: 100%;
    padding: 10px;
    margin-top: 10px;
    margin-bottom: 15px;
}

button{
    width: 100%;
    padding: 10px;
    background-color: black;
    color: white;
    border: none;
    cursor: pointer;
}

button:hover{
    background-color: #333;
}

</style>

</head>

<body>

<div class="container">

    <h2>User Registration</h2>

    <form action="register" method="post">

        <input type="text"
               name="fullName"
               placeholder="Enter Full Name"
               required>

        <input type="email"
               name="email"
               placeholder="Enter Email"
               required>

        <input type="text"
               name="phone"
               placeholder="Enter Phone Number"
               required>

        <input type="password"
               name="password"
               placeholder="Enter Password"
               required>

        <textarea name="address"
                  placeholder="Enter Address"
                  rows="4"
                  required></textarea>

        <button type="submit">
            Register
        </button>
        
        <p style="margin-top:20px;">

    Already have an account?

    <a href="login">
        Login
    </a>

</p>

    </form>

</div>

</body>
</html>