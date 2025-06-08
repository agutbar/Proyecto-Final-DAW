<%@ page contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
						<li><a class="nav-item nav-link" href="/administrador/taller"><i class="fa-solid fa-industry"></i>Taller</a></li>
						<li><a class="nav-item nav-link" href="/administrador/bajas"><i class="fa-solid fa-address-card"></i>Bajas</a></li>
						<li><a class="nav-item nav-link" href="/administrador/codigos"><i class="fa-regular fa-file-code"></i>Codigos SAS</a></li>
						<li><a class="nav-item nav-link" href="/administrador/agenda"><i class="fa-solid fa-calendar-week"></i>Agenda</a></li>
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
											<a class="nav-link" id="ver-proveedores" data-bs-toggle="tab" href="#proveedores" role="tab" aria-controls="proveedores" aria-selected="false">Proveedores</a>
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
														<c:forEach var="cliente" items="${clientes}">
													    	<tr>
													            <td>${cliente.nombre}</td>
																<td>${cliente.apellidos}</td>
																<td>${cliente.telefono}</td>
																<td>${cliente.direccion}</td>
																<td>${cliente.correo}</td>
																<td>${cliente.usuario}</td>
													            <td>
																	<a href="/eliminar/cliente/${cliente.id}" class="btn btn-danger btn-sm">Dar de Baja</a>
																	<a href="/cambio/password${cliente.id}" class="btn btn-warning btn-sm">Reestablecer Contraseña</a>
													            </td>
													        </tr>
														</c:forEach>
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
														<c:forEach var="paciente" items="${pacientes}">
															<tr>
																<td>${paciente.nombre}</td>
																<td>${paciente.apellidos}</td>
																<td>${paciente.nacimiento}</td>
																<td>${paciente.tutor.nombre} ${paciente.tutor.apellidos}</td>
																<td>
																	<a href="/eliminar/paciente/${paciente.id}" class="btn btn-danger btn-sm">Dar de Baja</a>
																	<a href="/cambio/tutor${paciente.id}" class="btn btn-warning btn-sm">Reasignar Tutor</a>
																</td>
															</tr>
														</c:forEach>
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
														<c:forEach var="trabajador" items="${trabajadores}">
															<tr>
																<td>${trabajador.nombre}</td>
																<td>${trabajador.apellidos}</td>
																<td>${trabajador.nacimiento}</td>
																<td>${trabajador.telefono}</td>
																<td>${trabajador.direccion}</td>
																<td>${trabajador.correo}</td>
																<td>${trabajador.codigo}</td>
																<td>
																	<a href="/administrador/editar-trabajador${trabajador.id}" class="btn btn-info btn-sm">Editar</a>
																	<a href="/eliminar/trabajadores/${trabajador.id}" class="btn btn-danger btn-sm">Sacar de la lista</a>
																	<a href="/cambio/clave${cliente.id}" class="btn btn-warning btn-sm">Reestablecer Contraseña</a>
																</td>
															</tr>
														</c:forEach>
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
															<th>Correo Electronico</th>
															<th>Fecha de Registro</th>
															<th>Acciones</th>
														</tr>
													</thead>
													<tbody>
														<c:forEach var="solicitante" items="${solicitantes}">
															<tr>
																<td>${solicitante.nombre}</td>
																<td>${solicitante.correo}</td>
																<td>${solicitante.registro}</td>
																<td>
																	<a href="/descargar/curriculum/${solicitante.id}" class="btn btn-info btn-sm">Descargar Curriculum</a>
																	<a href="/eliminar/solicitante/${solicitante.id}" class="btn btn-danger btn-sm">Eliminar</a>
																</td>
															</tr>
														</c:forEach>
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
															<th>CIF</th>
															<th>Nombre</th>
															<th>Teléfono</th>
															<th>Correo de Contacto</th>
															<th>Estado</th>
															<th>Acciones</th>
														</tr>
													</thead>
													<tbody>
														<c:forEach var="proveedor" items="${proveedores}">
															<tr>
																<td>${proveedor.cif}</td>
																<td>${proveedor.nombre}</td>
																<td>${proveedor.telefono}</td>
																<td>${proveedor.correo}</td>
																<td>${proveedor.estado}</td>
																<td>
																	<a href="/administrador/editar-proveedor${proveedor.id}" class="btn btn-info btn-sm">Editar</a>
																	<a href="/estado/proveedor${proveedor.id}" class="btn btn-warning btn-sm">Cambiar Estado</a>
																	<a href="/eliminar/proveedor/${proveedor.id}" class="btn btn-danger btn-sm">Eliminar</a>
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
						</div>
				</section>
			</nav>
		</div>
	</div>
</body>
</html>