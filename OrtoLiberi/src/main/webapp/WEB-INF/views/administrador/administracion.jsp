<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta name="author" content="Ana Gutiérrez Barón"/>
    <title>OrtoLiberi - Pagina de Administracción</title>
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
                <p>Empresa de ortopedia especializada en la atencion a la infancia, fabricamos y adaptamos productos ortoprotesicos para niños y adolescentes</p>
            </div>
        </div>
    </section>

    <div class="container">
        <div class="row">
            <nav class="col-12" aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item active" aria-current="page">Home</li>
                </ol>
            </nav>
            <div class="col-3" id="izquierda-admin">
                <h4>Fabricaciones Pendientes</h4>
                <p id="boton"><a class="btn btn-warning btn-lg" href="#" data-bs-toggle="modal" data-bs-target="#modalConstruccion">Ver Mas &raquo;</a></p>
            </div>
            <div class="col-6" id="centro-admin">
                <h4>Pedidos Por Recibir</h4>
                <p id="boton"><a class="btn btn-warning btn-lg" href="#" data-bs-toggle="modal" data-bs-target="#modalConstruccion">Ver Mas &raquo;</a></p>
            </div>
            <div class="col-3" id="derecha-admin">
                <h4>Trabajadores No Disponibles</h4>
                <p id="boton"><a class="btn btn-warning btn-lg" href="#" data-bs-toggle="modal" data-bs-target="#modalConstruccion">Ver Mas &raquo;</a></p>
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
                        <button type="submit" class="btn btn-success btn-block"><a href="/administrador/inicio">Volver</a></button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>