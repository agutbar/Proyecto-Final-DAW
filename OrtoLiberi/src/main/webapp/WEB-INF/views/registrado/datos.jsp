<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta name="author" content="Ana Gutiérrez Barón"/>
    <title>OrtoLiberi - Pagina de Datos del Perfil</title>
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
                <a class="navbar-brand" href="perfil.jsp"><img src="../../static/img/Logo.png" alt="Logo de la empresa" title="Logo de la empresa"/></a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavaltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse navbar-right" id="navbarNavAltMarkup">
                    <ul class="nav navbar-nav">
                        <li><a class="nav-item nav-link" href="compras.jsp"><i class="fa-solid fa-bag-shopping"></i>Compras</a></li>
                        <li><a class="nav-item nav-link" href="citas.jsp"><i class="fa-regular fa-calendar"></i>Citas</a></li>
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

    <section class="wrap" id="personal-data">
        <div class="container">
            <h1>Datos Personales</h1>
            <p>
                <a id="btnTabAdmin" href="#" aria-controls="add-list" data-bs-toggle="modal" data-bs-target="#modalEdicion" class="btn btn-info">Editar Datos</a>
            </p>
            <dl class="row">
                <dt class="col-sm-3">Nombre Completo</dt>
                <dd class="col-sm-9">Nombre + Apellido + Apellido</dd>

                <dt class="col-sm-3">Email</dt>
                <dd class="col-sm-9">usuario@dominio.fin</dd>

                <dt class="col-sm-3">Teléfono de Contacto</dt>
                <dd class="col-sm-9">000000000</dd>

                <dt class="col-sm-3">Direccion</dt>
                <dd class="col-sm-9">Calle () - Nº 00 - 00000 (Ciudad)</dd>
            </dl>
        </div>
    </section>

    <section class="wrap" id="children">
        <div class="container">
            <h1>Menores a su cargo</h1>
            <p>
                <a id="btnTabAdmin" href="#" aria-controls="add-list" data-bs-toggle="modal" data-bs-target="#modalNuevoMenor" class="btn btn-info">Añadir Nuevo Menor</a>
            </p>
            <div class="row">
                <div class="col-sm-8 offst-sm-2">
                    <ul class="nav nav-tabs" id="myTab" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link active" id="add-list" data-bs-toggle="tab" href="#h1" role="tab" aria-controls="home" aria-selected="true">Hijo 1</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="add-section" data-bs-toggle="tab" href="#h2" role="tab" aria-controls="profile" aria-selected="false">Hijo 2</a>
                        </li>
                    </ul>
                    <div class="tab-content" id="myTabContent">
                        <div class="tab-pane fade show active" id="h1" role="tabpanel" aria-labelledby="add-list">
                            <dl class="row">
                                <dt class="col-sm-3">Nombre Completo</dt>
                                <dd class="col-sm-9">Nombre + Apellido + Apellido</dd>
                
                                <dt class="col-sm-3">Edad</dt>
                                <dd class="col-sm-9">00</dd>
                            </dl>
                            <p>
                                <a id="btnTabAdmin" href="#" aria-controls="add-list" data-bs-toggle="modal" data-bs-target="#modalConstruccion" class="btn btn-info">Acceder a Su Ficha</a>
                            </p>
                        </div>
                        <div class="tab-pane fade" id="h2" role="tabpanel" aria-labelledby="add-section">
                            <dl class="row">
                                <dt class="col-sm-3">Nombre Completo</dt>
                                <dd class="col-sm-9">Nombre + Apellido + Apellido</dd>
                
                                <dt class="col-sm-3">Edad</dt>
                                <dd class="col-sm-9">00</dd>
                            </dl>
                            <p>
                                <a id="btnTabAdmin" href="#" aria-controls="add-list" data-bs-toggle="modal" data-bs-target="#modalConstruccion" class="btn btn-info">Acceder a Su Ficha</a>
                            </p>
                        </div>
                    </div>
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

    <div class="modal fade" id="modalConstruccion"> <!--Ventana Modal de Aviso-->
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <p>Esta pagina está en construccion</p>
                </div>
                <div class="modal-body">
                    <form>
                        <button type="submit" class="btn btn-success btn-block"><a href="datos.jsp">Volver</a></button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="modalEdicion"> <!--Ventana Modal de Edicion de Datos-->
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <h2>Editar Datos Personales</h2>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="form-group">
                            <label for="inputEmail">Email</label>
                            <input type="email" class="form-control" id="inputEmail" placeholder="Escribe un email..."/>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail">Direccion</label>
                            <input type="text" class="form-control" id="inputEmail" placeholder="Escribe una direccion..."/>
                        </div>
                        <div class="form-group">
                            <label for="inputTelefono">Numero de Telefono</label>
                            <input type="number" class="form-control" id="inputTelefono" placeholder="Escribe tu número de telefono..."/>
                        </div>
                        <div class="form-group">
                            <label for="inputUser">Usuario</label>
                            <input type="text" class="form-control" id="inputUser" placeholder="Escribe tu usuario..."/>
                        </div>
                        <div class="form-group">
                            <label for="inputPassword">Contraseña</label>
                            <input type="password" class="form-control" id="inputPassword" placeholder="Escribe tu contraseña..."/>
                        </div>
                        <button type="submit" class="btn btn-success btn-block"><a href="#" data-bs-toggle="modal" data-bs-target="#modalConfirmacionEdicion">Editar</a></button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="modalNuevoMenor"> <!--Ventana Modal de Creacion de un nuevo menor-->
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <h2>Añadir Nuevo Menor a su cargo</h2>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="form-group">
                            <label for="inputNombre">Nombre</label>
                            <input type="text" class="form-control" id="inputNombre" placeholder="Escribe su nombre..."/>
                        </div>
                        <div class="form-group">
                            <label for="inputApellido">Apellido</label>
                            <input type="text" class="form-control" id="inputApellido" placeholder="Escribe sus apellidos..."/>
                        </div>
                        <div class="form-group">
                            <label for="inputEdad">Fecha de Nacimiento</label>
                            <input type="date" class="form-control" id="inputEdad"/>
                        </div>
                        <button type="submit" class="btn btn-success btn-block"><a href="#" data-bs-toggle="modal" data-bs-target="#modalConfirmacionNuevoMenor">Añadir</a></button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="modalConfirmacionEdicion"> <!--Ventana Modal de Confirmación de Edicion de Datos-->
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <p>Los datos se han editado correctamente</p>
                </div>
                <div class="modal-body">
                    <form>
                        <button type="submit" class="btn btn-success btn-block"><a href="datos.jsp">Volver a la página personal</a></button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="modalConfirmacionNuevoMenor"> <!--Ventana Modal de Confirmación de la Creacion de un nuevo Menor-->
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <p>El nuevo menor ha sido creado correctamente</p>
                </div>
                <div class="modal-body">
                    <form>
                        <button type="submit" class="btn btn-success btn-block"><a href="datos.jsp">Volver a la página personal</a></button>
                    </form>
                </div>
            </div>
        </div>
    </div>

</body>
</html>