<%-- 
    Document   : index
    Created on : 2017. 11. 10, 오후 2:41:17
    Author     : korea
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="bbs.BbsDAO" %>
<%@page import="bbs.Bbs" %>
<%@page import="java.io.PrintWriter" %>

<% request.setCharacterEncoding("utf-8"); %>


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
        
        if (userID == null){ // if the user doesn't have a session..
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('Please, sign in first!')");
            script.println("location.href = 'login.jsp'");
            script.println("</script>");
        } 
        
        int bbsID = 0;
            
        if (request.getParameter("bbsID") != null){
            bbsID = Integer.parseInt(request.getParameter("bbsID"));
        }
            
        if (bbsID == 0){
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('Invalid request')");
            script.println("location.href = 'bbs.jsp'");
            script.println("</script>");
        }
        
        Bbs bbs = new BbsDAO().getBbs(bbsID);
        if (!userID.equals(bbs.getUserID())){
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('Unauthorized request')");
            script.println("location.href = 'bbs.jsp'");
            script.println("</script>");
        }
        else{
            BbsDAO bbsDAO = new BbsDAO();
            int result = bbsDAO.delete(bbsID); 
            if (result == -1){
                PrintWriter script = response.getWriter();
                script.println("<script>");
                script.println("alert('Delete Failed')");
                script.println("history.back()");
                script.println("</script>");
            }
            else {
                PrintWriter script = response.getWriter();
                script.println("<script>");
                script.println("location.href = 'bbs.jsp'");
                script.println("</script>");
            }
        } 
       
        %>
    </body>
</html>
