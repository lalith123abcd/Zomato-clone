<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="com.food.model.Menu" %>
   <jsp:include page="header.jsp" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Menu List</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f2f2f2;
        }

        h1 {
            text-align: center;
            color: #333;
            padding: 20px;
        }

        .menu-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            padding: 20px;
            gap: 20px;
        }

        .menu-card {
            background-color: #fff;
            border-radius: 12px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
            width: 300px;
            overflow: hidden;
            transition: transform 0.2s ease;
        }

        .menu-card:hover {
            transform: translateY(-5px);
        }

        .menu-image {
            width: 100%;
            height: 180px;
            object-fit: cover;
        }

        .menu-details {
            padding: 15px;
        }

        .menu-title {
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 5px;
            color: #222;
        }

        .menu-description {
            font-size: 14px;
            color: #555;
            margin-bottom: 10px;
        }

        .menu-price {
            font-size: 16px;
            font-weight: bold;
            color: #e65100;
            margin-bottom: 10px;
        }

        .menu-meta {
            font-size: 13px;
            color: #888;
            margin-bottom: 10px;
        }

        .order-button {
            display: block;
            width: 100%;
            padding: 10px;
            background-color: #ff6f00;
            color: white;
            text-align: center;
            border: none;
            border-radius: 6px;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .order-button:hover {
            background-color: #e65100;
        }

        .empty-message {
            text-align: center;
            color: #888;
            font-size: 18px;
            margin-top: 50px;
        }
    </style>
</head>
<body>

<h1>Our Menu</h1>

<%
    List<Menu> mList = (List<Menu>) session.getAttribute("MenuList");
    if (mList != null && !mList.isEmpty()) {
%>
    <div class="menu-container">
        <% for (Menu m : mList) { %>
            <div class="menu-card">
                <% if (m.getImagepath() != null && !m.getImagepath().isEmpty()) { %>
                    <img class="menu-image" src="<%= m.getImagepath() %>" alt="Menu Image">
                <% } else { %>
                    <img class="menu-image" src="default-image.jpg" alt="Default Image">
                <% } %>
                <div class="menu-details">
                    <div class="menu-title"><%= m.getName() %></div>
                    <div class="menu-description"><%= m.getDescription() %></div>
                    <div class="menu-price">₹<%= m.getPrice() %></div>
                    <div class="menu-meta">Available: <%= m.getIsavailable() %> | ID: <%= m.getMenuid() %></div>
                    <form action="cart" method="post">
                        <input type="hidden" name="itemid" value="<%= m.getMenuid() %>">
                        <input type="hidden" name="action" value="add">
                        <button type="submit" class="order-button">Add to Cart</button>
                    </form>
                </div>
            </div>
        <% } %>
    </div>
<%
    } else {
%>
    <div class="empty-message">No menu items available for this restaurant.</div>
<%
    }
%>
<jsp:include page="/footer.jsp" />
</body>
</html>
