<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.fashionstore.model.Product" %>

<style>

body{
    margin:0;
    padding:0;
    background:#f5f7fb;
    font-family:'Poppins', sans-serif;
}

/* MAIN CONTAINER */

.main-container{
    display:flex;
    gap:30px;
    padding:30px;
}

/* SIDEBAR */

.sidebar{
    width:260px;
    background:white;
    padding:25px;
    border-radius:25px;
    height:fit-content;
    box-shadow:0 5px 20px rgba(0,0,0,0.05);
}

.sidebar h2{
    margin-bottom:25px;
    color:#222;
    font-size:32px;
}

.category-link{
    text-decoration:none;
}

.filter-item{
    padding:16px 0;
    color:#555;
    font-size:20px;
    border-bottom:1px solid #eee;
    transition:0.3s;
}

.filter-item:hover{
    color:#6c4df6;
    padding-left:10px;
}

/* PRODUCTS SECTION */

.products-section{
    flex:1;
}

.page-title{
    font-size:60px;
    font-weight:700;
    color:#222;
    margin-bottom:30px;
}

/* PRODUCT GRID */

.product-grid{
    display:grid;
    grid-template-columns:repeat(auto-fit,minmax(280px,1fr));
    gap:35px;
}

/* PRODUCT CARD */

.product-card{
    background:white;
    border-radius:30px;
    padding:22px;
    transition:0.3s;
    box-shadow:0 5px 20px rgba(0,0,0,0.05);
}

.product-card:hover{
    transform:translateY(-10px);
    box-shadow:0 10px 30px rgba(0,0,0,0.08);
}

.product-card img{
    width:100%;
    height:300px;
    object-fit:cover;
    border-radius:25px;
}

/* PRODUCT DETAILS */

.product-name{
    font-size:38px;
    margin-top:20px;
    color:#222;
    font-weight:700;
}

.brand{
    color:#777;
    margin-top:8px;
    font-size:24px;
}

.price{
    color:#6c4df6;
    font-size:42px;
    margin-top:15px;
    font-weight:700;
}

/* BUTTON */

.add-btn{
    width:100%;
    padding:16px;
    border:none;
    background:#6c4df6;
    color:white;
    border-radius:15px;
    font-size:22px;
    margin-top:20px;
    cursor:pointer;
    transition:0.3s;
    font-weight:600;
}

.add-btn:hover{
    background:#5638d6;
}

/* RESPONSIVE */
.top-section{
    display:flex;
    justify-content:space-between;
    align-items:center;
    margin-bottom:35px;
    gap:20px;
}

.search-form{
    display:flex;
    align-items:center;
    gap:15px;
}

.search-input{
    width:320px;
    padding:16px 20px;
    border:none;
    outline:none;
    border-radius:15px;
    background:white;
    font-size:18px;
    box-shadow:0 5px 20px rgba(0,0,0,0.05);
}

.search-btn{
    padding:16px 25px;
    border:none;
    border-radius:15px;
    background:#6c4df6;
    color:white;
    font-size:18px;
    cursor:pointer;
    transition:0.3s;
    font-weight:600;
}

.search-btn:hover{
    background:#5638d6;
}

@media(max-width:900px){

    .main-container{
        flex-direction:column;
    }

    .sidebar{
        width:100%;
    }

    .page-title{
        font-size:40px;
    }
}

</style>
<%
List<Product> products =
(List<Product>) request.getAttribute("products");
%>


<jsp:include page="partials/header.jsp" />
<div class="main-container">

    <!-- SIDEBAR -->

    <div class="sidebar">

        <h2>Categories</h2>

        <a class="category-link"
           href="products?category=T-Shirt">
            <div class="filter-item">T-Shirts</div>
        </a>

        <a class="category-link"
           href="products?category=Shoes">
            <div class="filter-item">Shoes</div>
        </a>

        <a class="category-link"
           href="products?category=Watch">
            <div class="filter-item">Watches</div>
        </a>

        <a class="category-link"
           href="products?category=Hoodie">
            <div class="filter-item">Hoodies</div>
        </a>

        <a class="category-link"
           href="products?category=Bag">
            <div class="filter-item">Bags</div>
        </a>

        <a class="category-link"
           href="products?category=Jacket">
            <div class="filter-item">Jackets</div>
        </a>

    </div>

    <!-- PRODUCTS -->

    <div class="products-section">

        <div class="top-section">

    <div class="page-title">
        All Products
    </div>

    <form action="products"
          method="get"
          class="search-form">

        <input type="text"
               name="keyword"
               placeholder="Search products..."
               class="search-input">

        <button type="submit"
                class="search-btn">

            Search

        </button>

    </form>

</div>

        <div class="product-grid">

        <%
        if(products != null && !products.isEmpty()){

            for(Product product : products){
        %>

            <div class="product-card">

<a href="product-details?id=<%= product.getProductId() %>">

    <img src="<%= product.getImageUrl() %>">

</a>
                <a href="product-details?id=<%= product.getProductId() %>"
   style="text-decoration:none;">

    <div class="product-name">

        <%= product.getProductName() %>

    </div>

</a>

                <div class="brand">
                    <%= product.getBrand() %>
                </div>

                <div class="price">
                    ₹ <%= product.getPrice() %>
                </div>

                <a href="add-to-cart?productId=<%= product.getProductId() %>">

                    <button class="add-btn">
                        Add To Cart
                    </button>

                </a>

            </div>

        <%
            }
        }else{
        %>

            <h2>No Products Found</h2>

        <%
        }
        %>

        </div>

    </div>

</div>