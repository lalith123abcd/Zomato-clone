<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <style>
        /* Footer style */
        .footer {
            background-color: #fb6d00; /* Swiggy orange */
            color: white;
            padding: 30px 20px;
            margin-top: 40px;
            font-family: Arial, sans-serif;
        }
        .footer .footer-content {
            display: flex;
            justify-content: space-between;
            flex-wrap: wrap;
        }
        .footer .footer-content .footer-section {
            flex: 1;
            min-width: 200px;
            margin: 10px;
        }
        .footer .footer-content .footer-section h3 {
            color: white;
            font-size: 18px;
            margin-bottom: 15px;
        }
        .footer .footer-content .footer-section ul {
            list-style-type: none;
            padding: 0;
        }
        .footer .footer-content .footer-section ul li {
            margin: 10px 0;
        }
        .footer .footer-content .footer-section ul li a {
            color: white;
            text-decoration: none;
        }
        .footer .footer-content .footer-section ul li a:hover {
            text-decoration: underline;
        }
        .footer .footer-content .footer-social {
            display: flex;
            gap: 15px;
        }
        .footer .footer-content .footer-social a {
            color: white;
            font-size: 20px;
            text-decoration: none;
        }
        .footer .footer-bottom {
            text-align: center;
            font-size: 14px;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <!-- Footer Section -->
    <div class="footer">
        <div class="footer-content">
            <!-- Quick Links Section -->
            <div class="footer-section">
                <h3>Quick Links</h3>
                <ul>
                    <li><a href="#">About Us</a></li>
                    <li><a href="#">Contact Us</a></li>
                    <li><a href="#">FAQ</a></li>
                    <li><a href="#">Terms & Conditions</a></li>
                    <li><a href="#">Privacy Policy</a></li>
                </ul>
            </div>

            <!-- Services Section -->
            <div class="footer-section">
                <h3>Our Services</h3>
                <ul>
                    <li><a href="#">Food Delivery</a></li>
                    <li><a href="#">Restaurant Signup</a></li>
                    <li><a href="#">Become a Partner</a></li>
                    <li><a href="#">Offer Coupons</a></li>
                </ul>
            </div>

            <!-- Social Media Section -->
            <div class="footer-section">
                <h3>Follow Us</h3>
                <div class="footer-social">
                    <a href="#" target="_blank">&#xf09a; <!-- Facebook icon --></a>
                    <a href="#" target="_blank">&#xf099; <!-- Twitter icon --></a>
                    <a href="#" target="_blank">&#xf0d5; <!-- Instagram icon --></a>
                    <a href="#" target="_blank">&#xf16d; <!-- YouTube icon --></a>
                </div>
            </div>
        </div>
        
        <div class="footer-bottom">
            <p>&copy; 2025 Food Delivery, All Rights Reserved</p>
        </div>
    </div>
</body>
</html>
