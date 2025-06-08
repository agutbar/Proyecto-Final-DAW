<%@ page contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta name="author" content="Ana Gutiérrez Barón"/>
    <title>OrtoLiberi - Pagina del Perfil</title>
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

    <div class="container">
        <div class="row">
            <nav class="col-12" aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item active" aria-current="page">Perfil Personal</li>
                </ol>
            </nav>
            <div class="col-3" id="izquierda-regis">
                <h4>Proximas Citas</h4>
				<c:if test="${empty listado_citas}">
					<p>No tiene ninguna cita programada</p>					
				</c:if>
				<c:if test="${not empty listado_citas}">	
                	<dl class="row">
						<c:forEach var="revision" items="${listado_citas}">
		                    <dt class="col-sm-3">Fecha</dt>
		                    <dd class="col-sm-9">${revision.cita.fecha} // ${revision.cita.hora}</dd>
		
		                    <dt class="col-sm-3">Tecnico</dt>
		                    <dd class="col-sm-9">${revision.cita.tecnico.nombre} ${revision.cita.tecnico.apellidos}</dd>
							
							<dt class="col-sm-3">Menor</dt>
							<dd class="col-sm-9">${revision.paciente.nombre}</dd>
		    
		                    <dt class="col-sm-3">Motivo</dt>
		                    <dd class="col-sm-9">${revision.descripcion}</dd>
						</c:forEach>
                	</dl>
				</c:if>
                <p id="boton"><a class="btn btn-warning btn-lg" href="/registrado/citas">Ver todas &raquo;</a></p>
            </div>
            <div class="col-6" id="centro-regis">
                <h4>Ultimas compras</h4>
				<c:if test="${empty compras}">
					<p>No tiene ninguna compra registrada</p>					
				</c:if>
				<c:if test="${not empty compras}">	
					<dl class="row">
						<c:forEach var="compra" items="${compras}" begin="0" end="2">
							<dt class="col-sm-3">Fecha</dt>
						    <dd class="col-sm-9">${compra.fecha}</dd>
						
						    <dt class="col-sm-3">Tipo</dt>
						    <dd class="col-sm-9">${compra.tipo}</dd>
						</c:forEach>
					</dl>
				</c:if>
                <p id="boton"><a class="btn btn-warning btn-lg" href="/registrado/compras">Ver todas &raquo;</a></p>
            </div>
            <div class="col-3" id="derecha-regis">
                <h4>Menores a su cargo</h4>
				<c:if test="${empty menores}">
					<p>No tiene ningun menor a su cargo</p>					
				</c:if>
				<c:if test="${not empty menores}">
	                <dl class="row">
						<c:forEach var="menor" items="${menores}">
		                    <dt class="col-sm-3">Nombre</dt>
		                    <dd class="col-sm-9">${menor.nombre}</dd>
		    
		                    <dt class="col-sm-3">Fecha de Nacimiento</dt>
		                    <dd class="col-sm-9">${menor.nacimiento}</dd>
						</c:forEach>
	                </dl>
				</c:if>
                <p id="boton"><a class="btn btn-warning btn-lg" href="/registrado/datos">Ver datos personales &raquo;</a></p>
            </div>
        </div>
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
                        <button type="submit" class="btn btn-success btn-block"><a href="/registrado">Volver</a></button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>