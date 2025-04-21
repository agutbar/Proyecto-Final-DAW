<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta name="author" content="Ana Gutierrez Baron"/>
    <title>OrtoLiberi - Pagina de Gestion de Compras y Pedidos</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="../../static/css/registrado.css">
    <link href='https://fonts.googleapis.com/css?family=MedievalSharp' rel='stylesheet'> <!--Fuente para CSS-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"> <!--Iconos-->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
</head>
<body>
    <header>
        <nav class="navbar fixed-top navbar-expand-lg navbar-light">
            <div class="container">
                <a class="navbar-brand" href="perfil.jsp"><img src="../../static/img/Logo.png" alt="Logo de la empresa" title="Logo de la empresa"/></a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavaltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse navbar-right" id="navbarNavAltMarkup">
                    <ul class="nav navbar-nav">
                        <li><a class="nav-item nav-link" href="citas.jsp"><i class="fa-regular fa-calendar"></i>Citas</a></li>
                        <li><a class="nav-item nav-link" href="datos.jsp"><i class="fa fa-user"></i>Datos Personales</a></li>
                        <li><a class="nav-item nav-link" href="../../static/index.html"><i class="fa fa-sign-out"></i>Salir</a></li>
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
                    <li class="breadcrumb-item active" aria-current="page">Compras y Pedidos</li>
                </ol>
				<section class="wrap" id="citas">
					<div class="container">
				    	<div class="row">
                        	<h2>Listados de Compras y de Pedidos</h2>
							<ul class="nav nav-tabs" id="myTab" role="tablist">
								<li class="nav-item">
									<a class="nav-link" id="compras-realizadas" data-bs-toggle="tab" href="#comprasr" role="tab" aria-controls="comprasr" aria-selected="false">Compras Realizadas</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" id="pedidos-realizados" data-bs-toggle="tab" href="#pedidosr" role="tab" aria-controls="pedidosr" aria-selected="false">Pedidos Realizados</a>
								</li>
							</ul>
							<div class="tab-content" id="myTabContent">
								<div class="tab-pane fade" id="comprasr" role="tabpanel" aria-labelledby="compras-realizadas">
									<div class="card-heading">
							        	<h3>Listado de Compras Realizadas</h3>
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
														<a th:href="@{/clientes/{id}/pedidos(id=${cliente.id})}" class="btn btn-info btn-sm">Ver</a>
														<a th:href="@{/clientes/editar/{id}(id=${cliente.id})}" class="btn btn-warning btn-sm">Editar</a>
														<a th:href="@{/clientes/eliminar/{id}(id=${cliente.id})}" class="btn btn-danger btn-sm">Cancelar</a>
													</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
								<div class="tab-pane fade" id="pedidosr" role="tabpanel" aria-labelledby="pedidos-realizados">
									<div class="card-heading">
										<h3>Listado de Pedidos Realizados</h3>
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
														<a th:href="@{/clientes/{id}/pedidos(id=${cliente.id})}" class="btn btn-info btn-sm">Ver</a>
														<a th:href="@{/clientes/editar/{id}(id=${cliente.id})}" class="btn btn-warning btn-sm">Editar</a>
														<a th:href="@{/clientes/eliminar/{id}(id=${cliente.id})}" class="btn btn-danger btn-sm">Cancelar</a>
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