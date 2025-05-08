<%@ page contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta name="author" content="Ana Gutiérrez Barón"/>
    <title>OrtoLiberi - Nuevo Trabajador</title>
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
                <li class="breadcrumb-item active" aria-current="page">Crear Trabajador</li>
            </ol>
        </nav>
    </div>

    <section class="wrap" id="new-user">
        <div class="container">
            <h1>Crear Nuevo Trabajador</h1>
            <p class="lead">Da de alta a un nuevo trabajador de la empresa. El código que se le asignará deberá ser sus iniciales y los 3 ultimos digitos de su DNI</p>
            <div class="card">
                <div class="card-body">
                    <form id="formulario_registro_trabajador" method="post" action="/nuevo/trabajador">
                        <div class="form-group">
                            <label for="inputNombre">Nombre</label>
                            <input type="text" class="form-control" id="inputNombre" name="nombre" placeholder="Escribe el nombre..." required/>
							<span class="error-formulario" id="errorNombre" style="font-style: italic; color: red;"></span>
                        </div>
                        <div class="form-group">
                            <label for="inputApellido">Apellido</label>
                            <input type="text" class="form-control" id="inputApellido" name="apellidos" placeholder="Escribe los apellidos..." required/>
							<span class="error-formulario" id="errorApellidos" style="font-style: italic; color: red;"></span>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail">Email</label>
                            <input type="email" class="form-control" id="inputEmail" name="email" placeholder="Escribe un email..." required/>
							<span class="error-formulario" id="errorEmail" style="font-style: italic; color: red;"></span>
                        </div>
                        <div class="form-group">
                            <label for="inputTelefono">Numero de Telefono</label>
                            <input type="number" class="form-control" id="inputTelefono" name="telefono" placeholder="Escribe el número de telefono..." required/>
							<span class="error-formulario" id="errorTelefono" style="font-style: italic; color: red;"></span>
                        </div>
						<div class="form-group">
							<label for="inputFecha">Fecha de Nacimiento</label>
							<input type="date" class="form-control" id="inputFecha" name="nacimiento" placeholder="Escribe la fecha de nacimiento..." required/>
							<span class="error-formulario" id="errorFecha" style="font-style: italic; color: red;"></span>
						</div>
                        <div class="form-group">
                            <label for="inputDireccion">Direccion</label>
                            <input type="text" class="form-control" id="inputDireccion" name="direccion" placeholder="Escribe la direcccion..." required/>
							<span class="error-formulario" id="errorDireccion" style="font-style: italic; color: red;"></span>
                        </div>
                        <div class="form-group">
                            <label for="inputCodigo">Codigo de acceso</label>
                            <input type="text" class="form-control" id="inputCodigo" name="codigo" placeholder="Escribe el código..." required/>
							<span class="error-formulario" id="errorCodigo" style="font-style: italic; color: red;"></span>
                        </div>
                        <div class="form-group">
                            <label for="inputPassword">Contraseña</label>
                            <input type="password" class="form-control" name="password" id="inputPassword" placeholder="Escribe la contraseña..." required/>
							<span class="error-formulario" id="errorPassword" style="font-style: italic; color: red;"></span>
                        </div>
                        <button type="button" class="btn btn-success btn-block" id="registrar_empleado">Dar de Alta</button>
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
                        <button type="submit" class="btn btn-success btn-block"><a href="/general/registro">Volver</a></button>
                    </form>
                </div>
            </div>
        </div>
    </div>

	<script src="../js/validacion_registro_empleado.js"></script>
</body>
</html>