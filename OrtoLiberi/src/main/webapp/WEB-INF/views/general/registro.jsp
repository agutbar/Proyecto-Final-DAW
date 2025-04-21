<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta name="author" content="Ana Gutiérrez Barón"/>
    <title>OrtoLiberi - Pagina de Registro</title>
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
                <a class="navbar-brand" href="/"><img src="../../../../resources/static/img/Logo.png" alt="Logo de la empresa" title="Logo de la empresa"/></a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavaltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse navbar-right" id="navbarNavAltMarkup">
                    <ul class="nav navbar-nav">
                        <li><a class="nav-item nav-link" href="#" data-bs-toggle="modal" data-bs-target="#modalConstruccion">Sobre Nosotros<span class="sr-only">(current)</span></a></li>
                        <li><a class="nav-item nav-link" href="#" data-bs-toggle="modal" data-bs-target="#modalConstruccion">Tienda</a></li>
                        <li><a class="nav-item nav-link" href="/general/trabajo">Trabaja con Nosotros</a></li>
                        <li><a class="nav-item nav-link" href="#" data-bs-toggle="modal" data-bs-target="#modalAdministracion">Administracion</a></li>
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
                <li class="breadcrumb-item active" aria-current="page">Crear Nuevo Usuario</li>
            </ol>
        </nav>
    </div>

    <section class="wrap" id="new-user">
        <div class="container">
            <h1>Crear Nuevo Usuario</h1>
            <p class="lead">Los datos que aparecen en la creacion del perfil corresponden al padre/madre/tutor legal, en ningun momento seran los del menor</p>
            <div class="card">
                <div class="card-body">
                    <form>
                        <div class="form-group">
                            <label for="inputNombre">Nombre</label>
                            <input type="text" class="form-control" id="inputNombre" placeholder="Escribe tu nombre..."/>
                        </div>
                        <div class="form-group">
                            <label for="inputApellido">Apellido</label>
                            <input type="text" class="form-control" id="inputApellido" placeholder="Escribe tus apellidos..."/>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail">Email</label>
                            <input type="email" class="form-control" id="inputEmail" placeholder="Escribe un email..."/>
                        </div>
                        <div class="form-group">
                            <label for="inputTelefono">Numero de Telefono</label>
                            <input type="number" class="form-control" id="inputTelefono" placeholder="Escribe tu número de telefono..."/>
                        </div>
                        <div class="form-group">
                            <label for="inputApellido">Direccion</label>
                            <input type="text" class="form-control" id="inputApellido" placeholder="Escribe tu direcccion..."/>
                        </div>
                        <div class="form-group">
                            <label for="inputUser">Usuario</label>
                            <input type="text" class="form-control" id="inputUser" placeholder="Escribe tu usuario..."/>
                        </div>
                        <div class="form-group">
                            <label for="inputPassword">Contraseña</label>
                            <input type="password" class="form-control" id="inputPassword" placeholder="Escribe tu contraseña..."/>
                        </div>
                        <button type="submit" class="btn btn-success btn-block"><a href="/general/personal">Crear Cuenta</a></button>
                        <button type="submit" class="btn btn-success btn-block"><a href="/general/acceso">Ya Tengo Cuenta</a></button>
                    </form>
                </div>
            </div>
        </div>
    </section>

    <footer id="footer">
        <div class="container-fluid">
            <p><a href="#"><i class="fa-brands fa-facebook"></i></a> || <a href="#"><i class="fa-brands fa-instagram"></i></a> || <a href="#"><i class="fa-brands fa-twitter"></i></a> &lt;------------- <span>OrtoLiberi</span> -------------&gt; <span><em>Dejar a los niños ser niños</em></span></p>
        </div>
    </footer>

    <!--Ventana Modal-->

    <div class="modal fade" id="modalConstruccion"> <!--Ventana Modal de Aviso-->
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <p>Esta pagina está en construccion</p>
                </div>
                <div class="modal-body">
                    <form>
                        <button type="submit" class="btn btn-success btn-block"><a href="/general/registro">Volver</a></button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="modalAdministracion"> <!--Ventana Modal de Acceso a Administraccion-->
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <p>Acceso Restringido a Personal Autorizado</p>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="form-group">
                            <label for="inputCodigo">Codigo de Empleado</label>
                            <input type="text" class="form-control" id="inputCodigo" placeholder="Escribe tu codigo..."/>
                        </div>
                        <div class="form-group">
                            <label for="inputPassword">Contraseña</label>
                            <input type="password" class="form-control" id="inputPassword" placeholder="Escribe tu contraseña..."/>
                        </div>
                        <button type="submit" class="btn btn-success btn-block"><a href="/general/administracion">Acceder</a></button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>