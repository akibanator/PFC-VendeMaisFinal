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
<input type="text" id="valor1" class="valor" name="valor1" custo="custo1">
    <input type="text" id="custo1" name="custo1">

    <input type="text" id="valor2" class="valor" name="valor2" custo="custo2"><br>
    <input type="text" id="custo2" name="custo2">
    <script type="text/javascript">
            $(document).ready(function(){
        $(".valor").on("input", function(){
            var textoDigitado = $(this).val();
            var inputCusto = $(this).attr("custo");
            $("#"+ inputCusto).val(textoDigitado);
        });
    });
    </script>

</body>
</html>
