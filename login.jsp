<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Swiggy - Login</title>
<style>
    body {
        margin: 0;
        padding: 0;
        font-family: 'Poppins', Arial, sans-serif;
        background-color: #f8f8f8;
    }
    
   .swiggy-container {
    display: flex;
    height: 100vh;
    overflow: hidden; /* Prevent any scrollbars from appearing */
}

.swiggy-left {
    flex: 1;
    background-color: #fc8019;
    position: relative;
    overflow: hidden;
}

.food-image {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    object-fit: cover;
    object-position: center;
}

    .swiggy-right {
        flex: 1;
        display: flex;
        justify-content: center;
        align-items: center;
        background-color: #f8f8f8;
    }
    
    .login-form {
        width: 350px;
        padding: 30px;
        background: white;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }
    
    .form-title {
        color: #fc8019;
        text-align: center;
        margin-bottom: 30px;
        font-size: 24px;
        font-weight: 600;
    }
    
    .input-group {
        margin-bottom: 20px;
    }
    
    .input-group label {
        display: block;
        margin-bottom: 8px;
        color: #333;
        font-size: 14px;
        font-weight: 500;
    }
    
    .input-group input {
        width: 100%;
        padding: 12px 15px;
        border: 1px solid #ddd;
        border-radius: 4px;
        font-size: 14px;
        box-sizing: border-box;
    }
    
    .input-group input:focus {
        outline: none;
        border-color: #fc8019;
    }
    
    .login-btn {
        width: 100%;
        padding: 12px;
        background-color: #fc8019;
        color: white;
        border: none;
        border-radius: 4px;
        font-size: 16px;
        font-weight: 600;
        cursor: pointer;
        margin-top: 10px;
        transition: background-color 0.3s;
    }
    
    .login-btn:hover {
        background-color: #e67317;
    }
    
    .signup-link {
        text-align: center;
        margin-top: 20px;
        font-size: 14px;
    }
    
    .signup-link a {
        color: #fc8019;
        text-decoration: none;
        font-weight: 500;
    }
    
    .signup-link a:hover {
        text-decoration: underline;
    }
</style>
</head>
<body>
<div class="swiggy-container">
    <div class="swiggy-left">
        <img src="images/download.jpg" 
             alt="Delicious food" 
             class="food-image">
    </div>
    <div class="swiggy-right">
        <div class="login-form">
            <div class="form-title">Login to TASTE IT!</div>
            <form action="Login">
                <div class="input-group">
                    <label for="email">Email</label>
                    <input type="text" id="email" name="email" placeholder="Enter your email" required>
                </div>
                <div class="input-group">
                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" placeholder="Enter your password" required>
                </div>
                <button type="submit" class="login-btn">Login</button>
            </form>
            <div class="signup-link">
                New to TASTE IT! ? <a href="register.jsp">Create an account</a>
            </div>
        </div>
    </div>
</div>
</body>
</html>