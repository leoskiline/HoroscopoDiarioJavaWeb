<%-- 
    Document   : horoscopo
    Created on : 16/09/2020, 22:43:57
    Author     : Leonardo
--%>

<%@page import="java.time.LocalDate"%>
<%@page import="java.util.Date"%>
<%@page import="util.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!
    String email = "";
    String senha = "";
    LocalDate dataNasc = LocalDate.now();
    String mensagem = "";
    Usuario usuario;
    public boolean validarEmail(String email,String senha)
    {
        String senhainvertida = "";
        senhainvertida = email;
        senhainvertida = senhainvertida.substring(0, senhainvertida.indexOf("@"));
        senhainvertida = new StringBuilder(senhainvertida).reverse().toString();
        return email.contains("@") && email.length() > 4 && senha.equals(senhainvertida);
    }
%>

<%
    if(request.getParameter("dataNasc").length() > 0)
    {
         try{
            email = usuario.getEmail();
            senha = usuario.getSenha();
            dataNasc = LocalDate.parse(request.getParameter("dataNasc"));
            usuario.setDataNasc(dataNasc);
            mensagem = "Data Escolhida: "+dataNasc.toString();
         }catch(Exception e)
         {
             
         }
    }
    else
    {
        try{
            email = request.getParameter("email");
            senha = request.getParameter("senha");
            usuario = new Usuario(email,senha);
         }catch(Exception e)
         {
             
         }  
    }
    
    if(email.length() > 0 && senha.length() > 0)
    {
            if(validarEmail(email,senha))
            {
              HttpSession sessao = request.getSession(true);
              sessao.setAttribute("usuario", usuario);
            }
            else
              response.sendRedirect(".");
    }
    else
        response.sendRedirect(".");

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container-xl p-3 my-3 bg-primary text-white">
            <h1 style="text-align: center;">Horoscopo do dia</h1>
            <p></p>
        </div>
        <div class="container p-3 my-3 border">
            <form action="horoscopo.jsp" method="GET">
                <div class="form-group">
                    <label for="dataNasc">Informe a Data de Nascimento:</label>
                     <input type="date" class="form-control" id="date" required name="dataNasc">
                </div>
                <button type="submit" data-toggle="tooltip" data-placement="right" title="Consultar Horoscopo Diario" class="btn btn-primary">Consultar</button>
        </form>
            <%=mensagem%>
        </div>      
        <div class="container p-3 my-3 bg-primary text-white">
            <b>Membros do Grupo:</b><a href="Logout" type="button" style="float:right;" class="btn btn-danger">Logout</a>
            <br>
            Nome: Leonardo Custodio dos Santos RA: 0261810790
        </div>
        
    </body>
    

</html>
