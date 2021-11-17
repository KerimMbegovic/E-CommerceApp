<%-- 
    Document   : dodajProizvod
    Created on : 2021.11.13, 23:55:05
    Author     : Kerim
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="head.jsp" %>
        <title>Dodavanje proizvoda</title>
    </head>
    <body>
        
    <%@include file="navbar.jsp" %>
    <div class="container">
        <h3>Unos proizvoda</h3>
        <form action="dodajProizvod" method="POST" class="justify-content-md-center" style="margin-top: 50px" >
  <!-- Name input -->
  <div class="form-outline mb-4">
      <input type="text" id="naziv" name="naziv" class="form-control"  />
    <label class="form-label" for="form4Example1">Naziv prozivoda</label>
  </div>

  <!-- Email input -->
  <div class="form-outline mb-4">
      <input type="number" id="cijena" name="cijena" class="form-control"  />
    <label class="form-label" for="form4Example2">Cijena</label>
  </div>

  <!-- Message input -->
  <div class="form-outline mb-4">
    <textarea class="form-control" id="opis" name="opis" rows="4" ></textarea>
    <label class="form-label" for="form4Example3">Opis</label>
  </div>

  <!-- Submit button -->
  <button type="submit" class="btn btn-primary btn-block mb-4">Dodaj</button>
  <a href="home.jsp" class="btn btn-primary btn-block mb-4">Nazad</a>

</form>
    </div>
    </body>
</html>
