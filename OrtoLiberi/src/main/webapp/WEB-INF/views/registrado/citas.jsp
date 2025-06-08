<%@ page contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta name="author" content="Ana Gutierrez Baron"/>
    <title>OrtoLiberi - Pagina de Gestion de Citas</title>
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

    <div class="container">
        <div class="row">
            <nav class="col-12" aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item active" aria-current="page">Citas</li>
                </ol>
				<section class="wrap" id="citas">
					<div class="container">
				    	<div class="row">
                        	<h1>Listado de Citas</h1>
							<p>
								<a id="nuevo-hijo" href="/registrado/nueva-cita" class="btn btn-info">Pedir Cita</a>
							</p>
							<ul class="nav nav-tabs" id="myTab" role="tablist">
								<li class="nav-item">
									<a class="nav-link" id="citas-pendientes" data-bs-toggle="tab" href="#cpendientes" role="tab" aria-controls="cpendientes" aria-selected="false">Citas Pendientes</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" id="citas-historico" data-bs-toggle="tab" href="#chistorico" role="tab" aria-controls="chistorico" aria-selected="false">Historico de Citas</a>
								</li>
							</ul>
							<div class="tab-content" id="myTabContent">
								<div class="tab-pane fade" id="cpendientes" role="tabpanel" aria-labelledby="citas-pendientes">
									<div class="card-heading">
							        	<h3>Listado de Citas Pendientes</h3>
									</div>
									<div class="card-body">
										<table class="table table-striped">
			                            	<thead>
			                                	<tr>
			                                    	<th>Dia</th>
													<th>Hora</th>
													<th>Hijo</th>
			                                    	<th>Acciones</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="revisionP" items="${revisiones_pendientes}">
													<tr>
														<td>${revisionP.cita.fecha}</td>
														<td>${revisionP.cita.hora}</td>
														<td>${revisionP.paciente.nombre}</td>
														<td>
															<a href="/revision/ver${revisionP.id}" class="btn btn-info btn-sm">Ver Detalles</a>
															<a href="/revision/editar${revisionP.id}" class="btn btn-warning btn-sm">Editar</a>
															<a href="/revision/cancelar/${revisionP.id}" class="btn btn-danger btn-sm">Cancelar</a>
														</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
								</div>
								<div class="tab-pane fade" id="chistorico" role="tabpanel" aria-labelledby="citas-historico">
									<div class="card-heading">
										<h3>Listado Historico de Citas</h3>
									</div>
									<div class="card-body">
										<table class="table table-striped">
											<thead>
												<tr>
													<th>Dia</th>
													<th>Hora</th>
													<th>Hijo</th>
													<th>Acciones</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="revisionC" items="${revisiones_completadas}">
													<tr>
														<td>${revisionC.cita.fecha}</td>
														<td>${revisionC.cita.hora}</td>
														<td>${revisionC.paciente.nombre}</td>
														<td>
															<a th:href="/revision/ver${revisionP.id})" class="btn btn-info btn-sm">Ver Detalles</a>
														</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
								</div>
							</div>
				     	</div>
				     </div>
				</section>
			</nav>
		</div>
	</div>
</body>
</html>