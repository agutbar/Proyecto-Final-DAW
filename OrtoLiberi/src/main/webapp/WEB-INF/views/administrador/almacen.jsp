<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta name="author" content="Ana Gutiérrez Barón"/>
    <title>OrtoLiberi - Pagina de Almacen</title>
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
            </div>
        </div>
    </section>
	<div class="container">
	        <nav aria-label="breadcrumb">
	            <ol class="breadcrumb">
	                <li class="breadcrumb-item active" aria-current="page">Almacen</li>
	            </ol>   
	        </nav>
	    </div>

	    <section class="accordion" id="accordionAlmacen">
	        <p id="boton">
	            <a id="btnTabAdmin" href="#" aria-controls="add-list" data-bs-toggle="modal" data-bs-target="#modalNuevoProducto" class="btn btn-info">Añadir Producto</a>
	        </p>
	        <div class="accordion-item">
	            <h2 class="accordion-header">
	                <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOrtesis" aria-expanded="false" aria-controls="collapseOrtesis">Ortesis</button>
	            </h2>
	            <div id="collapseOrtesis" class="accordion-collapse collapse" data-bs-parent="#accordionAlmacen">
	                <div class="accordion-body">
	                    <section class="accordion" id="accordionOrtesis">
	                        <div class="accordion-item">
	                            <h2 class="accordion-header">
	                                <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseO-MI" aria-expanded="false" aria-controls="collapseO-MI">Miembro Inferior</button>
	                            </h2>
	                            <div id="collapseO-MI" class="accordion-collapse collapse" data-bs-parent="#accordionOrtesis">
	                                <div class="accordion-body">
	                                    <section class="accordion" id="accordionOrtesis-MiembroInferior">
	                                        <div class="accordion-item">
	                                            <h2 class="accordion-header">
	                                                <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseO-MI-Cadera" aria-expanded="true" aria-controls="collapseO-MI-Cadera">Cadera</button>
	                                            </h2>
	                                            <div id="collapseO-MI-Cadera" class="accordion-collapse collapse" data-bs-parent="#accordionOrtesis-MiembroInferior">
	                                                <div class="accordion-body">
	                                                    <table class="table table-success table-striped" id="tabla-O-MI-Cadera">
	                                                        <thead>
	                                                            <tr>
	                                                                <th>Nombre Comercial</th>
	                                                                <th>Marca</th>
	                                                                <th>Codigo SAS</th>
	                                                                <th>Nº Lote</th>
	                                                                <th>Talla</th>
	                                                                <th>Stock</th>
	                                                            </tr>
	                                                        </thead>
	                                                        <tbody>
	                                                            <tr>
	                                                                <td>xxxxxxxxx</td>
	                                                                <td>xxxx</td>
	                                                                <td>xx-0000x</td>
	                                                                <td>x0x0x0x0</td>
	                                                                <td>x</td>
	                                                                <td>0</td>
	                                                            </tr>
	                                                        </tbody>
	                                                    </table>
	                                                </div>
	                                            </div>
	                                        </div>
	                                    
	                                        <div class="accordion-item">
	                                            <h2 class="accordion-header">
	                                                <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseO-MI-Rodilla" aria-expanded="true" aria-controls="collapseO-MI-Rodilla">Rodilla</button>
	                                            </h2>
	                                            <div id="collapseO-MI-Rodilla" class="accordion-collapse collapse" data-bs-parent="#accordionOrtesis-MiembroInferior">
	                                                <div class="accordion-body">
	                                                    <table class="table table-success table-striped" id="tabla-O-MI-Rodilla">
	                                                        <thead>
	                                                            <tr>
	                                                                <th>Nombre Comercial</th>
	                                                                <th>Marca</th>
	                                                                <th>Codigo SAS</th>
	                                                                <th>Nº Lote</th>
	                                                                <th>Talla</th>
	                                                                <th>Stock</th>
	                                                            </tr>
	                                                        </thead>
	                                                        <tbody>
	                                                            <tr>
	                                                                <td>xxxxxxxxx</td>
	                                                                <td>xxxx</td>
	                                                                <td>xx-0000x</td>
	                                                                <td>x0x0x0x0</td>
	                                                                <td>x</td>
	                                                                <td>0</td>
	                                                            </tr>
	                                                        </tbody>
	                                                    </table>
	                                                </div>
	                                            </div>
	                                        </div>
	                                    
	                                        <div class="accordion-item">
	                                            <h2 class="accordion-header">
	                                                <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseO-MI-Tobillo" aria-expanded="true" aria-controls="collapseO-MI-Tobillo">Tobillo</button>
	                                            </h2>
	                                            <div id="collapseO-MI-Tobillo" class="accordion-collapse collapse" data-bs-parent="#accordionOrtesis-MiembroInferior">
	                                                <div class="accordion-body">
	                                                    <table class="table table-success table-striped" id="tabla-O-MI-Tobillo">
	                                                        <thead>
	                                                            <tr>
	                                                                <th>Nombre Comercial</th>
	                                                                <th>Marca</th>
	                                                                <th>Codigo SAS</th>
	                                                                <th>Nº Lote</th>
	                                                                <th>Talla</th>
	                                                                <th>Stock</th>
	                                                            </tr>
	                                                        </thead>
	                                                        <tbody>
	                                                            <tr>
	                                                                <td>xxxxxxxxx</td>
	                                                                <td>xxxx</td>
	                                                                <td>xx-0000x</td>
	                                                                <td>x0x0x0x0</td>
	                                                                <td>x</td>
	                                                                <td>0</td>
	                                                            </tr>
	                                                        </tbody>
	                                                    </table>
	                                                </div>
	                                            </div>
	                                        </div>
	                                        
	                                        <div class="accordion-item">
	                                            <h2 class="accordion-header">
	                                                <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseO-MI-Pie" aria-expanded="true" aria-controls="collapseO-MI-Pie">Pie</button>
	                                            </h2>
	                                            <div id="collapseO-MI-Pie" class="accordion-collapse collapse" data-bs-parent="#accordionOrtesis-MiembroInferior">
	                                                <div class="accordion-body">
	                                                    <table class="table table-success table-striped" id="tabla-O-MI-Pie">
	                                                        <thead>
	                                                            <tr>
	                                                                <th>Nombre Comercial</th>
	                                                                <th>Marca</th>
	                                                                <th>Codigo SAS</th>
	                                                                <th>Nº Lote</th>
	                                                                <th>Talla</th>
	                                                                <th>Stock</th>
	                                                            </tr>
	                                                        </thead>
	                                                        <tbody>
	                                                            <tr>
	                                                                <td>xxxxxxxxx</td>
	                                                                <td>xxxx</td>
	                                                                <td>xx-0000x</td>
	                                                                <td>x0x0x0x0</td>
	                                                                <td>x</td>
	                                                                <td>0</td>
	                                                            </tr>
	                                                        </tbody>
	                                                    </table>
	                                                </div>
	                                            </div>
	                                        </div>
	                                    </section>
	                                </div>
	                            </div>
	                        </div>
	                
	                        <div class="accordion-item">
	                            <h2 class="accordion-header">
	                                <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseO-MS" aria-expanded="false" aria-controls="collapseO-MS">Miembro Superior</button>
	                            </h2>
	                            <div id="collapseO-MS" class="accordion-collapse collapse" data-bs-parent="#accordionOrtesis">
	                                <div class="accordion-body">
	                                    <section class="accordion" id="accordionOrtesis-MiembroSuperior">
	                                        <div class="accordion-item">
	                                            <h2 class="accordion-header">
	                                                <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseO-MS-Hombro" aria-expanded="true" aria-controls="collapseO-MS-Hombro">Hombro</button>
	                                            </h2>
	                                            <div id="collapseO-MI-Cadera" class="accordion-collapse collapse" data-bs-parent="#accordionOrtesis-MiembroSuperior">
	                                                <div class="accordion-body">
	                                                    <table class="table table-success table-striped" id="tabla-O-MS-Hombro">
	                                                        <thead>
	                                                            <tr>
	                                                                <th>Nombre Comercial</th>
	                                                                <th>Marca</th>
	                                                                <th>Codigo SAS</th>
	                                                                <th>Nº Lote</th>
	                                                                <th>Talla</th>
	                                                                <th>Stock</th>
	                                                            </tr>
	                                                        </thead>
	                                                        <tbody>
	                                                            <tr>
	                                                                <td>xxxxxxxxx</td>
	                                                                <td>xxxx</td>
	                                                                <td>xx-0000x</td>
	                                                                <td>x0x0x0x0</td>
	                                                                <td>x</td>
	                                                                <td>0</td>
	                                                            </tr>
	                                                        </tbody>
	                                                    </table>
	                                                </div>
	                                            </div>
	                                        </div>
	                                    
	                                        <div class="accordion-item">
	                                            <h2 class="accordion-header">
	                                                <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseO-MS-Codo" aria-expanded="true" aria-controls="collapseO-MS-Codo">Codo</button>
	                                            </h2>
	                                            <div id="collapseO-MS-Codo" class="accordion-collapse collapse" data-bs-parent="#accordionOrtesis-MiembroSuperior">
	                                                <div class="accordion-body">
	                                                    <table class="table table-success table-striped" id="tabla-O-MS-Codo">
	                                                        <thead>
	                                                            <tr>
	                                                                <th>Nombre Comercial</th>
	                                                                <th>Marca</th>
	                                                                <th>Codigo SAS</th>
	                                                                <th>Nº Lote</th>
	                                                                <th>Talla</th>
	                                                                <th>Stock</th>
	                                                            </tr>
	                                                        </thead>
	                                                        <tbody>
	                                                            <tr>
	                                                                <td>xxxxxxxxx</td>
	                                                                <td>xxxx</td>
	                                                                <td>xx-0000x</td>
	                                                                <td>x0x0x0x0</td>
	                                                                <td>x</td>
	                                                                <td>0</td>
	                                                            </tr>
	                                                        </tbody>
	                                                    </table>
	                                                </div>
	                                            </div>
	                                        </div>
	                                    
	                                        <div class="accordion-item">
	                                            <h2 class="accordion-header">
	                                                <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseO-MS-Munheca" aria-expanded="true" aria-controls="collapseO-MS-Munheca">Muñeca</button>
	                                            </h2>
	                                            <div id="collapseO-MS-Munheca" class="accordion-collapse collapse" data-bs-parent="#accordionOrtesis-MiembroSuperior">
	                                                <div class="accordion-body">
	                                                    <table class="table table-success table-striped" id="tabla-O-MS-Munheca">
	                                                        <thead>
	                                                            <tr>
	                                                                <th>Nombre Comercial</th>
	                                                                <th>Marca</th>
	                                                                <th>Codigo SAS</th>
	                                                                <th>Nº Lote</th>
	                                                                <th>Talla</th>
	                                                                <th>Stock</th>
	                                                            </tr>
	                                                        </thead>
	                                                        <tbody>
	                                                            <tr>
	                                                                <td>xxxxxxxxx</td>
	                                                                <td>xxxx</td>
	                                                                <td>xx-0000x</td>
	                                                                <td>x0x0x0x0</td>
	                                                                <td>x</td>
	                                                                <td>0</td>
	                                                            </tr>
	                                                        </tbody>
	                                                    </table>
	                                                </div>
	                                            </div>
	                                        </div>
	                                        
	                                        <div class="accordion-item">
	                                            <h2 class="accordion-header">
	                                                <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseO-MS-Mano" aria-expanded="true" aria-controls="collapseO-MS-Mano">Mano</button>
	                                            </h2>
	                                            <div id="collapseO-MS-Mano" class="accordion-collapse collapse" data-bs-parent="#accordionOrtesis-MiembroSuperior">
	                                                <div class="accordion-body">
	                                                    <table class="table table-success table-striped" id="tabla-O-MS-Mano">
	                                                        <thead>
	                                                            <tr>
	                                                                <th>Nombre Comercial</th>
	                                                                <th>Marca</th>
	                                                                <th>Codigo SAS</th>
	                                                                <th>Nº Lote</th>
	                                                                <th>Talla</th>
	                                                                <th>Stock</th>
	                                                            </tr>
	                                                        </thead>
	                                                        <tbody>
	                                                            <tr>
	                                                                <td>xxxxxxxxx</td>
	                                                                <td>xxxx</td>
	                                                                <td>xx-0000x</td>
	                                                                <td>x0x0x0x0</td>
	                                                                <td>x</td>
	                                                                <td>0</td>
	                                                            </tr>
	                                                        </tbody>
	                                                    </table>
	                                                </div>
	                                            </div>
	                                        </div>
	                                    </section>
	                                </div>
	                            </div>
	                        </div>

	                        <div class="accordion-item">
	                            <h2 class="accordion-header">
	                                <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseO-T" aria-expanded="false" aria-controls="collapseO-T">Tronco</button>
	                            </h2>
	                            <div id="collapseO-T" class="accordion-collapse collapse" data-bs-parent="#accordionOrtesis">
	                                <div class="accordion-body">
	                                    <section class="accordion" id="accordionOrtesis-Tronco">
	                                        <div class="accordion-item">
	                                            <h2 class="accordion-header">
	                                                <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseO-T-Collarin" aria-expanded="true" aria-controls="collapseO-T-Collarin">Collarines</button>
	                                            </h2>
	                                            <div id="collapseO-T-Collarin" class="accordion-collapse collapse" data-bs-parent="#accordionOrtesis-Tronco">
	                                                <div class="accordion-body">
	                                                    <table class="table table-success table-striped" id="tabla-O-T-Collarines">
	                                                        <thead>
	                                                            <tr>
	                                                                <th>Nombre Comercial</th>
	                                                                <th>Marca</th>
	                                                                <th>Codigo SAS</th>
	                                                                <th>Nº Lote</th>
	                                                                <th>Talla</th>
	                                                                <th>Rigidez</th>
	                                                                <th>Zona de Inmovilización</th>
	                                                                <th>Stock</th>
	                                                            </tr>
	                                                        </thead>
	                                                        <tbody>
	                                                            <tr>
	                                                                <td>xxxxxxxxx</td>
	                                                                <td>xxxx</td>
	                                                                <td>xx-0000x</td>
	                                                                <td>x0x0x0x0</td>
	                                                                <td>x</td>
	                                                                <td>Rigido</td>
	                                                                <td>C</td>
	                                                                <td>0</td>
	                                                            </tr>
	                                                        </tbody>
	                                                    </table>
	                                                </div>
	                                            </div>
	                                        </div>
	                                    
	                                        <div class="accordion-item">
	                                            <h2 class="accordion-header">
	                                                <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseO-T-Corse" aria-expanded="true" aria-controls="collapseO-T-Corse">Corses</button>
	                                            </h2>
	                                            <div id="collapseO-T-Corse" class="accordion-collapse collapse" data-bs-parent="#accordionOrtesis-Tronco">
	                                                <div class="accordion-body">
	                                                    <table class="table table-success table-striped" id="tabla-O-T-Corses">
	                                                        <thead>
	                                                            <tr>
	                                                                <th>Nombre Comercial</th>
	                                                                <th>Marca</th>
	                                                                <th>Codigo SAS</th>
	                                                                <th>Nº Lote</th>
	                                                                <th>Talla</th>
	                                                                <th>Rigidez</th>
	                                                                <th>Zona de Inmovilización</th>
	                                                                <th>Stock</th>
	                                                            </tr>
	                                                        </thead>
	                                                        <tbody>
	                                                            <tr>
	                                                                <td>xxxxxxxxx</td>
	                                                                <td>xxxx</td>
	                                                                <td>xx-0000x</td>
	                                                                <td>x0x0x0x0</td>
	                                                                <td>x</td>
	                                                                <td>Rigido</td>
	                                                                <td>C</td>
	                                                                <td>0</td>
	                                                            </tr>
	                                                        </tbody>
	                                                    </table>
	                                                </div>
	                                            </div>
	                                        </div>
	                                    
	                                        <div class="accordion-item">
	                                            <h2 class="accordion-header">
	                                                <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseO-T-Fajas" aria-expanded="true" aria-controls="collapseO-T-Fajas">Fajas</button>
	                                            </h2>
	                                            <div id="collapseO-T-Fajas" class="accordion-collapse collapse" data-bs-parent="#accordionOrtesis-Tronco">
	                                                <div class="accordion-body">
	                                                    <table class="table table-success table-striped" id="tabla-O-T-Fajas">
	                                                        <thead>
	                                                            <tr>
	                                                                <th>Nombre Comercial</th>
	                                                                <th>Marca</th>
	                                                                <th>Codigo SAS</th>
	                                                                <th>Nº Lote</th>
	                                                                <th>Talla</th>
	                                                                <th>Rigidez</th>
	                                                                <th>Zona de Inmovilización</th>
	                                                                <th>Stock</th>
	                                                            </tr>
	                                                        </thead>
	                                                        <tbody>
	                                                            <tr>
	                                                                <td>xxxxxxxxx</td>
	                                                                <td>xxxx</td>
	                                                                <td>xx-0000x</td>
	                                                                <td>x0x0x0x0</td>
	                                                                <td>x</td>
	                                                                <td>Rigido</td>
	                                                                <td>C</td>
	                                                                <td>0</td>
	                                                            </tr>
	                                                        </tbody>
	                                                    </table>
	                                                </div>
	                                            </div>
	                                        </div>
	                                    </section>
	                                </div>
	                            </div>
	                        </div>
	                    </section>
	                </div>
	            </div>
	        </div>

	        <div class="accordion-item">
	            <h2 class="accordion-header">
	                <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseProtesis" aria-expanded="true" aria-controls="collapseProtesis">Partes para Protesis</button>
	            </h2>
	            <div id="collapseProtesis" class="accordion-collapse collapse" data-bs-parent="#accordionAlmacen">
	                <div class="accordion-body">
	                    <section class="accordion" id="accordionProtesis">
	                        <div class="accordion-item">
	                            <h2 class="accordion-header">
	                                <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseP-MI" aria-expanded="false" aria-controls="collapseP-MI">Miembro Inferior</button>
	                            </h2>
	                            <div id="collapseP-MI" class="accordion-collapse collapse" data-bs-parent="#accordionProtesis">
	                                <div class="accordion-body">
	                                    <section class="accordion" id="accordionProtesis-MiembroInferior">
	                                        <div class="accordion-item">
	                                            <h2 class="accordion-header">
	                                                <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseP-MI-Articulaciones" aria-expanded="true" aria-controls="collapseP-MI-Articulaciones">Articulaciones</button>
	                                            </h2>
	                                            <div id="collapseP-MI-Articulaciones" class="accordion-collapse collapse" data-bs-parent="#accordionProtesis-MiembroInferior">
	                                                <div class="accordion-body">
	                                                    <section class="accordion" id="#accordionProtesis-MiembroInferior-Articulaciones">
	                                                        <div class="accordion-item">
	                                                            <h2 class="accordion-header">
	                                                                <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseP-MI-A-Cadera" aria-expanded="true" aria-controls="collapseP-MI-A-Cadera">Cadera</button>
	                                                            </h2>
	                                                            <div id="collapseP-MI-A-Cadera" class="accordion-collapse collapse" data-bs-parent="#accordionProtesis-MiembroInferior-Articulaciones">
	                                                                <div class="accordion-body">
	                                                                    <table class="table table-success table-striped" id="tabla-P-MI-A-Cadera">
	                                                                        <thead>
	                                                                            <tr>
	                                                                                <th>Nombre Comercial</th>
	                                                                                <th>Marca</th>
	                                                                                <th>Codigo SAS</th>
	                                                                                <th>Nº Lote</th>
	                                                                                <th>Talla</th>
	                                                                                <th>Stock</th>
	                                                                            </tr>
	                                                                        </thead>
	                                                                        <tbody>
	                                                                            <tr>
	                                                                                <td>xxxxxxxxx</td>
	                                                                                <td>xxxx</td>
	                                                                                <td>xx-0000x</td>
	                                                                                <td>x0x0x0x0</td>
	                                                                                <td>x</td>
	                                                                                <td>0</td>
	                                                                            </tr>
	                                                                        </tbody>
	                                                                    </table>
	                                                                </div>
	                                                            </div>
	                                                        </div>

	                                                        <div class="accordion-item">
	                                                            <h2 class="accordion-header">
	                                                                <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseP-MI-A-Rodilla" aria-expanded="true" aria-controls="collapseP-MI-A-Rodilla">Rodilla</button>
	                                                            </h2>
	                                                            <div id="collapseP-MI-A-Rodilla" class="accordion-collapse collapse" data-bs-parent="#accordionProtesis-MiembroInferior-Articulaciones">
	                                                                <div class="accordion-body">
	                                                                    <table class="table table-success table-striped" id="tabla-P-MI-A-Rodilla">
	                                                                        <thead>
	                                                                            <tr>
	                                                                                <th>Nombre Comercial</th>
	                                                                                <th>Marca</th>
	                                                                                <th>Codigo SAS</th>
	                                                                                <th>Nº Lote</th>
	                                                                                <th>Talla</th>
	                                                                                <th>Stock</th>
	                                                                            </tr>
	                                                                        </thead>
	                                                                        <tbody>
	                                                                            <tr>
	                                                                                <td>xxxxxxxxx</td>
	                                                                                <td>xxxx</td>
	                                                                                <td>xx-0000x</td>
	                                                                                <td>x0x0x0x0</td>
	                                                                                <td>x</td>
	                                                                                <td>0</td>
	                                                                            </tr>
	                                                                        </tbody>
	                                                                    </table>
	                                                                </div>
	                                                            </div>
	                                                        </div>

	                                                        <div class="accordion-item">
	                                                            <h2 class="accordion-header">
	                                                                <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseP-MI-A-Tobillo" aria-expanded="true" aria-controls="collapseP-MI-A-Tobillo">Tobillo</button>
	                                                            </h2>
	                                                            <div id="collapseP-MI-A-Tobillo" class="accordion-collapse collapse" data-bs-parent="#accordionProtesis-MiembroInferior-Articulaciones">
	                                                                <div class="accordion-body">
	                                                                    <table class="table table-success table-striped" id="tabla-P-MI-A-Tobillo">
	                                                                        <thead>
	                                                                            <tr>
	                                                                                <th>Nombre Comercial</th>
	                                                                                <th>Marca</th>
	                                                                                <th>Codigo SAS</th>
	                                                                                <th>Nº Lote</th>
	                                                                                <th>Talla</th>
	                                                                                <th>Stock</th>
	                                                                            </tr>
	                                                                        </thead>
	                                                                        <tbody>
	                                                                            <tr>
	                                                                                <td>xxxxxxxxx</td>
	                                                                                <td>xxxx</td>
	                                                                                <td>xx-0000x</td>
	                                                                                <td>x0x0x0x0</td>
	                                                                                <td>x</td>
	                                                                                <td>0</td>
	                                                                            </tr>
	                                                                        </tbody>
	                                                                    </table>
	                                                                </div>
	                                                            </div>
	                                                        </div>
	                                                    </section>
	                                                </div>
	                                            </div>
	                                        </div>
	                                    
	                                        <div class="accordion-item">
	                                            <h2 class="accordion-header">
	                                                <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseP-MI-Superior" aria-expanded="true" aria-controls="collapseP-MI-Superior">Parte Superior</button>
	                                            </h2>
	                                            <div id="collapseP-MI-Superior" class="accordion-collapse collapse" data-bs-parent="#accordionProtesis-MiembroInferior">
	                                                <div class="accordion-body">
	                                                    <table class="table table-success table-striped" id="tabla-P-MI-Superior">
	                                                        <thead>
	                                                            <tr>
	                                                                <th>Nombre Comercial</th>
	                                                                <th>Marca</th>
	                                                                <th>Codigo SAS</th>
	                                                                <th>Nº Lote</th>
	                                                                <th>Talla</th>
	                                                                <th>Stock</th>
	                                                            </tr>
	                                                        </thead>
	                                                        <tbody>
	                                                            <tr>
	                                                                <td>xxxxxxxxx</td>
	                                                                <td>xxxx</td>
	                                                                <td>xx-0000x</td>
	                                                                <td>x0x0x0x0</td>
	                                                                <td>x</td>
	                                                                <td>0</td>
	                                                            </tr>
	                                                        </tbody>
	                                                    </table>
	                                                </div>
	                                            </div>
	                                        </div>
	                                    
	                                        <div class="accordion-item">
	                                            <h2 class="accordion-header">
	                                                <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseP-MI-Inferior" aria-expanded="true" aria-controls="collapseP-MI-Inferior">Parte Inferior</button>
	                                            </h2>
	                                            <div id="collapseP-MI-Inferior" class="accordion-collapse collapse" data-bs-parent="#accordionProtesis-MiembroInferior">
	                                                <div class="accordion-body">
	                                                    <table class="table table-success table-striped" id="tabla-P-MI-Inferior">
	                                                        <thead>
	                                                            <tr>
	                                                                <th>Nombre Comercial</th>
	                                                                <th>Marca</th>
	                                                                <th>Codigo SAS</th>
	                                                                <th>Nº Lote</th>
	                                                                <th>Talla</th>
	                                                                <th>Stock</th>
	                                                            </tr>
	                                                        </thead>
	                                                        <tbody>
	                                                            <tr>
	                                                                <td>xxxxxxxxx</td>
	                                                                <td>xxxx</td>
	                                                                <td>xx-0000x</td>
	                                                                <td>x0x0x0x0</td>
	                                                                <td>x</td>
	                                                                <td>0</td>
	                                                            </tr>
	                                                        </tbody>
	                                                    </table>
	                                                </div>
	                                            </div>
	                                        </div>
	                                        
	                                        <div class="accordion-item">
	                                            <h2 class="accordion-header">
	                                                <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseP-MI-Pie" aria-expanded="true" aria-controls="collapseP-MI-Pie">Pie</button>
	                                            </h2>
	                                            <div id="collapseP-MI-Pie" class="accordion-collapse collapse" data-bs-parent="#accordionProtesis-MiembroInferior">
	                                                <div class="accordion-body">
	                                                    <table class="table table-success table-striped" id="tabla-P-MI-Pie">
	                                                        <thead>
	                                                            <tr>
	                                                                <th>Nombre Comercial</th>
	                                                                <th>Marca</th>
	                                                                <th>Codigo SAS</th>
	                                                                <th>Nº Lote</th>
	                                                                <th>Talla</th>
	                                                                <th>Stock</th>
	                                                            </tr>
	                                                        </thead>
	                                                        <tbody>
	                                                            <tr>
	                                                                <td>xxxxxxxxx</td>
	                                                                <td>xxxx</td>
	                                                                <td>xx-0000x</td>
	                                                                <td>x0x0x0x0</td>
	                                                                <td>x</td>
	                                                                <td>0</td>
	                                                            </tr>
	                                                        </tbody>
	                                                    </table>
	                                                </div>
	                                            </div>
	                                        </div>

	                                        <div class="accordion-item">
	                                            <h2 class="accordion-header">
	                                                <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseP-MI-Dedos" aria-expanded="true" aria-controls="collapseP-MI-Dedos">Dedos</button>
	                                            </h2>
	                                            <div id="collapseP-MI-Dedos" class="accordion-collapse collapse" data-bs-parent="#accordionProtesis-MiembroInferior">
	                                                <div class="accordion-body">
	                                                    <table class="table table-success table-striped" id="tabla-P-MI-Dedos">
	                                                        <thead>
	                                                            <tr>
	                                                                <th>Tipo de Dedo</th>
	                                                                <th>Marca</th>
	                                                                <th>Color</th>
	                                                                <th>Nº Lote</th>
	                                                                <th>Talla</th>
	                                                                <th>Stock</th>
	                                                            </tr>
	                                                        </thead>
	                                                        <tbody>
	                                                            <tr>
	                                                                <td>xxxxxxxxx</td>
	                                                                <td>xxxx</td>
	                                                                <td>xx-0000x</td>
	                                                                <td>x0x0x0x0</td>
	                                                                <td>x</td>
	                                                                <td>0</td>
	                                                            </tr>
	                                                        </tbody>
	                                                    </table>
	                                                </div>
	                                            </div>
	                                        </div>
	                                    </section>
	                                </div>
	                            </div>
	                        </div>
	                
	                        <div class="accordion-item">
	                            <h2 class="accordion-header">
	                                <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseP-MS" aria-expanded="false" aria-controls="collapseP-MS">Miembro Superior</button>
	                            </h2>
	                            <div id="collapseP-MS" class="accordion-collapse collapse" data-bs-parent="#accordionProtesis">
	                                <div class="accordion-body">
	                                    <section class="accordion" id="accordionProtesis-MiembroSuperior">
	                                        <div class="accordion-item">
	                                            <h2 class="accordion-header">
	                                                <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseP-MS-Articulaciones" aria-expanded="true" aria-controls="collapseP-MS-Articulaciones">Articulaciones</button>
	                                            </h2>
	                                            <div id="collapseP-MS-Articulaciones" class="accordion-collapse collapse" data-bs-parent="#accordionProtesis-MiembroSuperior">
	                                                <div class="accordion-body">
	                                                    <section class="accordion" id="#accordionProtesis-MiembroSuperior-Articulaciones">
	                                                        <div class="accordion-item">
	                                                            <h2 class="accordion-header">
	                                                                <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseP-MS-A-Hombro" aria-expanded="true" aria-controls="collapseP-MS-A-Hombro">Hombro</button>
	                                                            </h2>
	                                                            <div id="collapseP-MS-A-Hombro" class="accordion-collapse collapse" data-bs-parent="#accordionProtesis-MiembroSuperior-Articulaciones">
	                                                                <div class="accordion-body">
	                                                                    <table class="table table-success table-striped" id="tabla-P-MS-A-Hombro">
	                                                                        <thead>
	                                                                            <tr>
	                                                                                <th>Nombre Comercial</th>
	                                                                                <th>Marca</th>
	                                                                                <th>Codigo SAS</th>
	                                                                                <th>Nº Lote</th>
	                                                                                <th>Talla</th>
	                                                                                <th>Stock</th>
	                                                                            </tr>
	                                                                        </thead>
	                                                                        <tbody>
	                                                                            <tr>
	                                                                                <td>xxxxxxxxx</td>
	                                                                                <td>xxxx</td>
	                                                                                <td>xx-0000x</td>
	                                                                                <td>x0x0x0x0</td>
	                                                                                <td>x</td>
	                                                                                <td>0</td>
	                                                                            </tr>
	                                                                        </tbody>
	                                                                    </table>
	                                                                </div>
	                                                            </div>
	                                                        </div>

	                                                        <div class="accordion-item">
	                                                            <h2 class="accordion-header">
	                                                                <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseP-MS-A-Codo" aria-expanded="true" aria-controls="collapseP-MS-A-Codo">Codo</button>
	                                                            </h2>
	                                                            <div id="collapseP-MS-A-Codo" class="accordion-collapse collapse" data-bs-parent="#accordionProtesis-MiembroSuperior-Articulaciones">
	                                                                <div class="accordion-body">
	                                                                    <table class="table table-success table-striped" id="tabla-P-MS-A-Codo">
	                                                                        <thead>
	                                                                            <tr>
	                                                                                <th>Nombre Comercial</th>
	                                                                                <th>Marca</th>
	                                                                                <th>Codigo SAS</th>
	                                                                                <th>Nº Lote</th>
	                                                                                <th>Talla</th>
	                                                                                <th>Stock</th>
	                                                                            </tr>
	                                                                        </thead>
	                                                                        <tbody>
	                                                                            <tr>
	                                                                                <td>xxxxxxxxx</td>
	                                                                                <td>xxxx</td>
	                                                                                <td>xx-0000x</td>
	                                                                                <td>x0x0x0x0</td>
	                                                                                <td>x</td>
	                                                                                <td>0</td>
	                                                                            </tr>
	                                                                        </tbody>
	                                                                    </table>
	                                                                </div>
	                                                            </div>
	                                                        </div>

	                                                        <div class="accordion-item">
	                                                            <h2 class="accordion-header">
	                                                                <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseP-MS-A-Munheca" aria-expanded="true" aria-controls="collapseP-MS-A-Munheca">Muñeca</button>
	                                                            </h2>
	                                                            <div id="collapseP-MS-A-Munheca" class="accordion-collapse collapse" data-bs-parent="#accordionProtesis-MiembroInferior-Articulaciones">
	                                                                <div class="accordion-body">
	                                                                    <table class="table table-success table-striped" id="tabla-P-MS-A-Munheca">
	                                                                        <thead>
	                                                                            <tr>
	                                                                                <th>Nombre Comercial</th>
	                                                                                <th>Marca</th>
	                                                                                <th>Codigo SAS</th>
	                                                                                <th>Nº Lote</th>
	                                                                                <th>Talla</th>
	                                                                                <th>Stock</th>
	                                                                            </tr>
	                                                                        </thead>
	                                                                        <tbody>
	                                                                            <tr>
	                                                                                <td>xxxxxxxxx</td>
	                                                                                <td>xxxx</td>
	                                                                                <td>xx-0000x</td>
	                                                                                <td>x0x0x0x0</td>
	                                                                                <td>x</td>
	                                                                                <td>0</td>
	                                                                            </tr>
	                                                                        </tbody>
	                                                                    </table>
	                                                                </div>
	                                                            </div>
	                                                        </div>
	                                                    </section>
	                                                </div>
	                                            </div>
	                                        </div>
	                                    
	                                        <div class="accordion-item">
	                                            <h2 class="accordion-header">
	                                                <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseP-MS-Superior" aria-expanded="true" aria-controls="collapseP-Ms-Superior">Parte Superior</button>
	                                            </h2>
	                                            <div id="collapseP-MS-Superior" class="accordion-collapse collapse" data-bs-parent="#accordionProtesis-MiembroSuperior">
	                                                <div class="accordion-body">
	                                                    <table class="table table-success table-striped" id="tabla-P-MS-Superior">
	                                                        <thead>
	                                                            <tr>
	                                                                <th>Nombre Comercial</th>
	                                                                <th>Marca</th>
	                                                                <th>Codigo SAS</th>
	                                                                <th>Nº Lote</th>
	                                                                <th>Talla</th>
	                                                                <th>Stock</th>
	                                                            </tr>
	                                                        </thead>
	                                                        <tbody>
	                                                            <tr>
	                                                                <td>xxxxxxxxx</td>
	                                                                <td>xxxx</td>
	                                                                <td>xx-0000x</td>
	                                                                <td>x0x0x0x0</td>
	                                                                <td>x</td>
	                                                                <td>0</td>
	                                                            </tr>
	                                                        </tbody>
	                                                    </table>
	                                                </div>
	                                            </div>
	                                        </div>
	                                    
	                                        <div class="accordion-item">
	                                            <h2 class="accordion-header">
	                                                <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseP-MS-Inferior" aria-expanded="true" aria-controls="collapseP-MS-Inferior">Parte Inferior</button>
	                                            </h2>
	                                            <div id="collapseP-MS-Inferior" class="accordion-collapse collapse" data-bs-parent="#accordionProtesis-MiembroSuperior">
	                                                <div class="accordion-body">
	                                                    <table class="table table-success table-striped" id="tabla-P-MS-Inferior">
	                                                        <thead>
	                                                            <tr>
	                                                                <th>Nombre Comercial</th>
	                                                                <th>Marca</th>
	                                                                <th>Codigo SAS</th>
	                                                                <th>Nº Lote</th>
	                                                                <th>Talla</th>
	                                                                <th>Stock</th>
	                                                            </tr>
	                                                        </thead>
	                                                        <tbody>
	                                                            <tr>
	                                                                <td>xxxxxxxxx</td>
	                                                                <td>xxxx</td>
	                                                                <td>xx-0000x</td>
	                                                                <td>x0x0x0x0</td>
	                                                                <td>x</td>
	                                                                <td>0</td>
	                                                            </tr>
	                                                        </tbody>
	                                                    </table>
	                                                </div>
	                                            </div>
	                                        </div>
	                                        
	                                        <div class="accordion-item">
	                                            <h2 class="accordion-header">
	                                                <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseP-MS-Mano" aria-expanded="true" aria-controls="collapseP-MS-Mano">Mano</button>
	                                            </h2>
	                                            <div id="collapseP-MS-Mano" class="accordion-collapse collapse" data-bs-parent="#accordionProtesis-MiembroSuperior">
	                                                <div class="accordion-body">
	                                                    <table class="table table-success table-striped" id="tabla-P-MS-Mano">
	                                                        <thead>
	                                                            <tr>
	                                                                <th>Nombre Comercial</th>
	                                                                <th>Marca</th>
	                                                                <th>Codigo SAS</th>
	                                                                <th>Nº Lote</th>
	                                                                <th>Talla</th>
	                                                                <th>Stock</th>
	                                                            </tr>
	                                                        </thead>
	                                                        <tbody>
	                                                            <tr>
	                                                                <td>xxxxxxxxx</td>
	                                                                <td>xxxx</td>
	                                                                <td>xx-0000x</td>
	                                                                <td>x0x0x0x0</td>
	                                                                <td>x</td>
	                                                                <td>0</td>
	                                                            </tr>
	                                                        </tbody>
	                                                    </table>
	                                                </div>
	                                            </div>
	                                        </div>

	                                        <div class="accordion-item">
	                                            <h2 class="accordion-header">
	                                                <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseP-MS-Dedos" aria-expanded="true" aria-controls="collapseP-MS-Dedos">Dedos</button>
	                                            </h2>
	                                            <div id="collapseP-MS-Dedos" class="accordion-collapse collapse" data-bs-parent="#accordionProtesis-MiembroSuperior">
	                                                <div class="accordion-body">
	                                                    <table class="table table-success table-striped" id="tabla-P-MS-Dedos">
	                                                        <thead>
	                                                            <tr>
	                                                                <th>Tipo de Dedo</th>
	                                                                <th>Marca</th>
	                                                                <th>Color</th>
	                                                                <th>Nº Lote</th>
	                                                                <th>Talla</th>
	                                                                <th>Stock</th>
	                                                            </tr>
	                                                        </thead>
	                                                        <tbody>
	                                                            <tr>
	                                                                <td>xxxxxxxxx</td>
	                                                                <td>xxxx</td>
	                                                                <td>xx-0000x</td>
	                                                                <td>x0x0x0x0</td>
	                                                                <td>x</td>
	                                                                <td>0</td>
	                                                            </tr>
	                                                        </tbody>
	                                                    </table>
	                                                </div>
	                                            </div>
	                                        </div>
	                                    </section>
	                                </div>
	                            </div>
	                        </div>
	                    </section>
	                </div>
	            </div>
	        </div>

	        <div class="accordion-item">
	            <h2 class="accordion-header">
	                <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapsePDA" aria-expanded="true" aria-controls="collapsePDA">Productos de Apoyo</button>
	            </h2>
	            <div id="collapsePDA" class="accordion-collapse collapse" data-bs-parent="#accordionAlmacen">
	                <div class="accordion-body">
	                    <section class="accordion" id="#accordionPDA">
	                        <div class="accordion-item">
	                            <h2 class="accordion-header">
	                                <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapsePDA-Muletas" aria-expanded="true" aria-controls="collapsePDA-Muletas">Muletas</button>
	                            </h2>
	                            <div id="collapsePDA-Muletas" class="accordion-collapse collapse" data-bs-parent="#accordionPDA">
	                                <div class="accordion-body">
	                                    <table class="table table-success table-striped" id="tabla-PDA-Muletas">
	                                        <thead>
	                                            <tr>
	                                                <th>Color</th>
	                                                <th>Marca</th>
	                                                <th>Codigo SAS</th>
	                                                <th>Nº Lote</th>
	                                                <th>Maxima Altura</th>
	                                                <th>Stock</th>
	                                            </tr>
	                                        </thead>
	                                        <tbody>
	                                            <tr>
	                                                <td>xxxxxxxxx</td>
	                                                <td>xxxx</td>
	                                                <td>xx-0000x</td>
	                                                <td>x0x0x0x0</td>
	                                                <td>xxx cm</td>
	                                                <td>0</td>
	                                            </tr>
	                                        </tbody>
	                                    </table>
	                                </div>
	                            </div>
	                        </div>

	                        <div class="accordion-item">
	                            <h2 class="accordion-header">
	                                <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapsePDA-Cabestrillo" aria-expanded="true" aria-controls="collapsePDA-Cabestrillo">Cabestrillos</button>
	                            </h2>
	                            <div id="collapsePDA-Cabestrillo" class="accordion-collapse collapse" data-bs-parent="#accordionPDA">
	                                <div class="accordion-body">
	                                    <table class="table table-success table-striped" id="tabla-PDA-Cabestrillo">
	                                        <thead>
	                                            <tr>
	                                                <th>Color</th>
	                                                <th>Marca</th>
	                                                <th>Codigo SAS</th>
	                                                <th>Nº Lote</th>
	                                                <th>Talla</th>
	                                                <th>Stock</th>
	                                            </tr>
	                                        </thead>
	                                        <tbody>
	                                            <tr>
	                                                <td>xxxxxxxxx</td>
	                                                <td>xxxx</td>
	                                                <td>xx-0000x</td>
	                                                <td>x0x0x0x0</td>
	                                                <td>x</td>
	                                                <td>0</td>
	                                            </tr>
	                                        </tbody>
	                                    </table>
	                                </div>
	                            </div>
	                        </div>
	                    </section>
	                </div>
	            </div>
	        </div>

	        <div class="accordion-item">
	            <h2 class="accordion-header">
	                <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseRA" aria-expanded="true" aria-controls="collapseRA">Repuestos/Accesorios</button>
	            </h2>
	            <div id="collapseRA" class="accordion-collapse collapse" data-bs-parent="#accordionAlmacen">
	                <div class="accordion-body">
	                    <section class="accordion" id="#accordionRA">
	                        <div class="accordion-item">
	                            <h2 class="accordion-header">
	                                <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseRA-Tapas" aria-expanded="true" aria-controls="collapseRA-Tapas">Tapas</button>
	                            </h2>
	                            <div id="collapseRA-Tapas" class="accordion-collapse collapse" data-bs-parent="#accordionRA">
	                                <div class="accordion-body">
	                                    <table class="table table-success table-striped" id="tabla-RA-Tapas">
	                                        <thead>
	                                            <tr>
	                                                <th>Grosor</th>
	                                                <th>Marca</th>
	                                                <th>Elemento</th>
	                                                <th>Nº Lote</th>
	                                                <th>Color</th>
	                                                <th>Stock</th>
	                                            </tr>
	                                        </thead>
	                                        <tbody>
	                                            <tr>
	                                                <td>xxxxxxxxx</td>
	                                                <td>xxxx</td>
	                                                <td>xxxxxx</td>
	                                                <td>x0x0x0x0</td>
	                                                <td>xxx cm</td>
	                                                <td>0</td>
	                                            </tr>
	                                        </tbody>
	                                    </table>
	                                </div>
	                            </div>
	                        </div>

	                        <div class="accordion-item">
	                            <h2 class="accordion-header">
	                                <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseRA-Ruedas" aria-expanded="true" aria-controls="collapseRA-Ruedas">Ruedas</button>
	                            </h2>
	                            <div id="collapseRA-Ruedas" class="accordion-collapse collapse" data-bs-parent="#accordionPDA">
	                                <div class="accordion-body">
	                                    <table class="table table-success table-striped" id="tabla-RA-Ruedas">
	                                        <thead>
	                                            <tr>
	                                                <th>Grosor</th>
	                                                <th>Marca</th>
	                                                <th>Elemento</th>
	                                                <th>Nº Lote</th>
	                                                <th>Color</th>
	                                                <th>Stock</th>
	                                            </tr>
	                                        </thead>
	                                        <tbody>
	                                            <tr>
	                                                <td>xxxxxxxxx</td>
	                                                <td>xxxx</td>
	                                                <td>xxxxxx</td>
	                                                <td>x0x0x0x0</td>
	                                                <td>xxx cm</td>
	                                                <td>0</td>
	                                            </tr>
	                                        </tbody>
	                                    </table>
	                                </div>
	                            </div>
	                        </div>
	                    </section>
	                </div>
	            </div>
	        </div>

	        <div class="accordion-item">
	            <h2 class="accordion-header">
	                <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseMDF" aria-expanded="true" aria-controls="collapseMDF">Materiales para Fabricacion de Ortesis</button>
	            </h2>
	            <div id="collapseMDF" class="accordion-collapse collapse" data-bs-parent="#accordionAlmacen">
	                <div class="accordion-body">
	                    <section class="accordion" id="accordionMateriales">
	                        <div class="accordion-item">
	                            <h2 class="accordion-header">
	                                <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseMDF-P" aria-expanded="true" aria-controls="collapseMDF-P">Plasticos</button>
	                            </h2>
	                            <div id="collapseMDF-P" class="accordion-collapse collapse" data-bs-parent="#accordionMateriales">
	                                <div class="accordion-body">
	                                    <table class="table table-success table-striped" id="tabla-MDF-Plasticos">
	                                        <thead>
	                                            <tr>
	                                                <th>Tipo de Plastico</th>
	                                                <th>Grosor</th>
	                                                <th>Proveedor</th>
	                                                <th>Nº Lote</th>
	                                                <th>Tamaño de la lamina</th>
	                                                <th>Stock</th>
	                                            </tr>
	                                        </thead>
	                                        <tbody>
	                                            <tr>
	                                                <td>xxxxxxxxx</td>
	                                                <td>0</td>
	                                                <td>xxxxxxxxx</td>
	                                                <td>x0x0x0x</td>
	                                                <td>00x00</td>
	                                                <td>0</td>
	                                            </tr>
	                                        </tbody>
	                                    </table>
	                                </div>
	                            </div>
	                        </div>
	                        <div class="accordion-item">
	                            <h2 class="accordion-header">
	                                <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseMDF-F" aria-expanded="true" aria-controls="collapseMDF-F">Forro</button>
	                            </h2>
	                            <div id="collapseMDF-F" class="accordion-collapse collapse" data-bs-parent="#accordionMateriales">
	                                <div class="accordion-body">
	                                    <table class="table table-success table-striped" id="tabla-MDF-Forro">
	                                        <thead>
	                                            <tr>
	                                                <th>Tipo de Material</th>
	                                                <th>Grosor</th>
	                                                <th>Proveedor</th>
	                                                <th>Nº Lote</th>
	                                                <th>Color</th>
	                                                <th>Tamaño de la Lamina</th>
	                                                <th>Stock</th>
	                                            </tr>
	                                        </thead>
	                                        <tbody>
	                                            <tr>
	                                                <td>xxxxxxxxx</td>
	                                                <td>00</td>
	                                                <td>xxxxxxxx</td>
	                                                <td>x0x0x0x0</td>
	                                                <td>xxx</td>
	                                                <td>00x00</td>
	                                                <td>0</td>
	                                            </tr>
	                                        </tbody>
	                                    </table>
	                                </div>
	                            </div>
	                        </div>
	                        <div class="accordion-item">
	                            <h2 class="accordion-header">
	                                <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseMDF-T" aria-expanded="true" aria-controls="collapseMDF-T">Tranfers</button>
	                            </h2>
	                            <div id="collapseMDF-T" class="accordion-collapse collapse" data-bs-parent="#accordionMateriales">
	                                <div class="accordion-body">
	                                    <table class="table table-success table-striped" id="tabla-O-MI-Cadera">
	                                        <thead>
	                                            <tr>
	                                                <th>Dibujo</th>
	                                                <th>Distribuidor</th>
	                                                <th>Tamaño del rollo</th>
	                                                <th>Nº Lote</th>
	                                                <th>Stock</th>
	                                            </tr>
	                                        </thead>
	                                        <tbody>
	                                            <tr>
	                                                <td>xxxxxxxxx</td>
	                                                <td>xxxx</td>
	                                                <td>00x00</td>
	                                                <td>x0x0x0x0</td>
	                                                <td>0</td>
	                                            </tr>
	                                        </tbody>
	                                    </table>
	                                </div>
	                            </div>
	                        </div>
	                    </section>
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
	                        <button type="submit" class="btn btn-success btn-block"><a href="/administrador/almacen">Volver</a></button>
	                    </form>
	                </div>
	            </div>
	        </div>
	    </div>

	    <div class="modal fade" id="modalNuevoProducto"> <!--Ventana Modal de Creacion de un nuevo producto-->
	        <div class="modal-dialog modal-sm">
	            <div class="modal-content">
	                <div class="modal-header">
	                    <h2>Añadir Nuevo Producto al Inventario</h2>
	                </div>
	                <div class="modal-body">
	                    <form>
	                        <div class="form-group">
	                            <label for="inputNombre">Nombre</label>
	                            <input type="text" class="form-control" id="inputNombre" placeholder="Escribe el nombre..."/>
	                        </div>
	                        <div class="form-group">
	                            <label for="inputLote">Lote</label>
	                            <input type="text" class="form-control" id="inputLote" placeholder="Escribe el numero de lote..."/>
	                        </div>
	                        <div class="form-group">
	                            <label for="inputCategoria">Categoria</label>
	                            <input type="text" class="form-control" id="inputCategoria" placeholder="Escribe la categoria..."/>
	                        </div>
	                        <button type="submit" class="btn btn-success btn-block"><a href="#" data-bs-toggle="modal" data-bs-target="#modalConfirmacionNuevoProducto">Añadir</a></button>
	                    </form>
	                </div>
	            </div>
	        </div>
	    </div>

	    <div class="modal fade" id="modalConfirmacionNuevoProducto"> <!--Ventana Modal de Confirmación de la suma de un nuevo Producto-->
	        <div class="modal-dialog modal-sm">
	            <div class="modal-content">
	                <div class="modal-header">
	                    <p>El nuevo Producto ha sido añadido correctamente</p>
	                </div>
	                <div class="modal-body">
	                    <form>
	                        <button type="submit" class="btn btn-success btn-block"><a href="/administrador/almacen">Volver al almacen</a></button>
	                    </form>
	                </div>
	            </div>
	        </div>
	    </div>
</body>
</html>