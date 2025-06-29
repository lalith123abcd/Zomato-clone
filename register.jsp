<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Swiggy - Food Delivery | Register</title>
<style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background-color: #f8f8f8;
        margin: 0;
        padding: 0;
    }
    
    .header {
        background-color: #fc8019;
        padding: 10px 0;
        box-shadow: 0 1px 10px rgba(0, 0, 0, 0.1);
        position: fixed;
        width: 100%;
        top: 0;
        left: 0;
        z-index: 1000;
    }
    
    .logo {
        text-align: center;
        color: white;
        font-size: 28px;
        font-weight: bold;
        padding: 5px;
    }
    
    .navbar {
        display: flex;
        justify-content: center;
        align-items: center;
        background-color: #fc8019;
        padding: 10px 0;
    }

    .navbar a {
        color: white;
        text-decoration: none;
        margin: 0 15px;
        font-size: 16px;
        font-weight: 600;
    }

    .navbar a:hover {
        text-decoration: underline;
    }

    .container {
        max-width: 450px;
        margin: 100px auto 30px;
        padding: 0 15px;
    }
    
    .card {
        background: white;
        border-radius: 8px;
        box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        padding: 25px;
    }
    
    h1 {
        color: #333;
        text-align: center;
        margin-bottom: 25px;
        font-size: 24px;
    }
    
    .form-group {
        margin-bottom: 20px;
    }
    
    label {
        display: block;
        margin-bottom: 8px;
        font-weight: 600;
        color: #333;
        font-size: 14px;
    }
    
    input[type="text"],
    input[type="password"],
    input[type="email"] {
        width: 100%;
        padding: 12px 15px;
        border: 1px solid #e0e0e0;
        border-radius: 4px;
        font-size: 14px;
        box-sizing: border-box;
        transition: border 0.3s;
    }
    
    input[type="text"]:focus,
    input[type="password"]:focus,
    input[type="email"]:focus {
        border-color: #fc8019;
        outline: none;
    }
    
    .btn {
        background-color: #fc8019;
        color: white;
        border: none;
        border-radius: 4px;
        padding: 14px;
        font-size: 16px;
        font-weight: 600;
        width: 100%;
        cursor: pointer;
        transition: background-color 0.3s;
    }
    
    .btn:hover {
        background-color: #e67317;
    }
    
    .login-link {
        text-align: center;
        margin-top: 20px;
        font-size: 14px;
    }
    
    .login-link a {
        color: #fc8019;
        text-decoration: none;
        font-weight: 600;
    }
    
    .login-link a:hover {
        text-decoration: underline;
    }

    .footer {
        background-color: #fc8019;
        padding: 20px 0;
        text-align: center;
        color: white;
        font-size: 14px;
    }
    
    .footer a {
        color: white;
        text-decoration: none;
    }
    
    .footer a:hover {
        text-decoration: underline;
    }
</style>
</head>
<body>
    <!-- Navbar -->
    <div class="header">
        <div class="logo">TASTE IT!</div>
    </div>
    
    <div class="navbar">
        <a href="#">Home</a>
        <a href="#">Menu</a>
        <a href="#">Offers</a>
        <a href="#">Contact</a>
        <a href="#">View Cart</a> <!-- Added View Cart Button -->
    </div>

    <!-- Registration Form -->
    <div class="container">
        <div class="card">
            <h1>Create your TASTE IT! account</h1>
            <form action="Register" onsubmit=" return validateForm()">
                <div class="form-group">
                    <label for="username">Full Name</label>
                    <input type="text" id="username" name="username" placeholder="Enter your full name" required>
                </div>
                
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" id="email" name="email" placeholder="Enter your email address" required>
                </div>
                
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" placeholder="Create a password" required>
                </div>
                
                <div class="form-group">
                    <label for="cpassword">Confirm Password</label>
                    <input type="password" id="cpassword" name="cpassword" placeholder="Re-enter your password" required>
                </div>
                
                <div class="form-group">
                    <label for="address">Delivery Address</label>
                    <input type="text" id="address" name="address" placeholder="Enter your delivery address" required>
                </div>
                
                <button type="submit" class="btn">Register</button>
                
                <div class="login-link">
                    Already have an account? <a href="login.jsp">Login</a>
                </div>
            </form>
        </div>
    </div>
    
    <script>
    
    function validateForm() {
        let username = document.getElementById("username").value.trim();
        let email = document.getElementById("email").value.trim();
        let password = document.getElementById("password").value;
        let cpassword = document.getElementById("cpassword").value;
        let address = document.getElementById("address").value.trim();

        // Username length check
        if (username.length < 3) {
            alert("Username must be more than 3 characters");
            return false;
        }

        // Email regex check
        let emailRegex = /^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$/;
        if (!emailRegex.test(email)) {
            alert("Enter a valid email address");
            return false;
        }

        // Address check
        if (address.length < 5) {
            alert("Please enter a proper address including your city");
            return false;
        }

        // Password length check
        if (password.length < 8) {
            alert("Password must be at least 8 characters");
            return false;
        }

        // Password match check
        if (password !== cpassword) {
            alert("Passwords do not match");
            return false;
        }

        return true; // ✅ All validations passed
    }
    
    
    </script>
    
    
    
    
    
    
    
    

    <!-- Footer -->
    <div class="footer">
        <p>By creating an account, you agree to TasteIt!'s <a href="#">Terms of Service</a> and <a href="#">Privacy Policy</a></p>
    </div>
</body>
</html>
