<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <jsp:include page="header.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Checkout</title>
<style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background-color: #f8f8f8;
        margin: 0;
        padding: 0;
    }

    h2 {
        text-align: center;
        padding: 20px;
        color: #333;
    }

    form {
        background-color: #fff;
        max-width: 500px;
        margin: 30px auto;
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0 4px 20px rgba(0,0,0,0.1);
    }

    label {
        display: block;
        margin-top: 20px;
        font-weight: 500;
        color: #555;
    }

    textarea, select, input[type="text"], input[type="submit"] {
        width: 100%;
        padding: 12px;
        margin-top: 8px;
        border: 1px solid #ddd;
        border-radius: 8px;
        box-sizing: border-box;
        font-size: 16px;
        transition: border-color 0.3s;
    }

    textarea:focus, select:focus, input[type="text"]:focus {
        border-color: #fc8019;
        outline: none;
    }

    input[type="submit"] {
        background-color: #fc8019;
        color: #fff;
        border: none;
        margin-top: 25px;
        cursor: pointer;
        font-weight: bold;
        transition: background-color 0.3s;
    }

    input[type="submit"]:hover {
        background-color: #e97117;
    }
    
    h2 {
    text-align: center;
    padding: 20px 0;
    color: #222;
    font-size: 28px;
    font-weight: 600;
    position: relative;
    margin-bottom: 30px;
}

h2::after {
    content: "";
    width: 60px;
    height: 4px;
    background-color: #fc8019;
    display: block;
    margin: 10px auto 0;
    border-radius: 2px;
}
    
</style>
</head>
<body>
<h2>CheckOut</h2>
<form action="checkout" method="post">
    <h2>Delivery Address</h2>
   
   FULL NAME:<input type="text" name="name">
   Street:<input type="text" name="street">
   City:<input type="text" name="city">
   State:<input type="text" name="state">
   PinCode:<input type="number" name="pc">

    <label>Payment Method</label>
    <select name="paymentMethod">
        <option value="Online">Credit Card</option>
        <option value="Online">Debit Card</option>
        <option value="Online">UPI</option>
        <option value="Offline">Cash On Delivery</option>
    </select>

    <input type="submit" value="Place Order">
</form>

<jsp:include page="/footer.jsp" />
</body>
</html>
