<form action="place-order" method="post">

    <!-- ADDRESS -->

    <label
    style="
    font-size:20px;
    font-weight:600;
    display:block;
    margin-bottom:10px;">

    Address

    </label>

    <textarea
    name="address"
    placeholder="Enter Shipping Address"
    required
    style="
    width:100%;
    height:90px;
    padding:15px;
    border:1px solid #ddd;
    border-radius:10px;
    font-size:18px;
    margin-bottom:25px;
    resize:none;"></textarea>

    <!-- CITY -->

    <label
    style="
    font-size:20px;
    font-weight:600;
    display:block;
    margin-bottom:10px;">

    City

    </label>

    <input
    type="text"
    name="city"
    placeholder="Enter City"
    required
    style="
    width:100%;
    padding:15px;
    border:1px solid #ddd;
    border-radius:10px;
    font-size:18px;
    margin-bottom:25px;">

    <!-- PINCODE -->

    <label
    style="
    font-size:20px;
    font-weight:600;
    display:block;
    margin-bottom:10px;">

    Pincode

    </label>

    <input
    type="text"
    name="pincode"
    placeholder="Enter Pincode"
    required
    style="
    width:100%;
    padding:15px;
    border:1px solid #ddd;
    border-radius:10px;
    font-size:18px;
    margin-bottom:25px;">

    <!-- PAYMENT -->

    <label
    style="
    font-size:20px;
    font-weight:600;
    display:block;
    margin-bottom:10px;">

    Payment Method

    </label>

    <select
    name="paymentMethod"
    required
    style="
    width:100%;
    padding:15px;
    border:1px solid #ddd;
    border-radius:10px;
    font-size:18px;
    margin-bottom:30px;">

        <option value="">
            Select Payment Method
        </option>

        <option value="COD">
            Cash On Delivery
        </option>

        <option value="UPI">
            UPI
        </option>

        <option value="CARD">
            Credit Card
        </option>

    </select>

    <!-- BUTTON -->

    <button
    type="submit"
    style="
    width:100%;
    padding:18px;
    border:none;
    background:green;
    color:white;
    border-radius:10px;
    font-size:24px;
    cursor:pointer;">

        Place Order

    </button>

</form>