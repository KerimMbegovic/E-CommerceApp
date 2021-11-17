<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container">
  <a class="navbar-brand" href="home.jsp">Mini E-Commerce</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav ms-auto">
      <li class="nav-item active"><a class="nav-link" href="home.jsp" style="font-weight: bolder;">Home</a></li>
      
      <c:if test="${user.role == 1}">
      <li class="nav-item"><a class="nav-link" href="dodajProizvod.jsp" style="font-weight: bolder;">Dodaj proizvod</a></li>
      <li class="nav-item"><a class="nav-link" href="orders.jsp" style="font-weight: bolder;">Pregled narudzbi</a></li>
      <li class="nav-item"><a class="nav-link" href="login.jsp" style="background-color: red; border-radius: 30%; font-weight: bolder; color: white;">Logout</a></li>
      </c:if>
      
      <c:if test="${user.role == 2}">
      <li class="nav-item"><a class="nav-link" href="home.jsp" style="font-weight: bolder;">Pregled proizvoda</a></li>
      <li class="nav-item"><a class="nav-link" href="korpa.jsp" style="font-weight: bolder;">Korpa</a></li>
      <li class="nav-item"><a class="nav-link" href="orders.jsp" style="font-weight: bolder;">Moje narudzbe</a></li>
      <li class="nav-item"><a class="nav-link" href="login.jsp" style="background-color: red; border-radius: 30%; font-weight: bolder; color: white;">Logout</a></li>
      </c:if>
      
      <c:if test="${user.role == 3}">
      <li class="nav-item"><a class="nav-link" href="home.jsp" style="font-weight: bolder;">Pregled proizvoda</a></li>
      <li class="nav-item"><a class="nav-link" href="login.jsp" style="background-color: red; border-radius: 30%; font-weight: bolder; color: white;">Logout</a></li>
      </c:if>
    </ul>
    
  </div>
    </div>
</nav>