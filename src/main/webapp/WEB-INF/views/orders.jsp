<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="java.util.List" %>
<%@ page import="com.fashionstore.model.Cart" %>

<%
List<Cart> orderList =
(List<Cart>) request.getAttribute("orderList");
%>

<!DOCTYPE html>

<html>

<head>

<title>My Orders</title>

<link rel="preconnect"
href="https://fonts.googleapis.com">

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
rel="stylesheet">

<style>

body{
    margin:0;
    padding:0;
    background:#f5f7fb;
    font-family:'Poppins', sans-serif;
}

.top-bar{
    background:white;
    padding:25px 40px;
    font-size:34px;
    font-weight:700;
    color:#6c4df6;
    box-shadow:0 2px 10px rgba(0,0,0,0.05);
}

.container{
    width:90%;
    margin:40px auto;
}

.page-title{
    font-size:52px;
    font-weight:700;
    margin-bottom:40px;
    color:#222;
}

.order-card{
    background:white;
    border-radius:25px;
    padding:25px;
    margin-bottom:30px;
    display:flex;
    align-items:center;
    gap:30px;
    box-shadow:0 5px 20px rgba(0,0,0,0.05);
}

.order-image{
    width:180px;
    height:180px;
    object-fit:cover;
    border-radius:20px;
}

.order-details{
    flex:1;
}

.product-name{
    font-size:36px;
    font-weight:700;
    color:#222;
}

.brand{
    font-size:22px;
    color:#777;
    margin-top:10px;
}

.price{
    font-size:34px;
    color:#6c4df6;
    font-weight:700;
    margin-top:15px;
}

.quantity{
    margin-top:15px;
    font-size:24px;
    color:#444;
}

.status{
    margin-top:20px;
    display:inline-block;
    background:#e8f8ed;
    color:green;
    padding:10px 18px;
    border-radius:12px;
    font-weight:600;
    font-size:18px;
}

.empty{
    text-align:center;
    margin-top:100px;
    font-size:40px;
    color:gray;
}

@media(max-width:900px){

    .order-card{
        flex-direction:column;
        text-align:center;
    }

    .order-image{
        width:100%;
        height:300px;
    }
}

</style>

</head>

<body>

<jsp:include page="partials/header.jsp" />

<div class="top-bar">
    Fashion Store
</div>

<div class="container">

    <div class="page-title">

        My Orders

    </div>

<%
if(orderList != null &&
   !orderList.isEmpty()){

    for(Cart order : orderList){
%>

    <div class="order-card">

        <img src="<%= order.getProduct().getImageUrl() %>"
             class="order-image">

        <div class="order-details">

            <div class="product-name">

                <%= order.getProduct().getProductName() %>

            </div>

            <div class="brand">

                Brand :
                <%= order.getProduct().getBrand() %>

            </div>

            <div class="price">

                Price : ₹ <%= order.getProduct().getPrice() %>

<br>

Quantity : <%= order.getQuantity() %>

<br>

Total : ₹ <%= order.getTotalAmount() %>

            </div>

            <div class="quantity">

                Quantity :
                <%= order.getQuantity() %>

            </div>

            <div class="status">

                Ordered Successfully

            </div>

        </div>

    </div>

<%
    }

}else{
%>

    <div class="empty">

        No Orders Yet

    </div>

<%
}
%>

</div>

</body>

</html>