<%-- 
    Document   : horoscopo
    Created on : 16/09/2020, 22:43:57
    Author     : Leonardo
--%>

<%@page import="util.Signo"%>
<%@page import="java.util.Locale"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.io.RandomAccessFile"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.Date"%>
<%@page import="util.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!
    String email = "";
    String senha = "";
    LocalDate dataNasc = LocalDate.now();
    String html = "";
    String signoslinha[];
    String signosquebrado[];
    String todossignos[];
    String imgsignos[];
    String horoscopo_diario[];
    Usuario usuario;
    Locale l = new Locale("pt","BR");
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
            signoslinha = new String[12];
            signosquebrado = new String[3];
            todossignos = new String[12];
            imgsignos = new String[12];
            horoscopo_diario = new String[12];
            request.getServletContext().getRealPath("");
            RandomAccessFile arq = new RandomAccessFile(request.getServletContext().getRealPath("")+"horoscopo.txt","r");
            ArrayList<String> linhas = new ArrayList();
            String linha = arq.readLine();
            linhas.add(linha);
            int i = 0,j=0;
            while(linha != null && i < 12)
            {
                signoslinha = linha.split("\n");
                signosquebrado = signoslinha[0].split("#");
                todossignos[i] = signosquebrado[0];
                imgsignos[i] = signosquebrado[1];
                horoscopo_diario[i] = signosquebrado[2];
                linha = arq.readLine();
                linhas.add(linha);
                i++;
            }
            int k = 0;
            
            arq.close();
         }catch(Exception e)
         {
             
         }
         int indice = 0;
         Signo s = new Signo(dataNasc.getDayOfMonth(),dataNasc.getMonthValue());
         html = "<div class='container p-3 my-3 border'><br><br><img style='float:right' src='imagens/"+imgsignos[s.getIdSigno()]+"' alt='Signo de "+todossignos[s.getIdSigno()]+"' >"
                 + "<h1 style='text-align:center;color: #1E90FF'> Horoscopo Diario </h1><br>"+"<p>"+horoscopo_diario[s.getIdSigno()]+"</p></div>";
    }
    else
    {
        try{
            email = request.getParameter("email");
            senha = request.getParameter("senha");
            usuario = new Usuario(email,senha);
            html = "";
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
            <%=html%>
        </div>      
        <div class="container p-3 my-3 bg-primary text-white">
            <b>Membros do Grupo:</b><a href="Logout" type="button" style="float:right;" class="btn btn-danger">Logout</a>
            <br>
            Nome: Leonardo Custodio dos Santos RA: 0261810790
        </div>
        
    </body>
    

</html>
