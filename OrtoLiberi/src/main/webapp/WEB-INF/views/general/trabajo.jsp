<%@ page contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta name="author" content="Ana Gutiérrez Barón"/>
    <title>OrtoLiberi - Pagina de Solicitud de Empleo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="../css/general.css">
    <link href='https://fonts.googleapis.com/css?family=MedievalSharp' rel='stylesheet'> <!--Fuente para CSS-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"> <!--Iconos-->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
</head>
<body>
    <header>
        <nav class="navbar fixed-top navbar-expand-lg navbar-light">
            <div class="container">
                <a class="navbar-brand" href="/"><img src="../img/Logo.png" alt="Logo de la empresa" title="Logo de la empresa"/></a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavaltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse navbar-right" id="navbarNavAltMarkup">
                    <ul class="nav navbar-nav">
                        <li><a class="nav-item nav-link" href="#" data-bs-toggle="modal" data-bs-target="#modalConstruccion">Sobre Nosotros<span class="sr-only">(current)</span></a></li>
                        <li><a class="nav-item nav-link" href="#" data-bs-toggle="modal" data-bs-target="#modalConstruccion">Tienda</a></li>
                        <li><a class="nav-item nav-link" href="#" data-bs-toggle="modal" data-bs-target="#modalPerfil">Zona Personal</a></li>
                        <li><a class="nav-item nav-link" href="/general/trabajadores">Administracion</a></li>
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
                <li class="breadcrumb-item active" aria-current="page">Solicitud de Trabajo</li>
            </ol>
        </nav>
    </div>

    <section class="wrap" id="ask-for-a-job">
        <div class="container">
            <h1>Solicitar Trabajo</h1>
            <p class="lead">Aqui podras enviar tu curriculum para que tengamos en cuanta tu perfil si tenemos una vacante en nuestro equipo</p>
            <div class="card">
                <div class="card-header">
                    <h3>Mi Perfil</h3>
                </div>
                <div class="card-body">
                    <form id="formulario_registro_solicitud_trabajo" method="post" action="/formulario/solicitud">
                        <div class="form-group">
                            <label for="inputProfileNombre">Nombre Completo:</label>
                            <input type="text" class="form-control" id="inputProfileNombre" placeholder="Escribe tu nombre..." required/>
							<span class="error-formulario" id="errorProfileNombre" style="font-style: italic; color: red;"></span>
                        </div>
                        <div class="form-group">
                            <label for="inputProfileEmail">Correo Electronico de Contacto:</label>
                            <input type="email" class="form-control" id="inputProfileEmail" placeholder="Escribe tu correo..." required/>
							<span class="error-formulario" id="errorProfileEmail" style="font-style: italic; color: red;"></span>
                        </div>
                        <div class="form-group">
                            <label for="inputProfileCV">Curriculum:</label>
                            <input type="file" class="form-control" id="inputProfileCV" placeholder="Adjunta el curriculum..." required/>
							<span class="error-formulario" id="errorProfileCV" style="font-style: italic; color: red;"></span>
                        </div>
						<div class="form-group">
							<input type="checkbox" id="inputProfileLPD" value="Ley-Proteccion-Datos" required/>
							<label for="inputProfileLPD">Doy mi consentimiento para que esta web almacene la información que envío para que puedan responder a mi petición.</label> <br/>
							<span class="error-formulario" id="errorProfileLPD" style="font-style: italic; color: red;"></span>
						</div>
                        <div class="form-group">
                            <p><em>Al pulsar el boton de enviar, tenga en cuenta que acepta que su curriculum y sus datos sean tenidos en cuenta para una futura propuesta de trabajo, todo ello bajo la Ley de Proteccion de Datos</em></p>
                        </div>
                        <button type="button" class="btn btn-success" id="registrar_solicitud">Enviar Solicitud</button>
                    </form>
					<c:if test="${not empty error}">
						<div class="error" style="font-style: italic; color: red;">${error}</div>
					</c:if>
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

    <div class="modal fade" id="modalPerfil"> <!--Ventana Modal de Acceso a la Zona Personal-->
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <p>Elija una de estas dos opciones</p>
                </div>
                <div class="modal-body">
                    <form>
                        <button type="submit" class="btn btn-success btn-block"><a href="/general/acceso">Ya tengo cuenta</a></button>
                        <button type="submit" class="btn btn-success btn-block"><a href="/general/registro">Quiero crear una cuenta nueva</a></button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="modalConstruccion"> <!--Ventana Modal de Aviso-->
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <p>Esta pagina está en construccion</p>
                </div>
                <div class="modal-body">
                    <form>
                        <button type="submit" class="btn btn-success btn-block"><a href="/general/trabajo">Volver</a></button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="modalConfirmacion"> <!--Ventana Modal de Confirmación-->
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <p>El Curriculum ha sido enviado correctamente</p>
                </div>
                <div class="modal-body">
                    <form>
                        <button type="submit" class="btn btn-success btn-block"><a href="/">Volver a la página principal</a></button>
                    </form>
                </div>
            </div>
        </div>
    </div>
	<script src="../js/validacion_registro_solicitud_trabajo.js"></script>
</body>
</html>