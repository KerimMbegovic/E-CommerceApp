<%-- 
    Document   : orders
    Created on : 2021.11.15, 15:13:40
    Author     : Kerim
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Beans.Proizvod"%>
<%@page import="java.util.List"%>
<%@page import="Beans.NarudzbaModel"%>
<%@page import="Beans.Narudzbe"%>
<%@page import="Utils.DB"%>
<%@page import="Beans.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>




<!DOCTYPE html>
<html>
    <head>
        <title>Orders</title>
        <%@include file="head.jsp" %>
    </head>
    <body>
    <%@include file="navbar.jsp" %>
    
    <c:if test="${user.role == 1}">
    <%
        
    Narudzbe n = new Narudzbe(DB.getConnection());
    List<NarudzbaModel> nAdmin = n.sveNarudzbe();
    
    %>
        <div class="container">
            <div class="card-header my-3">Sve narudzbe</div>
            <table class="table table-light">
                <thead>
                    <tr>
                        <th scope="col">Proizvodi</th>
                        <th scope="col">Datum narudzbe</th>
                        <th scope="col">Total</th>
                        <th scope="col">Status</th>
                        <th scope="col">User ID</th>
                    </tr>
                </thead>
                <tbody>
                    
                <% if(!nAdmin.isEmpty()) {
                    
                    for(NarudzbaModel na:nAdmin){%>
                        <tr>
                            
                            <td><%=na.getProizvodi() %></td>
                            <td><%=na.getDate() %></td>
                            <td><%=na.getTotal_cijena() %> KM</td>
                            
                            <% if(na.getStatus() == 0) {%>
                            <td style="color:blue;">Napravljena</td><% } %>
                            
                            <% if(na.getStatus() == 1) {%>
                            <td style="color:green;">Odobrena</td><% } %>
                            
                            <% if(na.getStatus() == 2) {%>
                            <td style="color:red;">Poništena</td><% } %>
                            
                            <td><%=na.getUser_id() %></td>
                            <td>
                                <% if(na.getStatus() == 0) { %>
                                <a class = "btn btn-sm btn-success" href="OdobriNarudzbu?id=<%= na.getNarudzbaID() %>">Potvrdi</a>
                                <a class = "btn btn-sm btn-danger" href="PonistiNarudzbu?id=<%= na.getNarudzbaID() %>">Odbij</a>
                                <% } %>
                            </td>
                        </tr>
                    <%}
                    }
                    %>
                </tbody>
            </table>
        </div>
    </c:if>
    
    <c:if test="${user.role == 2}">
    <%
    
    DecimalFormat dcf = new DecimalFormat("#.##");
    request.setAttribute("dcf", dcf);

    User user = (User) request.getSession().getAttribute("user");
    List<NarudzbaModel> nKorisnik = null;

    if(user != null) {
        request.setAttribute("user", user);
        nKorisnik = new Narudzbe(DB.getConnection()).userNarudzbe(user.getId());
    }

    ArrayList<Proizvod> korpa_list = (ArrayList<Proizvod>) session.getAttribute("korpa-list");
    if(korpa_list != null) {
        request.setAttribute("korpa_list", korpa_list);
    }
    


%>
        <div class="container">
            <div class="card-header my-3">Sve narudzbe</div>
            <table class="table table-light">
                <thead>
                    <tr>
                        <th scope="col">Proizvodi</th>
                        <th scope="col">Datum narudzbe</th>
                        <th scope="col">Total</th>
                        <th scope="col">Status</th>
                        <th scope="col">User ID</th>
                    </tr>
                </thead>
                <tbody>
                    
                <% if(!nKorisnik.isEmpty()) {
                    
                    for(NarudzbaModel na:nKorisnik){%>
                        <tr>
                            
                            <td><%=na.getProizvodi() %></td>
                            <td><%=na.getDate() %></td>
                            <td><%=na.getTotal_cijena() %> KM</td>
                            
                            <% if(na.getStatus() == 0) {%>
                            <td style="color:blue;">Napravljena</td><% } %>
                            
                            <% if(na.getStatus() == 1) {%>
                            <td style="color:green;">Odobrena</td><% } %>
                            
                            <% if(na.getStatus() == 2) {%>
                            <td style="color:red;">Poništena</td><% } %>
                            
                            <td><%=na.getUser_id() %></td>
                        </tr>
                    <%}
                    }
                    %>
                </tbody>
            </table>
        </div>
    </c:if>
    </body>
</html>
