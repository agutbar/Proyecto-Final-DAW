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
				                    </ul>
				                    <div class="tab-content" id="myTabContent">
				                        <div class="tab-pane fade" id="usuarios" role="tabpanel" aria-labelledby="ver-usuarios">
				                            <div class="card-heading">
                                            	<h3>Listado de Usuarios Registrados</h3>
                                                 <p><a class="btn btn-primary btn-lg" href="#" data-bs-toggle="modal" data-bs-target="#modalConstruccion">Añadir</a></p>
				                            </div>
				                            <div class="card-body">
												<table class="table table-striped">
                                                	<thead>
                                                    	<tr>
                                                        	<th>Nombre</th>
                                                            <th>Acciones</th>
												        </tr>
												    </thead>
												    <tbody>
												    	<tr th:each="cliente : ${clientes}">
												            <td th:text="${cliente.nombre}"></td>
												            <td>
												            	<a th:href="@{/clientes/editar/{id}(id=${cliente.id})}" class="btn btn-warning btn-sm">Editar</a>
												                <a th:href="@{/clientes/eliminar/{id}(id=${cliente.id})}" class="btn btn-danger btn-sm">Eliminar</a>
												                <a th:href="@{/clientes/{id}/pedidos(id=${cliente.id})}" class="btn btn-info btn-sm">Ver</a>
												            </td>
												         </tr>
												    </tbody>
												</table>
				                            </div>
				                        </div>
				                        <div class="tab-pane fade" id="pacientes" role="tabpanel" aria-labelledby="ver-pacientes">
				                            <div class="card-body" id="form-add-section">
				                                <h3>Añadir nueva seccion</h3>
				                                <form>
				                                    <div class="form-group">
				                                        <label for="inputSectionTitle">Título de la Sección:</label>
				                                        <input type="text" class="form-control" id="inputSectionTitle" placeholder="Escribe el título de la seccion..."/>
				                                    </div>
				                                    <button type="submit" class="btn btn-success">Añadir </button> o <a href="">Cancelar</a>
				                                </form>
				                            </div>
				                        </div>
				                        <div class="tab-pane fade" id="trabajadores" role="tabpanel" aria-labelledby="ver-trabajadores">
				                            <div class="card-body" id="form-add-lecture">
				                                <h3>Añadir nueva clase</h3>
				                                <form>
				                                    <div class="form-group">
				                                        <label for="inputLectureTitle">Título:</label>
				                                        <input type="text" class="form-control" id="inputLectureTitle" placeholder="Escribe el titulo de la lección"/>
				                                    </div>
				                                    <div class="form-group">
				                                        <label for="inputLectureDescription">Descripción:</label>
				                                        <textarea type="text" class="form-control" id="inputLectureDescription" placeholder="Escribe la descripción de la lección" rows="3"></textarea>
				                                    </div>
				                                    <div class="form-group">
				                                        <label for="inputLectureVideo">Título:</label>
				                                        <input type="text" class="form-control" id="inputLectureVideo" placeholder="Escribe la URL de Youtube del video"/>
				                                    </div>
				                                    <div class="form-group">
				                                        <label for="inputLectureDuration">Duración de la leccion:</label>
				                                        <input type="text" class="form-control" id="inputLectureDuration" placeholder="Escribe los minutos y segundos que dura el video con formato MM:SS. Ej. 05:33"/>
				                                    </div>
				                                    <div class="form-group">
				                                        <label for="inputLectureSectio">Seccion:</label>
				                                        <input type="text" class="form-control" id="inputLectureSection" placeholder="Escribe la seccion a la que pertenece esta clase"/>
				                                    </div>
				                                    <button type="submit" class="btn btn-info">Añadir</button> o <a href="">Finalizar</a>
				                                </form>
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