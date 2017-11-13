<%-- 
    Document   : index
    Created on : 2017. 11. 10, 오후 2:41:17
    Author     : korea
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="user.UserDAO" %>
<%@page import="java.io.PrintWriter" %>

<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="user" class="user.User" scope="page"/>
<jsp:setProperty name ="user" property="userID" /> <!--user.setUserID(request.getParameter("userID")) -->
<jsp:setProperty name ="user" property="userPassword" /><!--user.setUserPassword(request.getParameter("userPassword")) -->

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
        
        if (userID != null){ //user session is already exists
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('already signed in')");
            script.println("location.href = 'main.jsp'");
            script.println("</script>");
        }
        
        UserDAO userDAO = new UserDAO();
        int result = userDAO.login(user.getUserID(), user.getUserPassword());
    
        if (result == 1){
            session.setAttribute("userID", user.getUserID()); // give a session when the user login successed!
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("location.href = 'main.jsp'");
            script.println("</script>");
        }
        else if (result == 0){
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('wrong password!')");
            script.println("history.back()");
            script.println("</script>");
        }
        else if (result == -1){
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('ID doesn't exist!')");
            script.println("history.back()");
            script.println("</script>");   
        }
        else if (result == -2){
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('Database error')");
            script.println("history.back()");
            script.println("</script>"); 
        }
        %>
    </body>
</html>
