<%@ page contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta name="author" content="Ana Gutiérrez Barón"/>
    <title>OrtoLiberi - Ficha de Menor</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="../css/registrado.css">
    <link href='https://fonts.googleapis.com/css?family=MedievalSharp' rel='stylesheet'> <!--Fuente para CSS-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"> <!--Iconos-->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
</head>
<body>
    <header>
        <nav class="navbar fixed-top navbar-expand-lg navbar-light">
            <div class="container">
                <a class="navbar-brand" href="/registrado/inicio"><img src="../img/Logo.png" alt="Logo de la empresa" title="Logo de la empresa"/></a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavaltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse navbar-right" id="navbarNavAltMarkup">
                    <ul class="nav navbar-nav">
                        <li><a class="nav-item nav-link" href="/registrado/compras"><i class="fa-solid fa-bag-shopping"></i>Compras</a></li>
                        <li><a class="nav-item nav-link" href="/registrado/citas"><i class="fa-regular fa-calendar"></i>Citas</a></li>
						<li><a class="nav-item nav-link" href="/registrado/datos"><i class="fa fa-user"></i>Datos Personales</a></li>
                        <li><a class="nav-item nav-link" href="/registrado/salir"><i class="fa fa-sign-out"></i>Salir</a></li>
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

    <section class="wrap" id="personal-data">
        <div class="container">
            <h1>Ficha del Menor ${hijo.nombre}</h1>
            <p>
                <a id="editar-datos" href="/registrado/editar-hijo" class="btn btn-info">Editar Datos</a>
            </p>
            <dl class="row">
                <dt class="col-sm-3">Nombre Completo</dt>
                <dd class="col-sm-9">${hijo.nombre} ${hijo.apellidos}</dd>

                <dt class="col-sm-3">Fecha de Nacimiento</dt>
                <dd class="col-sm-9">${hijo.nacimiento}</dd>

                <dt class="col-sm-3">Tutor Legal</dt>
                <dd class="col-sm-9">${hijo.tutor}</dd>
            </dl>
        </div>
    </section>

    <section class="wrap" id="children">
        <div class="container">
            <div class="row">
                <div class="col-sm-8 offst-sm-2">
                    <ul class="nav nav-tabs" id="myTab" role="tablist">
						<li class="nav-item">
							<a class="nav-link active" id="ver-productos-taller" data-bs-toggle="tab" href="#trabajos-taller" role="tab" aria-controls="trabajos-taller" aria-selected="false">Productos de taller</a>
						</li>
						<li class="nav-item">
							<a class="nav-link active" id="ver-citas" data-bs-toggle="tab" href="#citas" role="tab" aria-controls="citas" aria-selected="false">Revisiones</a>
						</li> 
                    </ul>
	                <div class="tab-content" id="myTabContent">
	                	<div class="tab-pane fade" id="trabajos-taller" role="tabpanel" aria-labelledby="ver-trabajos-taller">
							<table class="table table-striped">
								<thead>
									<tr>
										<th>Producto</th>
										<th>Descripción</th>
										<th>Responsable</th>
									</tr>
								</thead>
								<tbody>
									<tr th:each="trabajo : ${hijo.productos_realizados}">
										<td th:text="${trabajo.nombre}"></td>
										<td th:text="${trabajo.descripcion}"></td>
										<td th:text="${trabajo.responsable}"></td>
									</tr>
								</tbody>
							</table> 
	                	</div>
						<div class="tab-pane fade" id="citas" role="tabpanel" aria-labelledby="ver-citas">
							<table class="table table-striped">
								<thead>
									<tr>
										<th>Dia</th>
										<th>Hora</th>
										<th>Estado</th>
									</tr>
								</thead>
								<tbody>
									<tr th:each="revision : ${hijo.revisiones}">
										<td th:text="${revision.cita.fecha}"></td>
										<td th:text="${revision.cita.hora}"></td>
										<c:if test="${revision.cita.fecha.isBefore(java.time.LocalDate.now())}">
											<td style="background-color: #EEE8AA">Cumplida</td>
										</c:if>
										<c:if test="${revision.cita.fecha.isAfter(java.time.LocalDate.now())}">
											<td style="background-color: #87CEEB">Pendiente</td>
										</c:if>
									</tr>
								</tbody>
							</table> 
						</div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <footer id="footer">
        <div class="container-fluid">
            <p><a href="#"><i class="fa-brands fa-facebook"></i></a> || <a href="#"><i class="fa-brands fa-instagram"></i></a> || <a href="#"><i class="fa-brands fa-twitter"></i></a> &lt;------------- <span>OrtoLiberi</span> -------------&gt; <span><em>Dejar a los niños ser niños</em></span></p>
        </div>
    </footer>

    <!--Ventanas Modales-->

    <div class="modal fade" id="modalConstruccion"> <!--Ventana Modal de Aviso-->
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <p>Esta pagina está en construccion</p>
                </div>
                <div class="modal-body">
                    <form>
                        <button type="submit" class="btn btn-success btn-block"><a href="/registrado/ver-hijo{id}(id=${hijo.id})">Volver</a></button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>