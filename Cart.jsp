<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.food.model.Cart" %>
<%@ page import="com.food.model.CartItem" %>
   <jsp:include page="header.jsp" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Your Food Cart</title>
<style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background-color: #f8f8f8;
        margin: 0;
        padding: 0;
        color: #333;
    }

    .cart-container {
        max-width: 800px;
        margin: 30px auto;
        background: white;
        border-radius: 12px;
        box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        padding: 25px;
    }

    .empty-cart {
        text-align: center;
        padding: 40px 20px;
    }

    .empty-cart p {
        font-size: 18px;
        color: #666;
        margin-bottom: 20px;
    }

    .btn-primary {
        background-color: #fc8019;
        color: white;
        padding: 12px 24px;
        text-decoration: none;
        border-radius: 6px;
        font-weight: bold;
        display: inline-block;
        transition: background-color 0.3s;
    }

    .btn-primary:hover {
        background-color: #e67317;
    }

    .cart-items {
        margin-top: 20px;
    }

    .cart-item {
        display: flex;
        justify-content: space-between;
        padding: 20px 0;
        border-bottom: 1px solid #eee;
        align-items: center;
    }

    .item-details {
        flex: 1;
    }

    .item-details h3 {
        margin: 0 0 10px 0;
        color: #333;
        font-size: 18px;
    }

    .item-details p {
        margin: 5px 0;
        color: #666;
    }

    .item-actions {
        display: flex;
        align-items: center;
        gap: 10px;
    }

    .quantity-btn {
        background-color: #f8f8f8;
        border: 1px solid #ccc;
        width: 30px;
        height: 30px;
        font-size: 16px;
        cursor: pointer;
        display: flex;
        align-items: center;
        justify-content: center;
        border-radius: 50%;
    }

    .quantity-btn:hover {
        background-color: #eee;
    }

    .quantity-value {
        width: 30px;
        text-align: center;
    }

    .remove-btn {
        background-color: #ff3c00;
        color: white;
        border: none;
        padding: 8px 15px;
        border-radius: 6px;
        cursor: pointer;
        font-size: 14px;
        transition: background-color 0.3s;
    }

    .remove-btn:hover {
        background-color: #e03500;
    }

    .item-price {
        min-width: 100px;
        text-align: right;
    }

    .cart-total {
        text-align: right;
        margin-top: 20px;
        padding-top: 20px;
        border-top: 1px solid #eee;
        font-size: 18px;
        font-weight: bold;
    }

    .checkout-btn {
        display: block;
        width: 100%;
        background-color: #fc8019;
        color: white;
        border: none;
        padding: 15px;
        font-size: 16px;
        font-weight: bold;
        border-radius: 6px;
        margin-top: 25px;
        cursor: pointer;
        transition: background-color 0.3s;
    }

    .checkout-btn:hover {
        background-color: #e67317;
    }
</style>
</head>
<body>

<div class="cart-container">
    <%
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null || cart.getItems().isEmpty()) {
    %>
        <div class="empty-cart">
            <p>Your cart is empty. Start adding some delicious items!</p>
            <a href="Menu.jsp" class="btn-primary">Browse Menu</a>        
        </div>
    <%
        } else {
            double totalAmount = 0;
    %>
        <h2 style="margin-top: 0;">Your Food Cart</h2>
        <div class="cart-items">
            <%
                for (Map.Entry<Integer, CartItem> entry : cart.getItems().entrySet()) {
                    CartItem item = entry.getValue();
                    totalAmount += item.getPrice() * item.getQuantity();
            %>
                <div class="cart-item">
                    <div class="item-details">
                        <h3><%= item.getName() %></h3>
                        <p>Price: ₹<%= item.getPrice() %></p>
                    </div>

                    <div class="item-actions">
                        <!-- Decrease Quantity -->
                        <form action="cart" method="post" style="margin: 0;">
                            <input type="hidden" name="itemid" value="<%= entry.getKey() %>">
                            <input type="hidden" name="action" value="update">
                            <input type="hidden" name="quantity" value="<%= item.getQuantity() - 1 %>">
                            <button type="submit" class="quantity-btn" <%= item.getQuantity() <= 1 ? "disabled" : "" %>>-</button>
                        </form>

                        <span class="quantity-value"><%= item.getQuantity() %></span>

                        <!-- Increase Quantity -->
                        <form action="cart" method="post" style="margin: 0;">
                            <input type="hidden" name="itemid" value="<%= entry.getKey() %>">
                            <input type="hidden" name="action" value="update">
                            <input type="hidden" name="quantity" value="<%= item.getQuantity() + 1 %>">
                            <button type="submit" class="quantity-btn">+</button>
                        </form>

                        <!-- Remove Item -->
                        <form action="cart" method="post" style="margin: 0;">
                            <input type="hidden" name="itemid" value="<%= entry.getKey() %>">
                            <input type="hidden" name="action" value="remove">
                            <button type="submit" class="remove-btn">Remove</button>
                        </form>
                    </div>

                    <div class="item-price">
                        <p>₹<%= item.getPrice() * item.getQuantity() %></p>
                    </div>
                </div>
            <%
                }
            %>

            <!-- Add More Items Button -->
            <div style="text-align: left; margin-top: 20px;">
                <a href="Menu.jsp" class="btn-primary">Add More Items</a>
            </div>

            <div class="cart-total">
                <p>Grand Total: ₹<%= totalAmount %></p>
            </div>
           <a href="checkout.jsp"> <button class="checkout-btn">Proceed to Checkout</button></a>
        </div>
    <%
        }
    %>
</div>
<jsp:include page="/footer.jsp" />
</body>
</html>
