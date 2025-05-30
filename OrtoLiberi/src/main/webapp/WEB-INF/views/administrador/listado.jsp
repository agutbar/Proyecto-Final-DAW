<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta name="author" content="Ana Gutierrez Baron"/>
    <title>OrtoLiberi - Pagina de Listado de Personas relacionadas con la empresa</title>
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
                    <li class="breadcrumb-item active" aria-current="page">Listados</li>
                </ol>
				<section class="wrap" id="admin-course">
					<div class="container">
				    	<div class="row">
				        	<div class="col-sm-8 offst-sm-2">
				            	<ul class="nav nav-tabs" id="myTab" role="tablist">
				                	<li class="nav-item">
				                       <a class="nav-link" id="ver-usuarios" data-bs-toggle="tab" href="#usuarios" role="tab" aria-controls="usuarios" aria-selected="false">Usuarios</a>
				                    </li>
				                        <li class="nav-item">
				                            <a class="nav-link" id="ver-pacientes" data-bs-toggle="tab" href="#pacientes" role="tab" aria-controls="pacientes" aria-selected="false">Pacientes</a>
				                        </li>
				                        <li class="nav-item">
				                            <a class="nav-link" id="ver-trabajadores" data-bs-toggle="tab" href="#trabajadores" role="tab" aria-controls="trabajadores" aria-selected="false">Trabajadores</a>
				                        </li>
										<li class="nav-item">
											<a class="nav-link" id="ver-solicitantes" data-bs-toggle="tab" href="#solicitantes" role="tab" aria-controls="solicitantes" aria-selected="false">Solicitantes de Empleo</a>
										</li>
										<li class="nav-item">
											<a class="nav-link" id="ver-proveedores" data-bs-toggle="tab" href="#preveedores" role="tab" aria-controls="proveedores" aria-selected="false">Proveedores</a>
										</li>
				                    </ul>
				                    <div class="tab-content" id="myTabContent">
				                        <div class="tab-pane fade" id="usuarios" role="tabpanel" aria-labelledby="ver-usuarios">
				                            <div class="card-heading">
                                            	<h3>Listado de Usuarios Registrados</h3>
				                            </div>
				                            <div class="card-body">
												<table class="table table-striped">
                                                	<thead>
                                                    	<tr>
                                                        	<th>Nombre</th>
															<th>Apellidos</th>
															<th>Telefono</th>
															<th>Direccion</th>
															<th>Correo</th>
															<th>Usuario</th>
                                                            <th>Acciones</th>
												        </tr>
												    </thead>
												    <tbody>
												    	<tr th:each="cliente : ${clientes}">
												            <td th:text="${cliente.nombre}"></td>
															<td th:text="${cliente.apellidos}"></td>
															<td th:text="${cliente.telefono}"></td>
															<td th:text="${cliente.direccion}"></td>
															<td th:text="${cliente.correo}"></td>
															<td th:text="${cliente.usuario}"></td>
												            <td>
												                <a th:href="/ver/cliente/{id}(id=${cliente.id})}" class="btn btn-info btn-sm">Ver</a>
																<a th:href="/eliminar/cliente/{id}(id=${cliente.id})}" class="btn btn-danger btn-sm">Dar de Baja</a>
																<a th:href="/cambio/password/{id}(id=${cliente.id})}" class="btn btn-warning btn-sm">Reestablecer Contraseña</a>
												            </td>
												         </tr>
												    </tbody>
												</table>
				                            </div>
				                        </div>
				                        <div class="tab-pane fade" id="pacientes" role="tabpanel" aria-labelledby="ver-pacientes">
											<div class="card-heading">
												<h3>Listado de Pacientes Registrados</h3>
											</div>
											<div class="card-body">
												<table class="table table-striped">
													<thead>
														<tr>
															<th>Nombre</th>
															<th>Apellidos</th>
															<th>Fecha de Nacimiento</th>
															<th>Tutor</th>
															<th>Acciones</th>
														</tr>
													</thead>
													<tbody>
														<tr th:each="paciente : ${pacientes}">
															<td th:text="${paciente.nombre}"></td>
															<td th:text="${paciente.apellidos}"></td>
															<td th:text="${paciente.nacimiento}"></td>
															<td th:text="${paciente.tutor.nombre} ${paciente.tutor.apellidos}"></td>
															<td>
																<a th:href="/ver/paciente/{id}(id=${paciente.id})}" class="btn btn-info btn-sm">Ver</a>
																<a th:href="/eliminar/paciente/{id}(id=${paciente.id})}" class="btn btn-danger btn-sm">Dar de Baja</a>
																<a th:href="/cambio/tutor/{id}(id=${paciente.id})}" class="btn btn-warning btn-sm">Reasignar Tutor</a>
															</td>
														</tr>
													</tbody>
												</table>
											</div>
				                        </div>
				                        <div class="tab-pane fade" id="trabajadores" role="tabpanel" aria-labelledby="ver-trabajadores">
											<div class="card-heading">
												<h3>Listado de Trabajadores Registrados</h3>
											    <p><a class="btn btn-primary btn-lg" href="/administrador/nuevo-trabajador">Añadir</a></p>
											</div>
											<div class="card-body">
												<table class="table table-striped">
											    	<thead>
											        	<tr>
											            	<th>Nombre</th>
															<th>Apellidos</th>
															<th>Fecha de Nacimiento</th>
															<th>Telefono</th>
															<th>Direccion</th>
															<th>Correo</th>
															<th>Codigo</th>
											                <th>Acciones</th>
														</tr>
													</thead>
													<tbody>
														<tr th:each="trabajador : ${trabajadores}">
															<td th:text="${trabajador.nombre}"></td>
															<td th:text="${trabajador.apellidos}"></td>
															<td th:text="${trabajador.nacimiento}"></td>
															<td th:text="${trabajador.telefono}"></td>
															<td th:text="${trabajador.direccion}"></td>
															<td th:text="${trabajador.correo}"></td>
															<td th:text="${trabajador.usuario}"></td>
															<td>
																<a th:href="/ver/trabajadores/{id}(id=${trabajador.id})}" class="btn btn-info btn-sm">Ver</a>
																<a th:href="/eliminar/trabajadores/{id}(id=${trabajador.id})}" class="btn btn-danger btn-sm">Sacar de la lista</a>
																<a th:href="/nueva/baja-trabajador/{id}(id=${trabajador.id})}" class="btn btn-warning btn-sm">Registrar Baja Temporal</a>
															</td>
														</tr>
													</tbody>
												</table>
											</div>
				                        </div>
										<div class="tab-pane fade" id="solicitantes" role="tabpanel" aria-labelledby="ver-solicitantes">
											<div class="card-heading">
												<h3>Listado de Solicitantes de Empleo Registrados</h3>
											</div>
											<div class="card-body">
												<table class="table table-striped">
													<thead>
														<tr>
															<th>Nombre</th>
															<th>Apellidos</th>
															<th>Fecha de Registro</th>
															<th>Acciones</th>
														</tr>
													</thead>
													<tbody>
														<tr th:each="solicitante : ${solicitantes}">
															<td th:text="${solicitante.nombre}"></td>
															<td th:text="${solicitante.apellidos}"></td>
															<td th:text="${solicitante.nacimiento}"></td>>
															<td>
																<a th:href="/descargar/curriculum/{id}(id=${solicitante.id})}" class="btn btn-info btn-sm">Descargar Curriculum</a>
																<a th:href="/eliminar/solicitante/{id}(id=${solicitante.id})}" class="btn btn-danger btn-sm">Eliminar</a>
															</td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
										<div class="tab-pane fade" id="proveedores" role="tabpanel" aria-labelledby="ver-proveedores">
											<div class="card-heading">
												<h3>Listado de Proveedores</h3>
												<p><a class="btn btn-primary btn-lg" href="/administrador/nuevo-proveedor">Añadir</a></p>
											</div>
											<div class="card-body">
												<table class="table table-striped">
													<thead>
														<tr>
															<th>Nombre</th>
															<th>Teléfono</th>
															<th>Correo de Contacto</th>
															<th>Estado</th>
															<th>Acciones</th>
														</tr>
													</thead>
													<tbody>
														<tr th:each="proveedor : ${proveedores}">
															<td th:text="${proveedor.nombre}"></td>
															<td th:text="${proveedor.telefono}"></td>
															<td th:text="${proveedor.correo}"></td>
															<td th:text="${proveedor.estado}"></td>>
															<td>
																<a th:href="/editar/proveedor/{id}(id=${proveedor.id})}" class="btn btn-info btn-sm">Editar</a>
																<a th:href="/estado/proveedor/{id}(id=${proveedor.id})}" class="btn btn-danger btn-sm">Cambiar Estado</a>
																<a th:href="/eliminar/proveedor/{id}(id=${proveedor.id})}" class="btn btn-danger btn-sm">Eliminar</a>
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
	</div>
</body>
</html>