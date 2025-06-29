<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="java.util.*" %>
<%@page import="com.food.model.Restaurant" %>
   <jsp:include page="header.jsp" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Restaurant List</title>
<style>
    :root {
        --swiggy-orange: #FC8019;
        --swiggy-dark: #282C3F;
        --swiggy-light: #93959F;
        --swiggy-bg: #F8F8F8;
        --swiggy-card-bg: #FFFFFF;
        --swiggy-green: #48C479;
        --swiggy-red: #DB7C38;
        --swiggy-blue: #5D8ED5;
        
        --indian-color: #FF6B6B;
        --chinese-color: #FF9E3F;
        --italian-color: #6BCB77;
        --mexican-color: #FFD93D;
        --american-color: #4D96FF;
        --thai-color: #9C51B6;
        --japanese-color: #FF6B6B;
        --mediterranean-color: #6BCB77;
    }
    
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }
    
    body {
        font-family: 'Basis Grotesque Pro', Arial, sans-serif;
        background-color: var(--swiggy-bg);
        color: var(--swiggy-dark);
        line-height: 1.6;
    }
    
    .container {
        max-width: 1200px;
        margin: 0 auto;
        padding: 20px;
    }
    
    /* Navbar Styles */
    .navbar {
        background-color: white;
        box-shadow: 0 1px 5px rgba(0,0,0,0.1);
        padding: 15px 0;
        position: sticky;
        top: 0;
        z-index: 100;
    }
    
    .nav-container {
        display: flex;
        justify-content: space-between;
        align-items: center;
        max-width: 1200px;
        margin: 0 auto;
        padding: 0 20px;
    }
    
    .logo {
        color: var(--swiggy-orange);
        font-size: 24px;
        font-weight: 700;
        text-decoration: none;
    }
    
    .nav-links {
        display: flex;
        gap: 15px;
    }
    
    .nav-link {
        padding: 8px 15px;
        border-radius: 20px;
        font-size: 14px;
        font-weight: 600;
        cursor: pointer;
        transition: all 0.3s ease;
    }
    
    .nav-link:hover {
        background-color: #FFF5EF;
        color: var(--swiggy-orange);
    }
    
    .nav-link.indian {
        background-color: #FFF0F0;
        color: var(--indian-color);
    }
    
    .nav-link.chinese {
        background-color: #FFF5E9;
        color: var(--chinese-color);
    }
    
    .nav-link.italian {
        background-color: #F0FFF1;
        color: var(--italian-color);
    }
    
    .nav-link.mexican {
        background-color: #FFFCEB;
        color: var(--mexican-color);
    }
    
    .nav-link.american {
        background-color: #F0F7FF;
        color: var(--american-color);
    }
    
  .user-greeting {
        font-size: 18px;
        color: var(--swiggy-dark);
        font-family: var(--swiggy-font);
        margin: 15px 0;
        padding: 10px;
    }

    .user-greeting span {
        color: var(--swiggy-orange);
        font-weight: 600;
        font-size: 20px;
    }    
    /* Page Content */
    .page-title {
        font-size: 32px;
        margin: 30px 0;
        color: var(--swiggy-dark);
        text-align: center;
        font-weight: 700;
    }
    
    .restaurant-grid {
    display: grid;
    grid-template-columns: repeat(3, 1fr); /* 3 columns of equal width */
    gap: 25px;
    margin-top: 20px;
}

/* Responsive adjustments */

    /* Restaurant Card Styles */
    .restaurant-card {
        background-color: var(--swiggy-card-bg);
        border-radius: 12px;
        overflow: hidden;
        box-shadow: 0 4px 8px rgba(0,0,0,0.04);
        transition: transform 0.3s ease, box-shadow 0.3s ease;
        position: relative;
    }
    
    .restaurant-card:hover {
        transform: translateY(-5px);
        box-shadow: 0 6px 16px rgba(0,0,0,0.1);
    }
    
    .card-image {
        width: 100%;
        height: 180px;
        object-fit: cover;
        border-radius: 12px 12px 0 0;
    }
    
    .card-content {
        padding: 15px;
    }
    
    .restaurant-name {
        font-size: 20px;
        font-weight: 700;
        margin-bottom: 10px;
        color: var(--swiggy-dark);
        font-family: 'Poppins', sans-serif;
        letter-spacing: -0.5px;
    }
    
    /* Cuisine Chip Styles */
    .cuisine-chip {
        display: inline-block;
        padding: 4px 12px;
        border-radius: 20px;
        font-size: 12px;
        font-weight: 600;
        margin-right: 8px;
        margin-bottom: 8px;
    }
    
    .cuisine-indian {
        background-color: #FFF0F0;
        color: var(--indian-color);
    }
    
    .cuisine-chinese {
        background-color: #FFF5E9;
        color: var(--chinese-color);
    }
    
    .cuisine-italian {
        background-color: #F0FFF1;
        color: var(--italian-color);
    }
    
    .cuisine-mexican {
        background-color: #FFFCEB;
        color: var(--mexican-color);
    }
    
    .cuisine-american {
        background-color: #F0F7FF;
        color: var(--american-color);
    }
    
    .cuisine-thai {
        background-color: #F8F0FF;
        color: var(--thai-color);
    }
    
    .cuisine-japanese {
        background-color: #FFF0F0;
        color: var(--japanese-color);
    }
    
    .cuisine-mediterranean {
        background-color: #F0FFF1;
        color: var(--mediterranean-color);
    }
    
    .card-details {
        display: flex;
        justify-content: space-between;
        font-size: 14px;
        margin-top: 12px;
        padding-top: 12px;
        border-top: 1px solid #f0f0f0;
    }
    
    .delivery-time {
        display: flex;
        align-items: center;
        color: var(--swiggy-dark);
    }
    
    .rating {
        display: flex;
        align-items: center;
        background-color: var(--swiggy-green);
        color: white;
        padding: 2px 8px;
        border-radius: 4px;
        font-weight: 600;
        font-size: 13px;
    }
    
    .rating i {
        font-size: 10px;
        margin-left: 3px;
    }
    
    /* Enhanced Status Styles */
    .status-badge {
        position: absolute;
        top: 15px;
        right: 15px;
        padding: 6px 12px;
        border-radius: 20px;
        font-size: 12px;
        font-weight: 700;
        text-transform: uppercase;
        letter-spacing: 0.5px;
        box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        z-index: 2;
    }
    
    .status-active {
        background-color: rgba(72, 196, 121, 0.9);
        color: white;
        animation: pulse 2s infinite;
    }
    
    .status-inactive {
        background-color: rgba(219, 124, 56, 0.9);
        color: white;
    }
    
    .status-other {
        background-color: rgba(93, 142, 213, 0.9);
        color: white;
    }
    
    /* Pulsing animation for active restaurants */
    @keyframes pulse {
        0% {
            box-shadow: 0 0 0 0 rgba(72, 196, 121, 0.7);
        }
        70% {
            box-shadow: 0 0 0 8px rgba(72, 196, 121, 0);
        }
        100% {
            box-shadow: 0 0 0 0 rgba(72, 196, 121, 0);
        }
    }
    
    /* Ribbon style for inactive restaurants */
    .ribbon {
        width: 150px;
        height: 150px;
        overflow: hidden;
        position: absolute;
        top: -10px;
        right: -10px;
        z-index: 1;
    }
    
    .ribbon::before,
    .ribbon::after {
        position: absolute;
        z-index: -1;
        content: '';
        display: block;
        border: 5px solid #DB7C38;
        border-top-color: transparent;
        border-right-color: transparent;
    }
    
    .ribbon::before {
        top: 0;
        left: 0;
    }
    
    .ribbon::after {
        bottom: 0;
        right: 0;
    }
    
    .ribbon span {
        position: absolute;
        display: block;
        width: 225px;
        padding: 8px 0;
        background-color: var(--swiggy-red);
        box-shadow: 0 5px 10px rgba(0,0,0,.1);
        color: #fff;
        font-size: 12px;
        font-weight: 700;
        text-transform: uppercase;
        text-align: center;
        right: -25px;
        top: 30px;
        transform: rotate(45deg);
    }
    
    .button-container {
        text-align: center;
        margin: 40px 0;
    }
    
    .swiggy-button {
        background-color: var(--swiggy-orange);
        color: white;
        border: none;
        padding: 12px 24px;
        border-radius: 6px;
        cursor: pointer;
        font-size: 16px;
        font-weight: 600;
        transition: background-color 0.3s ease;
    }
    
    .swiggy-button:hover {
        background-color: #E67A1A;
    }
    
    .no-image {
        height: 180px;
        background-color: #f5f5f5;
        display: flex;
        align-items: center;
        justify-content: center;
        color: var(--swiggy-light);
        font-size: 14px;
    }
    
    /* View Menu Button Styles */
.view-menu {
    margin-top: 15px;
}

.menu-button {
    display: inline-block;
    background-color: var(--swiggy-orange);
    color: white;
    border: none;
    padding: 10px 16px;
    border-radius: 6px;
    font-size: 14px;
    font-weight: 600;
    text-decoration: none;
    transition: all 0.3s ease;
    width: 100%;
    text-align: center;
    box-shadow: 0 2px 5px rgba(252, 128, 25, 0.3);
    position: relative;
    overflow: hidden;
}

.menu-button:hover {
    background-color: #E67A1A;
    box-shadow: 0 4px 8px rgba(252, 128, 25, 0.3);
    transform: translateY(-1px);
}

.menu-button:active {
    transform: translateY(0);
}

/* Optional: Add a subtle animation effect */
.menu-button::after {
    content: "";
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: linear-gradient(90deg, transparent, rgba(255,255,255,0.2), transparent);
    transform: translateX(-100%);
    transition: transform 0.3s ease;
}

.menu-button:hover::after {
    transform: translateX(100%);
}

/* For inactive restaurants, make the button look disabled */
.restaurant-card.inactive .menu-button {
    background-color: #cccccc;
    color: #666666;
    cursor: not-allowed;
    box-shadow: none;
}

.restaurant-card.inactive .menu-button:hover {
    background-color: #cccccc;
    transform: none;
}
</style>
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@600;700&display=swap" rel="stylesheet">
</head>
<body>

<div class="navbar">
    <div class="nav-container">
        <a href="#" class="logo"></a>
        <div class="nav-links">
            <div class="nav-link indian">Indian</div>
            <div class="nav-link chinese">Chinese</div>
            <div class="nav-link italian">Italian</div>
            <div class="nav-link mexican">Mexican</div>
            <div class="nav-link american">American</div>
        </div>
        <div class="user-greeting"> 👋 Hi foodie</div>
    </div>
</div>


<div class="container">
    <h1 class="page-title">Discover Amazing Restaurants</h1>
    
    <% List<Restaurant> rList=(List<Restaurant>)session.getAttribute("restaurantList"); %>
   
    
    <div class="restaurant-grid">
    
    
        <% for(Restaurant r: rList) { 
            String statusClass = "status-other";
            String statusText = r.getIsactive(); // Assuming this returns a String
            if (statusText != null) {
                if (statusText.equalsIgnoreCase("active")) {
                    statusClass = "status-active";
                } else if (statusText.equalsIgnoreCase("inactive")) {
                    statusClass = "status-inactive";
                }
            }
          
            
            // Determine image based on cuisine type or use the imagepath from the model
            String imageUrl = r.getImagepath();
            if (imageUrl == null || imageUrl.isEmpty()) {
                // Fallback to cuisine-specific placeholder images
                  String restaurantName = r.getName() != null ? r.getName().toLowerCase() : "";
                
                  String context = request.getContextPath();
                  if (restaurantName.contains("crunch")) {
                      imageUrl = "images/crunch.jpg";
                  } 
                  else if (restaurantName.contains("unlimited")) {
                      imageUrl = "images/bbq2.jpg";  // Assuming "unlimited" refers to BBQ
                  }
                  else if (restaurantName.contains("burgerking")) {  // Lowercase check
                      imageUrl = "images/burger.jpg";  // Matches "bk.jpg"
                  }
                  else if (restaurantName.contains("pizza hut")) {
                      imageUrl = "images/ph.jpg";  // Matches "ph.jpg"
                  }
                  else if (restaurantName.contains("sushi")) {
                      imageUrl = "images/sp.jpg";  // Assuming "Sushi Palace" uses "sp.jpg"
                  }
                  else if (restaurantName.contains("taco")) {
                      imageUrl = "images/taco.jpg";
                  }
                else if (restaurantName.contains("curry")) {
                    imageUrl = "images/curry.jpg";
                }
                else if (restaurantName.contains("noodle")) {
                    imageUrl = "images/np.jpg";
                }
                else if (restaurantName.contains("steak")) {
                    imageUrl = "images/sh.jpg";
                }
                else if (restaurantName.contains("veggie")) {
                    imageUrl = "images/veggie.jpg";
                }
                else if (restaurantName.contains("seafood")) {
                    imageUrl = "images/sea.jpg";
                }
                else if (restaurantName.contains("deli")) {
                    imageUrl = "images/deli.jpg";
                }
                else {
                    // Default image
                    imageUrl ="images/download.jpg";
            }
            }
            // Determine cuisine chip class
            String cuisineClass = "cuisine-other";
            String cuisine = r.getCuisinetype() != null ? r.getCuisinetype().toLowerCase() : "";
            if (cuisine.contains("indian")) {
                cuisineClass = "cuisine-indian";
            } else if (cuisine.contains("chinese")) {
                cuisineClass = "cuisine-chinese";
            } else if (cuisine.contains("italian")) {
                cuisineClass = "cuisine-italian";
            } else if (cuisine.contains("mexican")) {
                cuisineClass = "cuisine-mexican";
            } else if (cuisine.contains("american")) {
                cuisineClass = "cuisine-american";
            } else if (cuisine.contains("thai")) {
                cuisineClass = "cuisine-thai";
            } else if (cuisine.contains("japanese")) {
                cuisineClass = "cuisine-japanese";
            } else if (cuisine.contains("mediterranean")) {
                cuisineClass = "cuisine-mediterranean";
            }
            
        %>
        
                    <div class="restaurant-card">
                    
                      <a href="menu?restaurantId=<%=r.getRestaurantid()%>">
                <% if (statusText != null && statusText.equalsIgnoreCase("inactive")) { %>
                    <div class="ribbon"><span>Currently Closed</span></div>
                <% } %>
                
                <div class="status-badge <%= statusClass %>">
                    <%= statusText %>
                </div>
                
                <img src="<%= imageUrl %>" alt="<%= r.getName() %>" class="card-image">
                
                <div class="card-content">
                    <h3 class="restaurant-name"><%= r.getName() %></h3>
                    <div class="cuisine-chip <%=cuisineClass  %>">
                        <%= r.getCuisinetype() %>
                    </div>
                    
                    <div class="card-details">
                        <div class="delivery-time">⏱️ <%= r.getDeliverytime() %> min</div>
                        <div class="rating">
                            <%= r.getRatings() %> <i>★</i>
                        </div>
                    </div>
                    </a>
                    
                 <div class="view-menu">
          
        </div>
                   	
                   	
                </div>
            </div>
        <% } %>
    </div>
    
    <div class="button-container">
        <a href="NextPage"><button class="swiggy-button">Explore More Restaurants</button></a>
    </div>
</div>
<jsp:include page="/footer.jsp" />
</body>
</html>