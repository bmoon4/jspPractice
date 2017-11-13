<%-- 
    Document   : index
    Created on : 2017. 11. 10, 오후 2:41:17
    Author     : korea
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="user.UserDAO" %>
<%@page import="java.io.PrintWriter" %>

<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id ="user" class ="user.User" scope="page"/>

<jsp:setProperty name ="user" property="userID" />       <!--user.setUserID(request.getParameter("userID")) -->
<jsp:setProperty name ="user" property="userPassword" /> <!--user.setUserPassword(request.getParameter("userPassword")) -->
<jsp:setProperty name ="user" property="userName" />     <!--user.setUserName(request.getParameter("userName")) -->
<jsp:setProperty name ="user" property="userGender" />   <!--user.setUserGender(request.getParameter("userGender")) -->
<jsp:setProperty name ="user" property="userEmail" />    <!--user.setUserEmail(request.getParameter("userEmail")) -->
<!-- jsp:setProperty name = "user" property="*"/ --> 

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">       
        <title>Moon's Bulletin Board Practice</title>
    </head>
    <body>
        <%
        String userID = null;
        if (session.getAttribute("userID") != null){
            userID = (String)session.getAttribute("userID");
        }
        
        if (userID != null){
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('already signed in')");
            script.println("location.href = 'main.jsp'");
            script.println("</script>");
        }
        if (user.getUserID() == null || user.getUserPassword() == null || user.getUserName() == null || 
            user.getUserGender() == null || user.getUserEmail() == null){
            
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('Please, enter your all infomation')");
            script.println("history.back()");
            script.println("</script>");   
        } 
        else{
            UserDAO userDAO = new UserDAO();
            int result = userDAO.join(user); 
            if (result == -1){
                PrintWriter script = response.getWriter();
                script.println("<script>");
                script.println("alert('ID already exist')");
                script.println("history.back()");
                script.println("</script>");
            }
            else {
                session.setAttribute("userID", user.getUserID());
                PrintWriter script = response.getWriter();
                script.println("<script>");
                script.println("location.href = 'main.jsp'");
                script.println("</script>");
            }
        }
        %>
    </body>
</html>
