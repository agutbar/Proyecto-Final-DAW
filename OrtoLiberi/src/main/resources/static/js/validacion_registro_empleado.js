window.onload = iniciar;

function iniciar(){
    document.getElementById("registrar_empleado").addEventListener("click", validarRegistro, false);
}

document.getElementById("formulario_registro_empleado").setAttribute("novalidate","novalidate"); //Desactivar validacion de HTML si está activo JavaScript

function validarNombre(){
    let nombre = document.getElementById("inputUser").value;
    let errorN = document.getElementById("errorNombre");

    if (contieneNumero(nombre) && !comprobarNoVacio(nombre) && !comprobarPatronTexto(nombre)){
        errorN.textContent = "Nombre no válido. Debe tener debe tener entre 3 y 100 caracteres.";
        return false;
    } else {
        return true;
    }
}

function validarApellidos(){
    let apellidos = document.getElementById("inputApellidos").value;
    let errorA = document.getElementById("errorApellidos");

    if (contieneNumero(apellidos) && !comprobarNoVacio(apellidos) && !comprobarPatronTexto(apellidos)){
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

function validarFechaNacimiento() {
    let fechaNac = document.getElementById("inputFecha").value;
    let errorF = document.getElementById("errorFecha");

    const hoy = new Date();

    // Validar que la persona sea mayor de edad
    let edadMinima = 18;
    let fechaHace18Anios = new Date(hoy.getFullYear() - edadMinima, hoy.getMonth(), hoy.getDate());

    if (fechaNac > hoy) {
        errorF.textContent = "La fecha de nacimiento no puede ser en el futuro.";
        return false;
    } else {
        if (fechaNac > fechaHace18Anios) {
            errorF.textContent ="Debe tener al menos 18 años.";
            return false;
        } else {
            return true;
        }
    }
}

function validarCodigo(){
    let codigo = document.getElementById("inputCodigo").value;
    let errorC = document.getElementById("errorCodigo");

    if(codigo.length >= 3 && codigo.length <= 10 && contieneLetra(codigo) && contieneNumero(codigo) && comprobarNoVacio(codigo)){
        return true;
    } else {
        errorC.textContent = "Código no válido. Debe tener entre 3 y 10 caracteres, incluyendo letras y numeros.";
        return false;
    }
}

function validarPassword(){
    let password = document.getElementById("inputPasswordC").value;
    let errorP = document.getElementById("errorPasswordC");
    
    if(password.length >= 8 && password.length <= 12 && comprobacionCaracteresPassword(password) && comprobarNoVacio(password)){
        return true;
    } else {
        errorP.textContent = "Contraseña no válida. Debe tener entre 8 y 12 caracteres y contener números, caracteres especiales, mayúsculas y minúsculas.";
        return false;
    }
}

function validarRegistro(event){
    event.preventDefault(); // Detiene el evento normal
    limpiarErrores(); // Limpia los mensajes de error al comenzar

    if (validarNombre() && validarApellidos() && validarTelefono() && validarFechaNacimiento() && validarCorreo() && validarDireccion() && validarCodigo() && validarPassword()){
        document.getElementById("formulario_registro_empleado").submit(); // Enviar el formulario si todo es válido
    }
}

// Función para limpiar errores anteriores
function limpiarErrores(){
    document.getElementById("errorNombre").textContent = "";
    document.getElementById("errorApellidos").textContent = "";
    document.getElementById("errorEmail").textContent = "";
    document.getElementById("errorTelefono").textContent = "";
    document.getElementById("errorFecha").textContent = "";
    document.getElementById("errorDireccion").textContent = "";
    document.getElementById("errorCodigo").textContent = "";
    document.getElementById("errorPassword").textContent = "";
}

//-------------------------------------Comprobación de determinados elementos-------------------------------------

function contieneNumero(textoN) { 
    var patronN = /\d/; 
    return patronN.test(textoN); 
}

function contieneLetra(textoL) { 
    var patronL = /[a-zA-Z]/; 
    return patronL.test(textoL); 
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
