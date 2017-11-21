<%-- 
    Document   : newjsp
    Created on : 17/11/2017, 21:10:13
    Author     : 11141100465
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        
        
        <%
           out.println(getServletContext().getRealPath("/")+"\\BancoImagens");
           
        %>
    </body>
</html>
