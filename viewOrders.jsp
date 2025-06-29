<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.food.model.OrderItems" %>
<%@ page import="java.util.*" %>
   <jsp:include page="header.jsp" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View All Orders</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        .header {
            background-color: #fb6d00; /* Swiggy orange */
            color: white;
            padding: 15px;
            text-align: center;
        }
        .cart-container {
            width: 80%;
            margin: 20px auto;
        }
        .order {
            border: 2px solid #fb6d00;
            margin-bottom: 20px;
            padding: 10px;
            border-radius: 5px;
        }
        .order h3 {
            color: #fb6d00;
            margin-bottom: 10px;
        }
        .order-items-table {
            width: 100%;
            border-collapse: collapse;
        }
        .order-items-table th, .order-items-table td {
            padding: 8px 10px;
            border: 1px solid #ddd;
            text-align: left;
        }
        .order-items-table th {
            background-color: #f4f4f4;
        }
        .total-price {
            font-size: 16px;
            font-weight: bold;
            color: #fb6d00;
        }
    </style>
</head>
<body>

    <div class="header">
        <h1></h1>
    </div>

    <div class="cart-container">

        <%
            // Retrieve the list of OrderItems from session
            List<OrderItems> oList = (List<OrderItems>) session.getAttribute("OrderItems");

            if (oList == null || oList.isEmpty()) {
        %>
            <p>No orders found.</p>
        <%
            } else {
                // Group the OrderItems by Order ID
                Map<Integer, List<OrderItems>> ordersMap = new HashMap<>();
                
                for (OrderItems item : oList) {
                    ordersMap.computeIfAbsent(item.getOrderid(), k -> new ArrayList<>()).add(item);
                }
                
                // Iterate through orders and display
                for (Map.Entry<Integer, List<OrderItems>> entry : ordersMap.entrySet()) {
                    int orderId = entry.getKey();
                    List<OrderItems> orderItems = entry.getValue();
                    double totalPrice = 0.0;
        %>

        <div class="order">
            <h3>Order ID: <%= orderId %></h3>
            <table class="order-items-table">
                <thead>
                    <tr>
                        <th>Menu ID</th>
                        <th>Quantity</th>
                        <th>Item Total</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        // Display the items in the order
                        for (OrderItems item : orderItems) {
                            totalPrice += item.getItemtotal();
                    %>
                    <tr>
                        <td><%= item.getMenuid() %></td>
                        <td><%= item.getQuantity() %></td>
                        <td><%= item.getItemtotal() %></td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
            <p class="total-price">Total Price: ₹<%= totalPrice %></p>
        </div>

        <%
                }
            }
        %>

    </div>
<jsp:include page="/footer.jsp" />
</body>
</html>
