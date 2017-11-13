<%-- 
    Document   : index
    Created on : 2017. 11. 10, 오후 2:41:17
    Author     : korea
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">       
        <title>Moon's Bulletin Board Practice</title>
    </head>
    <body>
        <%
            session.invalidate(); //gets rid of the user session
        %>
        <script>
            location.href = 'main.jsp';
        </script>
            
    </body>
</html>
