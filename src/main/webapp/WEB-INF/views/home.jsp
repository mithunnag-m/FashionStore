<%@ page import="java.util.List" %>
<%@ page import="com.fashionstore.model.Product" %>

<%
List<Product> products =
(List<Product>) request.getAttribute("products");
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Fashion Store</title>

<link rel="preconnect"
href="https://fonts.googleapis.com">

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
rel="stylesheet">

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

/* HERO SECTION */

.hero{

    height:500px;

    background:linear-gradient(
    135deg,
    #6c4df6,
    #9d50ff);

    display:flex;

    align-items:center;

    justify-content:space-between;

    padding:60px 80px;

    color:white;
}

.hero-left h1{

    font-size:70px;

    line-height:1.1;

    margin-bottom:20px;
}

.hero-left p{

    font-size:22px;

    margin-bottom:30px;

    opacity:0.9;
}

.shop-btn{

    display:inline-block;

    padding:18px 40px;

    background:white;

    color:#6c4df6;

    text-decoration:none;

    border-radius:14px;

    font-size:20px;

    font-weight:600;
}

.hero img{

    width:420px;
}

/* PRODUCTS SECTION */

.products-section{

    padding:60px 80px;
}

.section-title{

    font-size:42px;

    margin-bottom:40px;

    color:#222;
}

/* PRODUCT GRID */

.product-grid{

    display:grid;

    grid-template-columns:
    repeat(auto-fit,minmax(280px,1fr));

    gap:35px;
}

/* PRODUCT CARD */

.product-card{

    background:white;

    padding:20px;

    border-radius:25px;

    box-shadow:0 5px 20px rgba(0,0,0,0.05);

    transition:0.3s;
}

.product-card:hover{

    transform:translateY(-8px);
}

.product-card img{

    width:100%;

    height:300px;

    object-fit:cover;

    border-radius:20px;
}

.product-card h2{

    font-size:30px;

    font-weight:700;

    margin-top:18px;

    color:#222;
}

.product-card p{

    color:#777;

    margin-top:5px;

    font-size:20px;
}

.product-card h3{

    color:#6c4df6;

    font-size:34px;

    font-weight:700;

    margin-top:12px;
}

/* BUTTON */

.view-btn{

    width:100%;

    padding:15px;

    margin-top:20px;

    border:none;

    background:#6c4df6;

    color:white;

    border-radius:12px;

    font-size:18px;

    cursor:pointer;

    transition:0.3s;
}

.view-btn:hover{

    background:#5638d6;
}

/* RESPONSIVE */

@media(max-width:900px){

    .hero{

        flex-direction:column;

        text-align:center;

        height:auto;

        padding:50px 30px;
    }

    .hero img{

        width:280px;

        margin-top:40px;
    }

    .hero-left h1{

        font-size:50px;
    }

    .products-section{

        padding:40px 20px;
    }
}

</style>

</head>

<body>

<jsp:include page="partials/header.jsp" />

<!-- HERO SECTION -->

<section class="hero">

    <div class="hero-left">

        <h1>

            Discover Your
            <br>
            Fashion Style

        </h1>

        <p>

            Trending fashion products with
            premium quality and modern style.

        </p>

        <a href="products"
        class="shop-btn">

            Shop Now

        </a>

    </div>

    <img src="assets/images/fashion-banner.png">

</section>

<!-- TRENDING PRODUCTS -->

<div class="products-section">

    <h1 class="section-title">

        Trending Products

    </h1>

    <div class="product-grid">

        <% if(products != null){ %>

            <% for(Product product : products){ %>

                <div class="product-card">

               <img src="<%= product.getImageUrl() %>">

<h2>
    <%= product.getProductName() %>
</h2>

<p>
    <%= product.getBrand() %>
</p>

<h3>
    &#8377; <%= product.getPrice() %>
</h3>

<a href="product-details?id=<%= product.getProductId() %>">

                        <button class="view-btn">

                            View Details

                        </button>

                    </a>

                </div>

            <% } %>

        <% } %>

    </div>

</div>

</body>

</html>