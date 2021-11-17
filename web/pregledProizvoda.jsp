<%-- 
    Document   : pregledProizvoda
    Created on : 2021.11.14, 00:22:34
    Author     : Kerim
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<style>
    @import url("https://fonts.googleapis.com/css?family=Montserrat");

.pricing-table{
  background-color: #eee;
  font-family: 'Montserrat', sans-serif;
}

.pricing-table .heading {
  text-align: center;
  padding-bottom: 10px;
  border-bottom: 1px solid rgba(0, 0, 0, 0.1); 
}

.pricing-table .item {
  background-color: #ffffff;
  box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.075);
  border-top: 2px solid #5ea4f3;
  padding: 30px;
  overflow: hidden;
  position: relative; 
}

.pricing-table .col-md-5:not(:last-child) .item {
  margin-bottom: 30px; 
}

.pricing-table .item button {
  font-weight: 600; 
}

.pricing-table .ribbon {
  width: 160px;
  height: 32px;
  font-size: 12px;
  text-align: center;
  color: #fff;
  font-weight: bold;
  box-shadow: 0px 2px 3px rgba(136, 136, 136, 0.25);
  background: #4dbe3b;
  transform: rotate(45deg);
  position: absolute;
  right: -42px;
  top: 20px;
  padding-top: 7px; 
}

.pricing-table .item p {
  text-align: center;
  margin-top: 20px;
  opacity: 0.7; 
}

.pricing-table .features .feature {
  font-weight: 600; }

.pricing-table .features h4 {
  text-align: center;
  font-size: 18px;
  padding: 5px; 
}

.pricing-table .price h4 {
  margin: 15px 0;
  font-size: 45px;
  text-align: center;
  color: #2288f9; 
}

.pricing-table .buy-now button {
  text-align: center;
  margin: auto;
  font-weight: 600;
  padding: 9px 0; 
}

</style>

<html>

<head>
    <title>Korpa</title>
    <%@include file="head.jsp" %>
</head>

    <%@include file="navbar.jsp" %>

    <form action="dohvatiProizvode" method="GET">
    <button type="submit" class="btn btn-block create-account">Dohvati proizvode</button>
    </form>
    
    <section class="pricing-table">
        <c:forEach items="${items}" var="pr">
        <div class="container">
           
            <div class="row justify-content-md-center">
                <div class="col-md-5 col-lg-4">
                    <div class="item">
                        <div class="heading">
                            <h3 name="naziv">${pr.getNaziv()}</h3>
                        </div>
                        <p name="opis">${pr.getOpis()}</p>
                       
                        <div class="price">
                            <h4 name="cijena">${pr.getCijena()} KM</h4>
                        </div>
                        <a href="dodajUKorpu?id=${pr.getId()}" class="btn btn-block btn-outline-primary" >Kupi</a>
                    </div>
                </div>
            </div>
        </div>
                         </c:forEach>
    </section>


</html>