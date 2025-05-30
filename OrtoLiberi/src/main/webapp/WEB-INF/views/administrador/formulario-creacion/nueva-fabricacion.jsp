<%@ page contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta name="author" content="Ana Gutiérrez Barón"/>
    <title>OrtoLiberi - Nueva Fabricacion</title>
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
                <li class="breadcrumb-item active" aria-current="page">Crear Nuevo Producto de Fabricacion</li>
            </ol>
        </nav>
    </div>

    <section class="wrap" id="new-user">
        <div class="container">
            <h1>Crear Nuevo Producto de Fabricacion</h1>
            <p class="lead">Da de alta un nuevo producto para poder fabricarlo en taller</p>
            <div class="card">
                <div class="card-body">
                    <form id="formulario_registro_fabricacion" method="post" action="/nuevo/fabricacion">
                        <div class="form-group">
                            <label for="inputNombre">Nombre</label>
                            <input type="text" class="form-control" id="inputNombre" name="nombre" placeholder="Escribe el nombre..." required/>
							<span class="error-formulario" id="errorNombre" style="font-style: italic; color: red;"></span>
                        </div>
                        <div class="form-group">
                            <label for="inputDescripcion">Descripción</label>
                            <textarea class="form-control" id="inputDescripcion" name="descripcion" placeholder="Escribe la descripción del producto..." required></textarea>
							<span class="error-formulario" id="errorDescripcion" style="font-style: italic; color: red;"></span>
                        </div>
                        <div class="form-group">
                            <label for="inputPaciente">Paciente</label>
							<select class="form-control" id="inputPaceinte" th:field="*{paciente.id}" required>
								<option value="">Seleccione un paciente registrado</option>
								<option th:each="paciente : ${pacientes}" th:value="${paciente.id}" th:text="${paciente.nombre} ${paciente.apellidos}"></option>
							</select>
							<span class="error-formulario" id="errorPaciente" style="font-style: italic; color: red;"></span>
                        </div>
						<div class="form-group">
							<label for="inputCodigo">Codigo SAS asociado</label>
							<select class="form-control" id="inputCodigo" th:field="*{codigoSAS.codigo}" required>
								<option value="">Seleccione un codigo registrado</option>
								<option th:each="codigo : ${codigos}" th:value="${codigo.codigo}" th:text="${codigo.codigo} + ': ' +${codigo.descripcion}"></option>
							</select>
							<span class="error-formulario" id="errorCodigo" style="font-style: italic; color: red;"></span>
						</div>
						<div class="form-group">
							<label for="inputResponsable">Trabajador Responsable</label>
							<select class="form-control" id="inputResponsable" th:field="*{trabajador.id}" required>
								<option value="">Seleccione un trabajador responsable</option>
								<option th:each="trabajador : ${trabajadores}" th:value="${trabajador.id}" th:text="${trabajador.nombre} ${trabajador.apellidos}"></option>
							</select>
							<span class="error-formulario" id="errorResponsable" style="font-style: italic; color: red;"></span>
						</div>
                        <button type="button" class="btn btn-success btn-block" id="registrar_fabricacion">Registrar</button>
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