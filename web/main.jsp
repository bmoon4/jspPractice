<%-- 
    Document   : index
    Created on : 2017. 11. 10, 오후 2:41:17
    Author     : korea
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name ="viewport" content ="width=device-width", initial-scale="1">
        <link rel="stylesheet" href="css/bootstrap.css"/>
        <link rel="stylesheet" href="css/custom.css"/>
        <title>Moon's Bulletin Board Practice</title>
    </head>
    <body>
        <%
            String userID = null;
            if (session.getAttribute("userID") != null){
                userID = (String) session.getAttribute("userID");
            }
        
        %>    
        
        
        <nav class="navbar navbar-default">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed"
                        data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
                        aria-expanded="false">
                    <span class="icon-bar"></span>   
                    <span class="icon-bar"></span>  
                    <span class="icon-bar"></span>  
                </button>
                <a class="navbar-brand" href="main.jsp">BBS Website</a>
            </div>
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li class = "active"><a href="main.jsp">Main</a></li>
                    <li><a href="bbs.jsp">Bulletin Board</a></li>
                </ul>
                
                <%
                    if (userID == null){
                %>
                <ul class="nav navbar-nav navbar-right">
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle"
                           data-toggle="dropdown" role="button" aria-haspopup="true"
                           aria-expanded="false"> Connect<span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="login.jsp">Sign in</a></li>
                            <li><a href="join.jsp">Sign up</a></li>
                        </ul>
                    </li>
                </ul>
                <%
                    }
                    else {
                %>
                 <ul class="nav navbar-nav navbar-right">
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle"
                           data-toggle="dropdown" role="button" aria-haspopup="true"
                           aria-expanded="false"> Personal Info<span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="logoutAction.jsp">Logout</a></li>
                        </ul>
                    </li>
                </ul>
                <%
                    }
                %>
                
                
            </div>
        </nav>
                
        <div class="container">
            <div class="jumbotron">
                <div class="container">
                    <h1>Hello World</h1>
                    <h3>Hi! I am Bokyung Moon:) </h3>
                     <p>I'm a student of Seneca College studying Computer Programming.</p>
                     <p>This website is only for my JSP & Bootstrap practice! </p>
                     <a class= "btn btn-primary btn-pull" href="https://github.com/bmoon4" role="button">Github</a>
                     <a class= "btn btn-primary btn-pull" href="https://www.linkedin.com/in/bokyung-moon-2b7b94149/" role="button">LinkedIn</a> 
                </div>
            </div>            
        </div> 
        <div class="container">
            <div id="myCarousel" class="carousel slide" data-ride ="carousel">
                <ol class="carousel-indicators">
                    <li data-target="#myCarousel" data-slide-to = "0" class="active"></li>
                    <li data-target="#myCarousel" data-slide-to = "1"></li>
                    <li data-target="#myCarousel" data-slide-to = "2"></li>
                </ol>
                <div class="carousel-inner">
                    <div class="item active">
                        <img src="images/Penguins.jpg" class="img-responsive center-block">
                    </div>
                    <div class="item">
                        <img src="images/Lighthouse.jpg" class="img-responsive center-block">
                    </div>
                    <div class="item">
                        <img src="images/Koala.jpg" class="img-responsive center-block">
                    </div>
                </div>
                <a class="left carousel-control" href="#myCarousel" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left"></span>
                </a>
                  <a class="right carousel-control" href="#myCarousel" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right"></span>
                </a>
            </div>            
        </div>        
                
        <script src="https://code.jquery.com/jquery-3.1.1.min.js"> </script>
        <script src="js/bootstrap.js"> </script>
    </body>
</html>
