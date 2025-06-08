<%@ page contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta name="author" content="Ana Gutiérrez Barón"/>
    <title>OrtoLiberi - Editar Producto</title>
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
						<li><a class="nav-item nav-link" href="/administrador/bajas"><i class="fa-solid fa-address-card"></i>Bajas</a></li>
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
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item active" aria-current="page">Editar Producto</li>
            </ol>
        </nav>
    </div>

    <section class="wrap" id="new-user">
        <div class="container">
            <h1>Editar Producto</h1>
            <p class="lead">Edita un producto ya existente del almacen de la tienda</p>
            <div class="card">
                <div class="card-body">
                    <form id="formulario_registro_producto" method="post" action="/editar/producto">
						<div class="form-group">
							<label for="inputId" hidden>ID Producto</label>
							<input type="text" class="form-control" id="inputId" name="id" value="${producto.id}" hidden required/>
						</div>
                        <div class="form-group">
                            <label for="inputNombre">Nombre</label>
                            <input type="text" class="form-control" id="inputNombre" name="nombre" placeholder="Escribe el nombre..." value="${producto.nombre}" required/>
							<span class="error-formulario" id="errorNombre" style="font-style: italic; color: red;"></span>
                        </div>
                        <div class="form-group">
                            <label for="inputDescripcion">Descripción</label>
                            <textarea class="form-control" id="inputDescripcion" name="descripcion" placeholder="Escribe la descripción del producto..." required>${producto.descripcion}</textarea>
							<span class="error-formulario" id="errorDescripcion" style="font-style: italic; color: red;"></span>
                        </div>
                        <div class="form-group">
                            <label for="inputLote">Lote</label>
                            <input type="text" class="form-control" id="inputLote" name="lote" placeholder="Escribe el número de lote..." value="${producto.lote}" required/>
							<span class="error-formulario" id="errorLote" style="font-style: italic; color: red;"></span>
                        </div>
                        <div class="form-group">
                            <label for="inputProveedor">Proveedor</label>
							<select class="form-control" id="inputProveedor" th:field="*{proveedor.id}" required>
								<option value="${producto.proveedor.id}" selected>${producto.proveedor.nombre}</option>
								<c:forEach var="proveedor" items="${proveedores}">
									<option value="${proveedor.id}">${proveedor.nombre}</option>
								</c:forEach>
							</select>
							<span class="error-formulario" id="errorProveedor" style="font-style: italic; color: red;"></span>
                        </div>
						<div class="form-group">
							<label for="inputCodigo">Codigo SAS asociado</label>
							<select class="form-control" id="inputCodigo" th:field="*{codigoSAS.codigo}" required>
								<option value="${producto.codigoAsociado.codigo}">${producto.codigoAsociado.codigo}:  ${producto.codigoAsociado.descripcion}</option>
								<c:forEach var="codigo" items="${codigos}">
									<option value="${codigo.codigo}">${codigo.codigo} : ${codigo.descripcion}</option>
								</c:forEach>
							</select>
							<span class="error-formulario" id="errorCodigo" style="font-style: italic; color: red;"></span>
						</div>
                        <div class="form-group">
                            <label for="inputDevolucion">Devolucion</label>
							<select class="form-control" id="inputDevolucion" required>
								<option value="${producto.devolucion}" selected>${producto.devolucion}</option>
								<option value="Si">Admite devolucion</option>
								<option value="No">No admite devolucion</option>
							</select>
							<span class="error-formulario" id="errorDevolucion" style="font-style: italic; color: red;"></span>
                        </div>
                        <div class="form-group">
                            <label for="inputStock">Stock</label>
                            <input type="number" class="form-control" id="inputStock" name="stock" placeholder="0" value="${producto.stock}" required/>
							<span class="error-formulario" id="errorCodigo" style="font-style: italic; color: red;"></span>
                        </div>
                        <div class="form-group">
                            <label for="inputCoste">Coste</label>
                            <input type="number" class="form-control" id="inputCoste" name="coste" step="0.01" placeholder="0,01" required value="${producto.coste}"/>
							<span class="error-formulario" id="errorCoste" style="font-style: italic; color: red;"></span>
                        </div>
						<div class="form-group">
							<label for="inputPrecio">Precio de Venta</label>
						    <input type="number" class="form-control" id="inputPrecio" name="precio" step="0.01" placeholder="0,01" value="${producto.precio}" required/>
							<span class="error-formulario" id="errorPrecio" style="font-style: italic; color: red;"></span>
						</div>
                        <button type="submit" class="btn btn-success btn-block" id="registrar_producto">Actualizar</button>
                    </form>
					<c:if test="${not empty error}">
						<div class="error" style="font-style: italic; color: red;">${error}</div>
					</c:if>
					<c:if test="${not empty confirmacion}">
						<div class="confirmacion" style="font-style: italic; color: green;">${confirmacion}</div>
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

	<script src="../js/validacion_registro_empleado.js"></script>
</body>
</html>