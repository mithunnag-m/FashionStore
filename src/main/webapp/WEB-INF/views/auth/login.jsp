<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login - Fashion Store</title>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Poppins',sans-serif;
}

body{
    background:#f5f7fb;
}

/* NAVBAR */

.navbar{
    width:100%;
    height:70px;
    background:white;
    display:flex;
    align-items:center;
    justify-content:space-between;
    padding:0 40px;
    box-shadow:0 2px 10px rgba(0,0,0,0.05);
}

.logo{
    font-size:32px;
    font-weight:700;
    color:#6c4df6;
}

.search-box{
    display:flex;
    gap:10px;
}

.search-box input{
    width:320px;
    height:40px;
    border:1px solid #ddd;
    border-radius:8px;
    padding:0 15px;
    outline:none;
}

.search-box button{
    background:#6c4df6;
    color:white;
    border:none;
    padding:0 20px;
    border-radius:8px;
    cursor:pointer;
}

.nav-links{
    display:flex;
    gap:30px;
}

.nav-links a{
    text-decoration:none;
    color:#222;
    font-weight:500;
}

/* LOGIN CONTAINER */

.login-container{
    width:100%;
    height:calc(100vh - 70px);
    display:flex;
    justify-content:center;
    align-items:center;
}

/* LOGIN CARD */

.login-card{
    width:430px;
    background:white;
    padding:45px;
    border-radius:20px;
    box-shadow:0 10px 30px rgba(0,0,0,0.06);
}

.store-name{
    text-align:center;
    color:#6c4df6;
    font-size:26px;
    font-weight:700;
    margin-bottom:10px;
}

.login-title{
    text-align:center;
    font-size:38px;
    font-weight:700;
    color:#222;
    margin-bottom:10px;
}

.login-subtitle{
    text-align:center;
    color:#888;
    margin-bottom:35px;
}

/* FORM */

.form-group{
    margin-bottom:22px;
}

.form-group label{
    display:block;
    margin-bottom:8px;
    color:#333;
    font-weight:500;
}

.form-group input{
    width:100%;
    height:52px;
    border:none;
    background:#eef1f8;
    border-radius:10px;
    padding:0 15px;
    outline:none;
    font-size:15px;
}

/* BUTTON */

.login-btn{
    width:100%;
    height:52px;
    border:none;
    background:#6c4df6;
    color:white;
    border-radius:10px;
    font-size:18px;
    font-weight:600;
    cursor:pointer;
    transition:0.3s;
    margin-top:10px;
}

.login-btn:hover{
    background:#5638d6;
}

/* REGISTER */

.register-text{
    text-align:center;
    margin-top:25px;
    color:#888;
}

.register-text a{
    color:#6c4df6;
    text-decoration:none;
    font-weight:600;
}

/* ERROR */

.error{
    background:#ffe6e6;
    color:red;
    padding:12px;
    border-radius:8px;
    margin-bottom:20px;
    text-align:center;
}

</style>

</head>

<body>

<!-- NAVBAR -->

<div class="navbar">

    <div class="logo">
        Fashion Store
    </div>

    <div class="search-box">
        <input type="text" placeholder="Search products...">
        <button>Search</button>
    </div>

    <div class="nav-links">
        <a href="home">Home</a>
        <a href="products">Products</a>
        <a href="cart">Cart</a>
        <a href="login">Login</a>
    </div>

</div>

<!-- LOGIN -->

<div class="login-container">

    <div class="login-card">

        <div class="store-name">
            Fashion Store
        </div>

        <div class="login-title">
            Welcome Back!
        </div>

        <div class="login-subtitle">
            Login to your account
        </div>

        <% String error =
        (String) request.getAttribute("error"); %>

        <% if(error != null){ %>

            <div class="error">
                <%= error %>
            </div>

        <% } %>

        <form action="login" method="post">

            <div class="form-group">

                <label>Email Address</label>

                <input type="email"
                       name="email"
                       placeholder="Enter email"
                       required>

            </div>

            <div class="form-group">

                <label>Password</label>

                <input type="password"
                       name="password"
                       placeholder="Enter password"
                       required>

            </div>

            <button class="login-btn">
                Login
            </button>

        </form>

        <div class="register-text">

            Don't have an account?

            <a href="register">
                Register here
            </a>

        </div>

    </div>

</div>

</body>
</html>