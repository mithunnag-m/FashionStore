<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.fashionstore.model.Product" %>

<%
Product product =
(Product) request.getAttribute("product");
%>

<!DOCTYPE html>

<html>

<head>

<title>Product Details</title>

<style>

body{
    margin:0;
    padding:40px;
    background:#f5f7fb;
    font-family:'Poppins', sans-serif;
}

.product-container{
    display:flex;
    gap:50px;
    background:white;
    padding:40px;
    border-radius:30px;
    box-shadow:0 5px 20px rgba(0,0,0,0.05);
}

.product-image{
    width:450px;
    height:500px;
    object-fit:cover;
    border-radius:25px;
}

.product-info{
    flex:1;
}

.product-name{
    font-size:55px;
    font-weight:700;
    color:#222;
}

.brand{
    font-size:28px;
    color:#666;
    margin-top:15px;
}

.price{
    font-size:50px;
    color:#6c4df6;
    font-weight:700;
    margin-top:25px;
}

.description{
    margin-top:30px;
    font-size:22px;
    line-height:1.7;
    color:#555;
}

.add-btn{
    margin-top:40px;
    padding:18px 35px;
    border:none;
    background:#6c4df6;
    color:white;
    border-radius:15px;
    font-size:22px;
    cursor:pointer;
    transition:0.3s;
    font-weight:600;
}

.add-btn:hover{
    background:#5638d6;
}

.back-btn{
    display:inline-block;
    margin-bottom:30px;
    text-decoration:none;
    color:#6c4df6;
    font-size:22px;
    font-weight:600;
}

</style>

</head>

<body>


<jsp:include page="partials/header.jsp" />

<a href="products"
   class="back-btn">

← Back To Products

</a>

<div class="product-container">

    <img src="<%= product.getImageUrl() %>"
         class="product-image">

    <div class="product-info">

        <div class="product-name">
            <%= product.getProductName() %>
        </div>

        <div class="brand">
            Brand : <%= product.getBrand() %>
        </div>

        <div class="price">
            ₹ <%= product.getPrice() %>
        </div>

        <div class="description">

            Premium quality fashion product
            with modern style and comfort.
            Perfect for daily wear and
            trending fashion collections.

        </div>

        <a href="add-to-cart?productId=<%= product.getProductId() %>">

            <button class="add-btn">

                Add To Cart

            </button>

        </a>

    </div>

</div>

</body>

</html>