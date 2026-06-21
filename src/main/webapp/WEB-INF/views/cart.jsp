<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="java.util.List" %>
<%@ page import="com.fashionstore.model.Cart" %>

<%
List<Cart> cartList =
(List<Cart>) request.getAttribute("cartList");
%>

<!DOCTYPE html>

<html>

<head>

<title>My Cart</title>

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

/* HEADER */

.top-bar{
    background:white;
    padding:25px 40px;
    font-size:34px;
    font-weight:700;
    color:#6c4df6;
    box-shadow:0 2px 10px rgba(0,0,0,0.05);
}

/* MAIN */

.container{
    width:90%;
    margin:40px auto;
}

.page-title{
    font-size:48px;
    font-weight:700;
    color:#222;
    margin-bottom:35px;
}

/* CART CARD */

.cart-card{
    background:white;
    border-radius:25px;
    padding:25px;
    margin-bottom:25px;
    display:flex;
    align-items:center;
    gap:30px;
    box-shadow:0 5px 20px rgba(0,0,0,0.05);
}

.cart-image{
    width:180px;
    height:180px;
    object-fit:cover;
    border-radius:20px;
}

.cart-details{
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
    font-size:36px;
    color:#6c4df6;
    font-weight:700;
    margin-top:15px;
}

/* QUANTITY */

.quantity-box{
    display:flex;
    align-items:center;
    gap:20px;
    margin-top:20px;
}

.qty-btn{
    width:45px;
    height:45px;
    background:#6c4df6;
    color:white;
    text-decoration:none;
    display:flex;
    justify-content:center;
    align-items:center;
    border-radius:12px;
    font-size:28px;
    font-weight:bold;
    transition:0.3s;
}

.qty-btn:hover{
    background:#5638d6;
}

.qty-number{
    font-size:28px;
    font-weight:700;
}

/* REMOVE */

.remove-btn{
    padding:14px 24px;
    background:red;
    color:white;
    border-radius:12px;
    text-decoration:none;
    font-size:18px;
    font-weight:600;
}

/* CHECKOUT */

.checkout-section{
    margin-top:40px;
    text-align:right;
}

.checkout-btn{
    padding:18px 35px;
    border:none;
    background:#6c4df6;
    color:white;
    font-size:24px;
    border-radius:15px;
    cursor:pointer;
    transition:0.3s;
    font-weight:600;
}

.checkout-btn:hover{
    background:#5638d6;
}

/* EMPTY CART */

.empty-cart{
    text-align:center;
    margin-top:100px;
    font-size:40px;
    color:gray;
}

/* RESPONSIVE */

@media(max-width:900px){

    .cart-card{
        flex-direction:column;
        text-align:center;
    }

    .cart-image{
        width:100%;
        height:300px;
    }

    .checkout-section{
        text-align:center;
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
        My Cart
    </div>

<%
if(cartList != null && !cartList.isEmpty()){

    for(Cart cart : cartList){
%>

    <div class="cart-card">

        <img src="<%= cart.getProduct().getImageUrl() %>"
             class="cart-image">

        <div class="cart-details">

            <div class="product-name">

                <%= cart.getProduct().getProductName() %>

            </div>

            <div class="brand">

                Brand :
                <%= cart.getProduct().getBrand() %>

            </div>

            <div class="price">

    Price :
    ₹ <%= cart.getProduct().getPrice() %>

    <br><br>

    Total :
    ₹ <%= cart.getProduct().getPrice()
           * cart.getQuantity() %>

</div>
            <!-- QUANTITY -->

            <div class="quantity-box">

                <a href="decrease-quantity?cardId=<%= cart.getCartId() %>"
                   class="qty-btn">

                    -

                </a>

                <span class="qty-number">

                    <%= cart.getQuantity() %>

                </span>

                <a href="increase-quantity?cartId=<%= cart.getCartId() %>"
                   class="qty-btn">

                    +

                </a>

            </div>

        </div>

        <!-- REMOVE -->

   <a href="remove-cart?cartId=<%= cart.getCartId() %>">

    <button class="remove-btn">
        Remove
    </button>

</a>

    </div>

<%
    }
%>

<%
double grandTotal = 0;

for(Cart c : cartList){

    grandTotal +=
    c.getProduct().getPrice()
    * c.getQuantity();
}
%>

<div style="
text-align:right;
font-size:32px;
font-weight:bold;
margin-top:30px;
color:#6c4df6;">

Grand Total :
₹ <%= grandTotal %>

</div>
    <!-- CHECKOUT -->

    <div class="checkout-section">

        <a href="checkout">

            <button class="checkout-btn">

                Proceed To Checkout

            </button>

        </a>

    </div>

<%
}else{
%>

    <div class="empty-cart">

        Your Cart Is Empty

    </div>

<%
}
%>

</div>

</body>

</html>