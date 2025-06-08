<%@ page contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta name="author" content="Ana Gutiérrez Barón"/>
    <title>OrtoLiberi - Pagina de Acceso a Administracion</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="../css/general.css">
    <link href='https://fonts.googleapis.com/css?family=MedievalSharp' rel='stylesheet'> <!--Fuente para CSS-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"> <!--Iconos-->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
</head>
<body>
    <header>
        <nav class="navbar fixed-top navbar-expand-lg navbar-light">
            <div class="container">
                <a class="navbar-brand" href="/"><img src="../img/Logo.png" alt="Logo de la empresa" title="Logo de la empresa"/></a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavaltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse navbar-right" id="navbarNavAltMarkup">
                    <ul class="nav navbar-nav">
                        <li><a class="nav-item nav-link" href="/general/nosotros">Sobre Nosotros<span class="sr-only">(current)</span></a></li>
                        <li><a class="nav-item nav-link" href="#" data-bs-toggle="modal" data-bs-target="#modalConstruccion">Tienda</a></li>
                        <li><a class="nav-item nav-link" href="/general/trabajo">Trabaja con Nosotros</a></li>
                        <li><a class="nav-item nav-link" href="#" data-bs-toggle="modal" data-bs-target="#modalPerfil">Zona Personal</a></li>
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
                <li class="breadcrumb-item active" aria-current="page">Acceso de trabajadores</li>
            </ol>
        </nav>
    </div>

    <section class="wrap" id="login">
        <div class="container">
            <h1>Acceso Restringido a Personal Autorizado</h1>
            <div class="card">
                <div class="card-body">
					<form id="formulario_acceso_empleado" method="post" action="/formulario/trabajador">
						<div class="form-group">
					    	<label for="inputCodigo">Codigo de Empleado</label>
					        <input type="text" class="form-control" name="codigo" id="inputCodigo" placeholder="Escribe tu codigo..." required/>
							<span class="error-formulario" id="errorCodigo" style="font-style: italic; color: red;"></span>
					    </div>
					    <div class="form-group">
					    	<label for="inputPassword">Contraseña</label>
					        <input type="password" class="form-control" name="password" id="inputPassword" placeholder="Escribe tu contraseña..." required/>
							<span class="error-formulario" id="errorPassword" style="font-style: italic; color: red;"></span>
					    </div>
					    <button type="button" class="btn btn-success btn-block" id="acceder_empleado">Acceder</button>
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

    <!--Ventana Modal-->

    <div class="modal fade" id="modalConstruccion"> <!--Ventana Modal de Aviso-->
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <p>Esta pagina está en construccion</p>
                </div>
                <div class="modal-body">
                    <form>
                        <button type="submit" class="btn btn-success btn-block"><a href="/general/trabajadores">Volver</a></button>
                    </form>
                </div>
            </div>
        </div>
    </div>
	<script src="../js/validacion_acceso_empleado.js"></script>
</body>
</html>