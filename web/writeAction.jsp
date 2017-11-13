<%-- 
    Document   : index
    Created on : 2017. 11. 10, 오후 2:41:17
    Author     : korea
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="bbs.BbsDAO" %>
<%@page import="java.io.PrintWriter" %>

<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="bbs" class="bbs.Bbs" scope="page"/>
<jsp:setProperty name ="bbs" property="bbsTitle" /> <!--bbs.setBbsTitle(request.getParameter("bbsTitle")) -->
<jsp:setProperty name ="bbs" property="bbsContent" /> <!--bbs.setBbsContent(request.getParameter("bbsContent")) -->


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
        else{
            if (bbs.getBbsTitle() == null || bbs.getBbsContent() == null){
            
                PrintWriter script = response.getWriter();
                script.println("<script>");
                script.println("alert('Please, try again')");
                script.println("history.back()");
                script.println("</script>");   
            } 
            else{
                BbsDAO bbsDAO = new BbsDAO();
                int result = bbsDAO.write(bbs.getBbsTitle(), userID, bbs.getBbsContent()); 
                if (result == -1){
                    PrintWriter script = response.getWriter();
                    script.println("<script>");
                    script.println("alert('Upload Failed')");
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
        }
       
        %>
    </body>
</html>
