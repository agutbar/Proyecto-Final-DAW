<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta name="author" content="Ana Gutiérrez Barón"/>
    <title>OrtoLiberi - Pagina de Agenda</title>
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
						<li><a class="nav-item nav-link" href="/administrador/codigos"><i class="fa-regular fa-file-code"></i>Codigos SAS</a></li>
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
				<li class="breadcrumb-item active" aria-current="page">Agenda</li>
			</ol>
			<section class="wrap" id="admin-course">
				<div class="container">
					<div class="row">
						<div class="col-sm-8 offst-sm-2">
							<ul class="nav nav-tabs" id="myTab" role="tablist">
								<li class="nav-item">
							    	<a class="nav-link" id="citas-libres" data-bs-toggle="tab" href="#libres" role="tab" aria-controls="libres" aria-selected="false">Citas Libres</a>
							    </li>
							    <li class="nav-item">
							    	<a class="nav-link" id="citas-asignadas" data-bs-toggle="tab" href="#asignadas" role="tab" aria-controls="asignadas" aria-selected="false">Citas Cogidas</a>
							   	</li>
							</ul>
							<div class="tab-content" id="myTabContent">
								<div class="tab-pane fade" id="libres" role="tabpanel" aria-labelledby="citas-libres">
							    	<div class="card-heading">
			                        	<h3>Listado de Citas Disponibles</h3>
			                            <p><a class="btn btn-primary btn-lg" href="/administrador/nueva-cita">Añadir</a></p>
							       	</div>
							        <div class="card-body">
										<table class="table table-striped">
			                            	<thead>
			                                	<tr>
			                                    	<th>Fecha</th>
			                                        <th>Hora</th>
													<th>Tecnico</th>
													<th>Acciones</th>
												</tr>
											</thead>
											<tbody>
												<tr th:each="cita: ${citas}">
													<td th:text="${cita.fecha}"></td>
													<td th:text="${cita.hora}"></td>
													<td th:text="${cita.tecnico}"></td>
													<td>
														<a th:href="/editar/cita/{id}(id=${cita.id})" class="btn btn-warning btn-sm">Editar</a>
														<a th:href="/cambio/cita/{id}(id=${cita.id})" class="btn btn-success btn-sm">Asignar</a>
													</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
								<div class="tab-pane fade" id="materiales" role="tabpanel" aria-labelledby="lista-materiales">
							    	<div class="card-heading">
			                        	<h3>Listado de Citas Asignadas</h3>
							        </div>
							        <div class="card-body">
										<table class="table table-striped">
											<thead>
												<tr>
													<th>Fecha</th>
													<th>Hora</th>
													<th>Tecnico</th>
													<th>Cliente</th>
													<th>Paciente</th>
													<th>Descripción</th>
													<th>Acciones</th>
												</tr>
											</thead>
											<tbody>
												<tr th:each="revision: ${revisiones}">
													<td th:text="${revision.cita.fecha}"></td>
													<td th:text="${revision.cita.hora}"></td>
													<td th:text="${revision.cita.tecnico}"></td>
													<td th:text="${revision.solicitante}"></td>
													<td th:text="${revision.paciente}"></td>
													<td th:text="${revision.descripcion}"></td>
													<td>
														<a th:href="/editar/revision/{id}(id=${revision.id})" class="btn btn-success btn-sm">Editar</a>
														<a th:href="/eliminar/revision/{id}(id=${revision.id})" class="btn btn-warning btn-sm">Cancelar</a>
													</td>
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
	                	<button type="submit" class="btn btn-success btn-block"><a href="/administrador/agenda">Volver</a></button>
	                </form>
	            </div>
	        </div>
	    </div>
	</div>
</body>
</html>