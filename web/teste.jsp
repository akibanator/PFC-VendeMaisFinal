<%-- 
    Document   : teste
    Created on : 29/03/2017, 09:55:00
    Author     : Celina Mayumi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

    </head>
<body>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    
    <input type="text" id="titular" class="titular" name="titular" nome="nome">
    <input type="text" id="nome" name="nome" readonly="">

    <script type="text/javascript">
            $(document).ready(function(){
        $(".titular").on("input", function(){
            var textoDigitado = $(this).val();
            var inputCusto = $(this).attr("nome");
            $("#"+ inputCusto).val(textoDigitado);
        });
    });
    </script>

</body>
</html>
