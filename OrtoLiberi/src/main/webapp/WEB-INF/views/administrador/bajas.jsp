<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta name="author" content="Ana Gutierrez Baron"/>
    <title>OrtoLiberi - Pagina de Listado de Bajas</title>
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
						<li><a class="nav-item nav-link" href="/administrador/codigos"><i class="fa-regular fa-file-code"></i>Codigos SAS</a></li>
						<li><a class="nav-item nav-link" href="/administrador/agenda"><i class="fa-solid fa-calendar-week"></i>Agenda</a></li>
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
        <div class="row">
            <nav class="col-12" aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item active" aria-current="page">Bajas</li>
                </ol>
				<p><a class="btn btn-primary btn-lg" href="/administrador/nueva-baja">Registrar Baja</a></p>
				<section class="wrap" id="admin-course">
					<div class="container">
				    	<div class="row">
				        	<div class="col-sm-8 offst-sm-2">
				            	<ul class="nav nav-tabs" id="myTab" role="tablist">
				                	<li class="nav-item">
				                       <a class="nav-link" id="bajas-proximas" data-bs-toggle="tab" href="#proximas" role="tab" aria-controls="proximas" aria-selected="false">Bajas Proximas</a>
				                    </li>
				                        <li class="nav-item">
				                            <a class="nav-link" id="bajas-actuales" data-bs-toggle="tab" href="#actuales" role="tab" aria-controls="actuales" aria-selected="false">Bajas en Curso</a>
				                        </li>
				                        <li class="nav-item">
				                            <a class="nav-link" id="bajas-pasadas" data-bs-toggle="tab" href="#pasadas" role="tab" aria-controls="pasadas" aria-selected="false">Bajas Pasadas</a>
				                        </li>
				                    </ul>
				                    <div class="tab-content" id="myTabContent">
				                        <div class="tab-pane fade" id="proximas" role="tabpanel" aria-labelledby="bajas-proximas">
				                            <div class="card-heading">
                                            	<h3>Listado de Bajas Anotadas</h3>
				                            </div>
				                            <div class="card-body">
												<table class="table table-striped">
                                                	<thead>
                                                    	<tr>
                                                        	<th>Fecha de Inicio</th>
                                                            <th>Fecha de Fin</th>
															<th>Trabajador</th>
															<th>Motivo</th>
															<th>Acciones</th>
												        </tr>
												    </thead>
												    <tbody>
												    	<tr th:each="proxima : ${proximas}">
												            <td th:text="${proxima.baja}"></td>
															<td th:text="${proxima.alta}"></td>
															<td th:text="${proxima.tecnio}"></td>
															<td th:text="${proxima.motivo}"></td>
												            <td>
												            	<a th:href="/edicion-admi/baja/{id}(id=${proxima.id})" class="btn btn-warning btn-sm">Editar</a>
												                <a th:href="/eliminacion-admi/baja/{id}(id=${proxima.id})" class="btn btn-danger btn-sm">Eliminar</a>
												            </td>
												         </tr>
												    </tbody>
												</table>
				                            </div>
				                        </div>
										<div class="tab-pane fade" id="actuales" role="tabpanel" aria-labelledby="bajas-actuales">
											<div class="card-heading">
										    	<h3>Listado de Bajas en Proceso</h3>
											</div>
											<div class="card-body">
												<table class="table table-striped">
										        	<thead>
										          		<tr>
										                	<th>Fecha de Inicio</th>
										                    <th>Fecha de Fin</th>
															<th>Trabajador</th>
															<th>Motivo</th>
															<th>Acciones</th>
														</tr>
													</thead>
													<tbody>
														<tr th:each="actual : ${actuales}">
															<td th:text="${actual.baja}"></td>
															<td th:text="${actual.alta}"></td>
															<td th:text="${actual.tecnio}"></td>
															<td th:text="${actual.motivo}"></td>
															<td>
																<a th:href="/edicion-admi/baja/{id}(id=${actual.id})" class="btn btn-warning btn-sm">Editar</a>
															</td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
										<div class="tab-pane fade" id="pasadas" role="tabpanel" aria-labelledby="bajas-pasadas">
											<div class="card-heading">
										    	<h3>Listado de Bajas Finalizadas</h3>
											</div>
											<div class="card-body">
												<table class="table table-striped">
										        	<thead>
										            	<tr>
										                	<th>Fecha de Inicio</th>
										                    <th>Fecha de Fin</th>
															<th>Trabajador</th>
															<th>Motivo</th>
														</tr>
													</thead>
													<tbody>
														<tr th:each="pasada : ${pasadas}">
															<td th:text="${pasada.baja}"></td>
															<td th:text="${pasada.alta}"></td>
															<td th:text="${pasada.tecnio}"></td>
															<td th:text="${pasada.motivo}"></td>
														</tr>
													</tbody>
												</table>
											</div>
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