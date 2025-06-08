<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
		<meta charset="UTF-8"/>
		<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
		<meta name="author" content="Ana Gutiérrez Barón"/>
		<title>OrtoLiberi - Pagina de Cambio de Estado de Proveedor</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
		<link rel="stylesheet" type="text/css" href="../css/administrador.css">
		<link href='https://fonts.googleapis.com/css?family=MedievalSharp' rel='stylesheet'> <!--Fuente para CSS-->
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"> <!--Iconos-->
		<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
    </head>
    <body>
		<header>
			<nav class="navbar fixed-top navbar-expand-lg navbar-light">
		    	<div class="container">
		        	<a class="navbar-brand" href="/administrador/inicio"><img src="../img/Logo.png" alt="Logo de la empresa" title="Logo de la empresa"/></a>
		         	<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavaltMarkup" aria-expanded="false" aria-label="Toggle navigation">
		            	<span class="navbar-toggler-icon"></span>
		            </button>

		            <div class="collapse navbar-collapse navbar-right" id="navbarNavAltMarkup">
		            	<ul class="nav navbar-nav">
		                	<li><a class="nav-item nav-link" href="/administrador/almacen"><i class="fa-solid fa-shop"></i>Almacen</a></li>
		                    <li><a class="nav-item nav-link" href="/administrador/pedidos"><i class="fa-solid fa-truck-fast"></i>Pedidos</a></li>
		                    <li><a class="nav-item nav-link" href="/administrador/taller"><i class="fa-solid fa-industry"></i>Productos en Fabricacion</a></li>
		                    <li><a class="nav-item nav-link" href="/administrador/listado"><i class="fa-solid fa-user-nurse"></i>Listados</a></li>
							<li><a class="nav-item nav-link" href="/administrador/bajas"><i class="fa-solid fa-address-card"></i>Bajas</a></li>
		                   	<li><a class="nav-item nav-link" href="/administrador/salir"><i class="fa fa-sign-out"></i>Salir</a></li>
		                 </ul>
		            </div>
		        </div>
		     </nav>
		</header>
		
		<section id="title-enroll">
			<div class="jumbotrol">
		    	<div class="container-fluid">
		        	<h1>OrtoLiberi</h1>
		        </div>
		    </div>
		</section>
		
		<div class="container">
			<div class="row">
		    	<nav class="col-12" aria-label="breadcrumb">
		        	<ol class="breadcrumb">
		            	<li class="breadcrumb-item active" aria-current="page">Cambiar estado de un proveedor</li>
		            </ol>
					<p>El estado actual del proveedor es ${proveedor.estado}</p>
					<form method="post">
						<input type="hidden" name="id" value="${proveedor.id}">
						<select class="form-control" id="estado_proveedor" required>
							<option value="">Seleccione un estado</option>
							<option value="normal">Normal</option>
							<option value="de-vacaciones">De Vacaciones</option>
							<option value="desabastecido">Desabastecido</option>
							<option value="cerrado">Cerrado</option>
						</select>
						<input type="submit" value="Cambiar Estado"/>
					</form>
					<c:if test="${not empty error}">
						<div class="error">${error}</div>
					</c:if>
					<c:if test="${not empty confirmacion}">
						<div class="confirmacion">${confirmacion}</div>
					</c:if>
				</nav>
			</div>
		</div>
		
		<footer id="footer">
			<div class="container-fluid">
		    	<p><a href="#"><i class="fa-brands fa-facebook"></i></a> || <a href="#"><i class="fa-brands fa-instagram"></i></a> || <a href="#"><i class="fa-brands fa-twitter"></i></a> &lt;------------- <span>OrtoLiberi</span> -------------&gt; <span><em>Dejar a los niños ser niños</em></span></p>
			</div>
		</footer>
    </body>
</html>