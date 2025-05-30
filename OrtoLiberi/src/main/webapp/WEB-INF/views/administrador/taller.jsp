<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta name="author" content="Ana Gutierrez Baron"/>
    <title>OrtoLiberi - Pagina de Gestion del Taller</title>
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
						<li><a class="nav-item nav-link" href="/administrador/listado"><i class="fa-solid fa-user-nurse"></i>Listados</a></li>
						<li><a class="nav-item nav-link" href="/administrador/bajas"><i class="fa-solid fa-address-card"></i>Bajas</a></li>
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
                    <li class="breadcrumb-item active" aria-current="page">Taller</li>
                </ol>
				<section class="wrap" id="lista-taller">
					<div class="container">
				    	<div class="row">
                        	<h2>Listado de Fabricaciones</h2>
							<ul class="nav nav-tabs" id="myTab" role="tablist">
								<li class="nav-item">
									<a class="nav-link" id="fabricacion-actual" data-bs-toggle="tab" href="#factual" role="tab" aria-controls="factual" aria-selected="false">Pedidos Actuales</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" id="fabricacion-historico" data-bs-toggle="tab" href="#fhistorico" role="tab" aria-controls="fhistorico" aria-selected="false">Pedidos Historico</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" id="fabricacion-general" data-bs-toggle="tab" href="#fgeneral" role="tab" aria-controls="fgeneral" aria-selected="false">Fabricaciones</a>
								</li>
							</ul>
							<div class="tab-content" id="myTabContent">
								<div class="tab-pane fade" id="factual" role="tabpanel" aria-labelledby="fabricacion-actual">
									<div class="card-heading">
							        	<h3>Listado Fabricaciones Actuales</h3>
										<p><a class="btn btn-primary btn-lg" href="/administrador/nuevo-pedido-fabricacion">Añadir</a></p>
									</div>
									<div class="card-body">
										<table class="table table-striped">
			                            	<thead>
			                                	<tr>
			                                    	<th>Fecha de Peticion</th>
													<th>Paciente</th>
													<th>Producto</th>
													<th>Responsable</th>
													<th>Estado</th>
													<th>Fecha de Entrega</th>
			                                    	<th>Acciones</th>
												</tr>
											</thead>
											<tbody>
												<tr th:each="pedido_taller_actual : ${pedidos_actuales}">
													<td th:text="${pedido_taller_actual.peticion}"></td>
													<td th:text="${pedido_taller_actual.producto.paciente}"></td>
													<td th:text="${pedido_taller_actual.producto}"></td>
													<td th:text="${pedido_taller_actual.producto.responsable}"></td>
													<td th:text="${pedido_taller_actual.estado}"></td>
													<td th:text="${pedido_taller_actual.prevision}"></td>
													<td>
														<a th:href="/ver/pedido-taller/{id}(id=${pedido-taller-actual.id})" class="btn btn-info btn-sm">Ver Pedido</a>
														<a th:href="/ver/fabricacion/{id}(id=${pedido-taller-actual.producto.id})" class="btn btn-info btn-sm">Ver Hoja de Taller</a>
														<a th:href="/editar/pedido-taller/{id}(id=${pedido-taller-actual.id})" class="btn btn-warning btn-sm">Editar</a>
														<a th:href="/estado/pedido-taller/{id}(id=${pedido-taller-actual.id})" class="btn btn-danger btn-sm">Cambiar Estado</a>
													</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
								<div class="tab-pane fade" id="fhistorico" role="tabpanel" aria-labelledby="fabricacion-historico">
									<div class="card-heading">
										<h3>Listado Fabricaciones Historico</h3>
									</div>
									<div class="card-body">
										<table class="table table-striped">
											<thead>
												<tr>
													<th>Fecha de Peticion</th>
													<th>Paciente</th>
													<th>Producto</th>
													<th>Responsable</th>
													<th>Estado</th>
													<th>Fecha de Entrega</th>
													<th>Acciones</th>
												</tr>
											</thead>
											<tbody>
												<tr th:each="pedido-taller-historico : ${pedidos_historicos}">
													<td th:text="${pedido-taller-historico.peticion}"></td>
													<td th:text="${pedido-taller-historico.producto.paciente}"></td>
													<td th:text="${pedido-taller-historico.producto}"></td>
													<td th:text="${pedido-taller-historico.producto.responsable}"></td>
													<td th:text="${pedido-taller-historico.estado}"></td>
													<td th:text="${pedido-taller-historico.prevision}"></td>
													<td>
														<a th:href="/ver/pedido-taller/{id}(id=${pedido-taller-historico.id})" class="btn btn-info btn-sm">Ver Pedido</a>
														<a th:href="/ver/fabricacion/{id}(id=${pedido-taller-historico.producto.id})" class="btn btn-info btn-sm">Ver Hoja de Taller</a>
													</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
								<div class="tab-pane fade" id="fgeneral" role="tabpanel" aria-labelledby="fabricacion-general">
									<div class="card-heading">
										<h3>Listado General de Productos Fabricados</h3>
										<p><a class="btn btn-primary btn-lg" href="/administrador/nueva-fabricacion">Añadir</a></p>
									</div>
									<div class="card-body">
										<table class="table table-striped">
											<thead>
												<tr>
											    	<th>Nombre</th>
													<th>Descripcion</th>
													<th>Codigo</th>
													<th>Paciente</th>
													<th>Responsable</th>
													<th>Estado</th>
											        <th>Acciones</th>
												</tr>
											</thead>
											<tbody>
												<tr th:each="fabricacion : ${fabricaciones}">
													<td th:text="${fabricacion.nombre}"></td>
													<td th:text="${fabricacion.descripcion}"></td>
													<td th:text="${fabricacion.codigo.codigo}"></td>
													<td th:text="${fabricacion.paciente}"></td>
													<td th:text="${fabricacion.responsable}"></td>
													<td th:text="${fabricacion.estado}"></td>
													<td>
														<a th:href="/ver/pedido-taller-producto/{id}(id=${fabricacion.id})" class="btn btn-info btn-sm">Ver Pedido</a>
														<a th:href="/ver/fabricacion/{id}(id=${fabricacion.id})" class="btn btn-info btn-sm">Ver Hoja de Taller</a>
														<a th:href="/editar/fabricacion/{id}(id=${fabricacion.id})" class="btn btn-warning btn-sm">Editar</a>
														<a th:href="/cambio/codigo/{id}/{categoria}(id=${producto.id}, categoria='fabricacion')" class="btn btn-info btn-sm">Reasignar Codigo</a>
													</td>
												</tr>
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