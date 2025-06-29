<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.food.model.OrderItems" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Order Confirmation</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            padding: 20px;
        }
        h1 {
            color: green;
            text-align: center;
        }
        .cards-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
            margin-top: 30px;
        }
        .order-card {
            background-color: #ffffff;
            border: 1px solid #ddd;
            border-radius: 12px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 20px;
            width: 300px;
            text-align: left;
            transition: transform 0.2s ease;
        }
        .order-card:hover {
            transform: scale(1.02);
        }
        .order-card h3 {
            margin-top: 0;
            color: #4CAF50;
        }
        .no-items {
            text-align: center;
            color: red;
            margin-top: 40px;
        }
    </style>
</head>
<body>

<h1>Your Order is Confirmed</h1>

<%
    List<OrderItems> oList = (List<OrderItems>) session.getAttribute("OrderItems");
    if (oList != null && !oList.isEmpty()) {
%>
    <div class="cards-container">
        <% for (OrderItems item : oList) { %>
            <div class="order-card">
               
                <p><strong>Order ID:</strong> <%= item.getOrderid() %></p>
                <p><strong>Quantity:</strong> <%= item.getQuantity() %></p>
                <p><strong>Total:</strong> ₹<%= String.format("%.2f", item.getItemtotal()) %></p>
            </div>
        <% } %>
    </div>
<%
    } else {
%>
    <p class="no-items">No order items found.</p>
<%
    }
%>
<jsp:include page="/footer.jsp" />
</body>
</html>
