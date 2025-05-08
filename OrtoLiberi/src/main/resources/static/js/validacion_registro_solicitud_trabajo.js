window.onload = iniciar;

function iniciar(){
    document.getElementById("registrar_solicitud").addEventListener("click", validarRegistro, false);
}

document.getElementById("formulario_registro_solicitud_trabajo").setAttribute("novalidate","novalidate"); //Desactivar validacion de HTML si está activo JavaScript

function validarNombre(){
    let nombre = document.getElementById("inputProfileNombre").value;
    let errorN = document.getElementById("errorProfileNombre");

    if (contieneNumero(nombre) && !comprobarNoVacio(nombre) && !comprobarPatronTexto(nombre)){
        errorN.textContent = "Nombre no válido. Debe tener debe tener entre 3 y 100 caracteres.";
        return false;
    } else {
        return true;
    }
}

function validarCorreo(){
    let correo = document.getElementById("inputProfileEmail").value;
    let errorE = document.getElementById("errorProfileEmail");
    if (contieneArroba(correo) && contienePunto(correo) && comprobarNoVacio(correo) && comprobarPatronCorreo(correo)){
        return true;
    } else {
        errorE.textContent = "Email no válido.";
        return false;
    }
}

function validarCV(){
    let curriculum = document.getElementById("inputProfileCV");
    let errorCV = document.getElementById("errorProfileCV");
    let archivo = curriculum.files[0]; // Obtiene el archivo seleccionado

    if (archivo) {
        let tipoArchivo = archivo.type;
        let extensionArchivo = archivo.name.split('.').pop().toLowerCase();

        if (tipoArchivo !== "application/pdf" || extensionArchivo !== "pdf") {
            errorCV.textContent = "Por favor, adjunta un archivo PDF válido.";
            return false;
        } else {
            return true;
        }
    } else {
        errorCV.textContent = "Por favor, selecciona un archivo.";
        return false;
    }
}

function validarLDP() {
    let aceptarLDP = document.getElementById("inputProfileLPD");
    let errorLDP = document.getElementById("errorProfileLPD");

    if (aceptarLDP.checked) {
        return true;
    } else {
        errorLDP.textContent = "Debes aceptar la política de protección de datos.";
        return false;
    }
}

function validarRegistro(event){
    event.preventDefault(); // Detiene el evento normal
    limpiarErrores(); // Limpia los mensajes de error al comenzar

    if (validarNombre() && validarCorreo() && validarCV() && validarLDP()){
        mostrarModalConfirmacion();
        document.getElementById("formulario_registro_solicitud_trabajo").submit(); // Enviar el formulario si todo es válido
    }
}

function limpiarErrores(){
    document.getElementById("errorProfileNombre").textContent = "";
    document.getElementById("errorProfileEmail").textContent = "";
    document.getElementById("errorPassword").textContent = "";
    document.getElementById("errorPassword").textContent = "";
}

function mostrarModalConfirmacion() {
    var modalConfir = new bootstrap.Modal(document.getElementById("modalConfirmacion"));
    modalConfir.show();
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