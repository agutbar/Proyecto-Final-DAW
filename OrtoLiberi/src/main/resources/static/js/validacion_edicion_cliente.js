window.onload = iniciar;

function iniciar(){
    document.getElementById("registrar_cliente").addEventListener("click", validarRegistro, false);
}

document.getElementById("formulario_registro_cliente").setAttribute("novalidate","novalidate"); //Desactivar validacion de HTML si está activo JavaScript

function validarNombre(){
    let nombre = document.getElementById("inputNombre").value;
    let errorN = document.getElementById("errorNombre");

    if (contieneNumero(nombre) && !comprobarNoVacio(nombre) && !comprobarPatronTexto(nombre) && !comprobarPatronTexto(nombre)){
        //errorN.textContent = "Nombre no válido. Debe tener debe tener entre 3 y 100 caracteres.";
        return false;
    } else {
        errorN.textContent = "Nombre no válido. Debe tener debe tener entre 3 y 100 caracteres.";
        return true;
    }
}

function validarApellidos(){
    let apellidos = document.getElementById("inputApellidos").value;
    let errorA = document.getElementById("errorApellidos");

    if (contieneNumero(apellidos) && !comprobarNoVacio(apellidos) && !comprobarPatronTexto(apellidos) && !comprobarPatronTexto(apellidos)){
        errorA.textContent = "Apellidos no válidos. Debe tener debe tener entre 3 y 100 caracteres.";
        return false;
    } else {
        return true;
    }
}

function validarCorreo(){
    let correo = document.getElementById("inputEmail").value;
    let errorE = document.getElementById("errorEmail");
    if (contieneArroba(correo) && contienePunto(correo) && comprobarNoVacio(correo) && comprobarPatronCorreo(correo)){
        return true;
    } else {
        errorE.textContent = "Email no válido.";
        return false;
    }
}

function validarTelefono(){
    let telefono = document.getElementById("inputTelefono").value;
    let errorT = document.getElementById("errorTelefono");
    if (telefono.length == 9 || telefono.length == 15){
        return true;
    } else {
        errorT.textContent = "Número de teléfono no válido.";
        return false;
    }
}

function validarDireccion(){
    let direccion = document.getElementById("inputDireccion").value;
    let errorD = document.getElementById("errorDireccion");

    if(direccion.length >= 5 && direccion.length <= 255 && comprobarNoVacio(direccion)){
        return true;
    } else {
        errorD.textContent = "Direccion no válida. Debe tener entre 5 y 255 caracteres.";
        return false;
    }
}

function validarUsuario(){
    let usuario = document.getElementById("inputUser").value;
    let errorU = document.getElementById("errorUsuario");

    if(usuario.length >= 3 && usuario.length <= 10 && comprobarNoVacio(usuario)){
        return true;
    } else {
        errorU.textContent = "Nombre de usuario no válido. Debe tener entre 3 y 10 caracteres.";
        return false;
    }
}


function validarRegistro(event){
    event.preventDefault(); // Detiene el evento normal
    limpiarErrores(); // Limpia los mensajes de error al comenzar

    if (validarNombre() && validarApellidos() && validarTelefono() && validarCorreo() && validarDireccion() && validarUsuario()){
        document.getElementById("formulario_registro_cliente").submit(); // Enviar el formulario si todo es válido
    }
}

// Función para limpiar errores anteriores
function limpiarErrores(){
    document.getElementById("errorNombre").textContent = "";
    document.getElementById("errorApellidos").textContent = "";
    document.getElementById("errorEmail").textContent = "";
    document.getElementById("errorTelefono").textContent = "";
    document.getElementById("errorDireccion").textContent = "";
    document.getElementById("errorUsuario").textContent = "";
}

//-------------------------------------Comprobación de determinados elementos-------------------------------------

function contieneNumero(textoN) { 
    var patronN = /\d/; 
    return patronN.test(textoN); 
}

function contieneCaracterEspecial(textoCE) { 
    var patronCE = /[^a-zA-Z0-9 ]/; 
    return patronCE.test(textoCE); 
}

function contieneArroba(textoA) { 
    var patronA = /@/; 
    return patronA.test(textoA); 
}

function contienePunto(textoP) { 
    var patronP = /\./; 
    return patronP.test(textoP); 
}

function tieneMayusculas(textoMa){
    var patronMa = /[A-Z]/;
    var encontradaMa = textoMa.search(patronMa);
    if (encontradaMa == -1){
        return false;
    } else {
        return true;
    }
}

function tieneMinusculas(textoMi){
    var patronMi = /[a-z]/;
    var encontradaMi = textoMi.search(patronMi);
    if (encontradaMi == -1){
        return false;
    } else {
        return true;
    }
}

function comprobarNoVacio(textoSi) { 
    if (textoSi.trim() !== "") { 
        return true; 
    } else { 
        return false; 
    }
}

function comprobarPatronTexto(textoNA){
    var patronNA = /^[a-zA-ZáéíóúÁÉÍÓÚñÑ\s'-]+$/;
    return patronNA.test(textoNA);
}

function comprobarPatronCorreo(textoC){
    var patronC = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
    return patronC.test(textoC);
}

/*Para facilitar la lectura del código, se juntan las 4 comprobaciones
en una para que no se extienda tanto en las dos validaciones de la contraseña*/
function comprobacionCaracteresPassword(textoCP){
    if (contieneNumero(textoCP) && contieneCaracterEspecial(textoCP) && tieneMayusculas(textoCP) && tieneMinusculas(textoCP)){
        return true;
    } else {
        return false;
    }
}
