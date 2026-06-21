<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<link rel="preconnect" href="https://fonts.googleapis.com">

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
rel="stylesheet">

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Poppins', sans-serif;
}

.navbar{

    width:100%;

    height:90px;

    background:white;

    display:flex;

    align-items:center;

    justify-content:space-between;

    padding:0 50px;

    box-shadow:0 2px 10px rgba(0,0,0,0.05);

    position:sticky;

    top:0;

    z-index:1000;
}

/* LOGO */

.logo{

    font-size:34px;

    font-weight:700;

    color:#6c4df6;

    text-decoration:none;
}

/* SEARCH BAR */

.search-box{

    display:flex;

    align-items:center;

    gap:10px;
}

.search-box input{

    width:280px;

    padding:12px 15px;

    border:1px solid #ddd;

    border-radius:8px;

    outline:none;

    font-size:14px;
}

.search-box button{

    padding:12px 18px;

    background:#6c4df6;

    color:white;

    border:none;

    border-radius:8px;

    cursor:pointer;

    font-weight:600;
}

.search-box button:hover{

    background:#5538d1;
}

/* NAV LINKS */

.nav-links{

    display:flex;

    align-items:center;

    gap:30px;
}

.nav-links a{

    text-decoration:none;

    color:#222;

    font-size:15px;

    font-weight:500;

    transition:0.3s;
}

.nav-links a:hover{

    color:#6c4df6;
}

/* USER */

.user-name{

    color:#555;

    font-size:14px;

    font-weight:500;
}

</style>

</head>

<body>

<div class="navbar">

    <!-- LOGO -->

    <a href="home" class="logo">
        Fashion Store
    </a>

    <!-- SEARCH -->

    <form action="products" method="get"
    class="search-box">

        <input
        type="text"
        name="search"
        placeholder="Search products...">

        <button type="submit">
            Search
        </button>

    </form>

    <!-- NAVIGATION -->

    <div class="nav-links">

        <a href="home">
            Home
        </a>

        <a href="products">
            Products
        </a>

        <a href="cart">
            Cart
        </a>

        <a href="orders">
            Orders
        </a>

        <span class="user-name">

            Hi,
            <%= session.getAttribute("userName") != null
            ? session.getAttribute("userName")
            : "User" %>

        </span>

        <a href="logout">
            Logout
        </a>

    </div>

</div>

</body>
</html>