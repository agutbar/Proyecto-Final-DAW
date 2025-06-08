<%@ page contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta name="author" content="Ana Gutiérrez Barón"/>
    <title>OrtoLiberi - Editar Cita</title>
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
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item active" aria-current="page">Editar Cita</li>
            </ol>
        </nav>
    </div>

    <section class="wrap" id="new-user">
        <div class="container">
            <h1>Editar Cita de la agenda</h1>
            <p class="lead">Edita una cita de la agenda que esté disponible</p>
            <div class="card">
                <div class="card-body">
                    <form id="formulario_registro_cita" method="post" action="/editar/cita">
						<div class="form-group">
							<label for="inputId" hidden>ID Cita</label>
							<input type="text" class="form-control" id="inputId" name="id" value="${cita.id}" hidden required/>
						</div>
                        <div class="form-group">
                            <label for="inputDia">Dia</label>
                            <input type="number" class="form-control" id="inputDia" name="dia" step="1" placeholder="00" min="1" max="31" value="${cita.fecha.getDayOfMonth()}" required/>
							<span class="error-formulario" id="errorDia" style="font-style: italic; color: red;"></span>
                        </div>
                        <div class="form-group">
                            <label for="inputMes">Mes</label>
                            <input type="number" class="form-control" id="inputMes" name="mes" step="1" placeholder="00" min="1" max="12" value="${cita.fecha.getMonthValue()}" required/>
							<span class="error-formulario" id="errorMes" style="font-style: italic; color: red;"></span>
                        </div>
                        <div class="form-group">
                            <label for="inputYear">Año</label>
                            <input type="number" class="form-control" id="inputYear" name="year" step="1" placeholder="" min="" value="${cita.fecha.getFullYear()}" required/>
							<span class="error-formulario" id="errorYear" style="font-style: italic; color: red;"></span>
                        </div>
                        <div class="form-group">
                            <label for="inputHora">Hora</label>
                            <input type="number" class="form-control" id="inputHora" name="hora" step="1" placeholder="00" min="9" max="20" value="${cita.hora.getHour()}" required/>
							<span class="error-formulario" id="errorHora" style="font-style: italic; color: red;"></span>
                        </div>
						<div class="form-group">
							<label for="inputMinuto">Minuto</label>
							<input type="number" class="form-control" id="inputMinuto" name="minuto" step="1" placeholder="00" min="00" max="50" value="${cita.hora.getMinute()}" required/>
							<span class="error-formulario" id="errorMinuto" style="font-style: italic; color: red;"></span>
						</div>
                        <div class="form-group">
                            <label for="inputTecnico">Tecnico Responsable</label>
							<select class="form-control" id="inputTecnico" required>
								<option value="&{cita.tecnico.id}">&{cita.tecnico.nombre} &{cita.tecnico.apellidos}</option>
								<c:forEach var="tecnico" items="${tecnicos}">
									<option value="${tecnico.id}">${tecnico.nombre} ${tecnico.apellidos}</option>
								</c:forEach>
							</select>
							<span class="error-formulario" id="errorTecnico" style="font-style: italic; color: red;"></span>
                        </div>
                        <button type="submit" class="btn btn-success btn-block" id="registrar_cita">Añadir a la agenda</button>
                    </form>
					<c:if test="${not empty error}">
						<div class="error" style="font-style: italic; color: red;">${error}</div>
					</c:if>
					<c:if test="${not empty confirmacion}">
						<div class="confirmacion" style="font-style: italic; color: green;">${confirmacion}</div>
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
</body>
</html>