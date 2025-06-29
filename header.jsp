<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
     <style>
        /* Header Styling */
        .header {
            background-color: #fb6d00; /* Richer Swiggy Orange */
            padding: 15px 30px;
            color: white;
            display: flex;
            justify-content: space-between;
            align-items: center;
            font-family: Arial, sans-serif;
        }

        .header h1 {
            margin: 0;
            font-size: 28px;
            font-weight: bold;
        }

        /* Navigation links */
        .nav-links a {
            color: white;
            text-decoration: none;
            margin-left: 20px;
            font-weight: bold;
            transition: color 0.2s;
        }

        .nav-links a:hover {
            color: #ffcc00; /* Lighter shade of orange for hover effect */
        }
        
        /* Adding responsiveness for mobile */
        @media (max-width: 768px) {
            .header {
                flex-direction: column;
                align-items: flex-start;
            }
            .nav-links {
                margin-top: 10px;
                display: flex;
                flex-direction: column;
            }
            .nav-links a {
                margin-left: 0;
                margin-bottom: 10px;
            }
        }
    </style>
</head>
<body>

<div class="header">
    <h1>Taste It!</h1>
    <div class="nav-links">
        <a href="Home.jsp">Restaurants</a>
        <a href="Menu.jsp">Menu</a>
        <a href="viewOrders.jsp">Orders</a>
        <a href="register.jsp">Logout</a>
    </div>
</div>

</body>
</html>
