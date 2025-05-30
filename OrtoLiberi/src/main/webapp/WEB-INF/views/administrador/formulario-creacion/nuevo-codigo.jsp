<%@ page contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta name="author" content="Ana Gutiérrez Barón"/>
    <title>OrtoLiberi - Nuevo Codigo SAS</title>
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
						<li><a class="nav-item nav-link" href="/"><i class="fa fa-sign-out"></i>Salir</a></li>
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
		<nav aria-label="breadcrumb">
	    	<ol class="breadcrumb">
	        	<li class="breadcrumb-item active" aria-current="page">Registrar un nuevo Codigo SAS</li>
	        </ol>
		</nav>
	</div>
	
	<section class="wrap" id="new-children">
		<div class="container">
	    	<h1>Registrar un nuevo Codigo SAS</h1>
	        <p class="lead">Registra un nuevo codigo del catalogo oficial del Servicio Andaluz de Salud</p>
	        <div class="card">
	        	<div class="card-body">
	            	<form id="formulario_codigo" method="post" action="/nuevo/codigo">
	                	<div class="form-group">
							<label for="inputCodigo">Código</label>
							<input type="text" class="form-control" id="inputCodigo" name="codigo" placeholder="Escribe el código..." required/>
							<span class="error-formulario" id="errorCodigo" style="font-style: italic; color: red;"></span>
	                    <div class="form-group">
							<label for="inputProducto">Producto que cubre</label>
							<input type="text" class="form-control" id="inputProducto" name="producto" placeholder="Escribe el nombre del producto..." required/>
							<span class="error-formulario" id="errorProducto" style="font-style: italic; color: red;"></span>
	              		</div>
						<div class="form-group">
							<label for="inputDescripcion">Descripción tecnica del producto</label>
							<textarea class="form-control" id="inputDescripcion" name="descripcion" required rows="4"></textarea>
							<span class="error-formulario" id="errorDescripcion" style="font-style: italic; color: red;"></span>
						</div>
						<div class="form-group">
							<label for="inputCobertura">Coste que cubre el SAS</label>
						    <input type="number" class="form-control" id="inputCobertura" name="cobertura" step="0.01" placeholder="0,01" required/>
							<span class="error-formulario" id="errorCobertura" style="font-style: italic; color: red;"></span>
						</div>
	                    <button type="button" class="btn btn-success btn-block" id="registrar_codigo">Añadir</button>
	           		</form>
					<c:if test="${not empty error}">
						<div class="error" style="font-style: italic; color: red;">${error}</div>
					</c:if>
	        	</div>
	    	</div>
		</div>
	</section>
	
	<footer id="footer">
		<div class="container-fluid">
	    	<p><a href="#"><i class="fa-brands fa-facebook"></i></a> || <a href="#"><i class="fa-brands fa-instagram"></i></a> || <a href="#"><i class="fa-brands fa-twitter"></i></a> &lt;------------- <span>OrtoLiberi</span> -------------&gt; <span><em>Dejar a los niños ser niños</em></span></p>
		</div>
	</footer>
</body>
</html>