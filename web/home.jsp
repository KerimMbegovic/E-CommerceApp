<%-- 
    Document   : home
    Created on : 2021.11.12, 23:54:17
    Author     : Kerim
--%>

<%@page import="java.util.List"%>
<%@page import="Beans.Proizvod"%>
<%@page import="Utils.DB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% 
Proizvod pd = new Proizvod(DB.getConnection());
List<Proizvod> products = pd.dohvatiProizvode();

%>
<!DOCTYPE html>
<html>
    <head>
        <title>Home</title>
        <%@include file="head.jsp" %>
    </head>
    <body>
        <%@include file="navbar.jsp" %>
        
        <div class="container">
            <div class="card-header my-3">Svi proizvodi</div>
            <div class="row">
                <%
                    if(!products.isEmpty()) {
                        for(Proizvod p:products) {%>
                        <div class="col-md-3" style="margin-top: 10px" >
                    <div class="card w-100" style="width: 18rem;">
<!--                    <img class="card-img-top" src="..." alt="Card image cap">-->
                    <div class="card-body">
                      <h5 class="card-title"><%= p.getNaziv() %></h5>
                      <h6 class="cijena">Cijena: <%= p.getCijena() %> KM</h6>
                      <p class="card-text"><%= p.getOpis() %></p>
                      <c:if test="${user.role != 3 && user.role != 1}">
                      <a href="dodajUKorpu?id=<%= p.getId()%>" class="btn btn-primary">Dodaj u korpu</a>
                      </c:if>
                    </div>
                  </div>
                </div><%
                       }
                    }
                %>
            </div>
        </div>
    </body>
</html>
