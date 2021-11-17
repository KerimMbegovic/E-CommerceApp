<%-- 
    Document   : korpa
    Created on : 2021.11.14, 16:21:52
    Author     : Kerim
--%>
<%@page import="Utils.DB"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Beans.Proizvod"%>
<style>
    .payment-form{
	padding-bottom: 50px;
	font-family: 'Montserrat', sans-serif;
}

.payment-form.dark{
	background-color: #f6f6f6;
}

.payment-form .content{
	box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.075);
	background-color: white;
}

.payment-form .block-heading{
    padding-top: 50px;
    margin-bottom: 40px;
    text-align: center;
}

.payment-form .block-heading p{
	text-align: center;
	max-width: 420px;
	margin: auto;
	opacity:0.7;
}

.payment-form.dark .block-heading p{
	opacity:0.8;
}

.payment-form .block-heading h1,
.payment-form .block-heading h2,
.payment-form .block-heading h3 {
	margin-bottom:1.2rem;
	color: #3b99e0;
}

.payment-form form{
	border-top: 2px solid #5ea4f3;
	box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.075);
	background-color: #ffffff;
	padding: 0;
	max-width: 600px;
	margin: auto;
}

.payment-form .title{
	font-size: 1em;
	border-bottom: 1px solid rgba(0,0,0,0.1);
	margin-bottom: 0.8em;
	font-weight: 600;
	padding-bottom: 8px;
}

.payment-form .products{
	background-color: #f7fbff;
    padding: 25px;
}

.payment-form .products .item{
	margin-bottom:1em;
}

.payment-form .products .item-name{
	font-weight:600;
	font-size: 0.9em;
}

.payment-form .products .item-description{
	font-size:0.8em;
	opacity:0.6;
}

.payment-form .products .item p{
	margin-bottom:0.2em;
}

.payment-form .products .price{
	float: right;
	font-weight: 600;
	font-size: 0.9em;
}

.payment-form .products .total{
	border-top: 1px solid rgba(0, 0, 0, 0.1);
	margin-top: 10px;
	padding-top: 19px;
	font-weight: 600;
	line-height: 1;
}

.payment-form .card-details{
	padding: 25px 25px 15px;
}

.payment-form .card-details label{
	font-size: 12px;
	font-weight: 600;
	margin-bottom: 15px;
	color: #79818a;
	text-transform: uppercase;
}

.payment-form .card-details button{
	margin-top: 0.6em;
	padding:12px 0;
	font-weight: 600;
}

.payment-form .date-separator{
 	margin-left: 10px;
    margin-right: 10px;
    margin-top: 5px;
}

@media (min-width: 576px) {
	.payment-form .title {
		font-size: 1.2em; 
	}

	.payment-form .products {
		padding: 40px; 
  	}

	.payment-form .products .item-name {
		font-size: 1em; 
	}

	.payment-form .products .price {
    	font-size: 1em; 
	}

  	.payment-form .card-details {
    	padding: 40px 40px 30px; 
    }

  	.payment-form .card-details button {
    	margin-top: 2em; 
    } 
}
</style>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    ArrayList<Proizvod> korpa_list = (ArrayList<Proizvod>) session.getAttribute("korpa-list");
    List<Proizvod> korpaProizvod = null;
    
    if(korpa_list != null) {
            Proizvod pr = new Proizvod(DB.getConnection());
            korpaProizvod = pr.getKorpaProducts(korpa_list);
            float total = pr.getKorpaTotal(korpa_list);
            request.setAttribute("korpa_list", korpa_list);
            request.setAttribute("total", total);
        }
%>    
<!DOCTYPE html>
<html>
<head>
  <title>Payment</title>
  <%@include file="head.jsp" %>
  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
</head>
<body>
    
    <%@include file="navbar.jsp" %>

  <main class="page payment-page">
    <section class="payment-form dark">
      <div class="container">
        <div class="block-heading">
          <h2>Korpa</h2>
        </div>
        <form>
        
          <div class="products">
            <h3 class="title">Checkout</h3>
            <%
                if(korpa_list != null) {
                    for(Proizvod pr:korpaProizvod){%>
                        <div class="item">
                        <span class="price"><%= pr.getCijena() %> KM
                            <a href="IzbrisiIzKorpe?id=<%= pr.getId() %>"><button type="button" class="btn btn-primary btn-danger" style="padding: 5px; margin-left: 10px;">Izbrisi</button></a>
                        </span>
                        <p class="item-name"><%= pr.getNaziv() %></p>
                        <p class="item-description"><%= pr.getOpis() %></p>
                        </div>
                    <%}
                }
            %>
            
            
            
            
            <div class="total">Ukupno<span class="price">${(total>0)?total:0} KM</span></div>
          </div>
          <div class="card-details">
            <div class="row">
              <div class="form-group col-sm-12">
                  <%
                if(korpa_list.size()>0) { %>
                  <a href="Narudzba"><button type="button" class="btn btn-primary btn-success" style="padding: 5px;">Zavrsi narudzbu</button></a>
                  <a href="home.jsp" class="btn btn-primary btn-danger" style="margin-top: 30px; margin-left: 5px; font-weight: bolder;">Nazad</a>

                  <% } %>
                  <%
                if(korpa_list.size() == 0) { %>
                  <a href="home.jsp" class="btn btn-primary btn-danger" style="margin-top: 30px; margin-left: 5px; font-weight: bolder;">Nazad</a>
                  <% } %>
                  
              </div>
            </div>
          </div>
        </form>
      </div>
    </section>
  </main>
</body>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>
