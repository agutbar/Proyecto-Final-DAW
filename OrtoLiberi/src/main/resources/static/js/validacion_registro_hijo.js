window.onload = iniciar;

function iniciar(){
    document.getElementById("registrar_hijo").addEventListener("click", validarRegistro, false);
}

document.getElementById("formulario_registro_hijo").setAttribute("novalidate","novalidate"); //Desactivar validacion de HTML si está activo JavaScript

function validarNombre(){
    let nombre = document.getElementById("inputNombre").value;
    let errorN = document.getElementById("errorNombre");

    if (contieneNumero(nombre) && !comprobarNoVacio(nombre) && !comprobarPatronTexto(nombre)){
        errorN.textContent = "Nombre no válido. Debe tener debe tener entre 3 y 100 caracteres.";
        return false;
    } else {
        return true;
    }
}

function validarApellidos(){
    let apellidos = document.getElementById("inputApellido").value;
    let errorA = document.getElementById("errorApellido");

    if (contieneNumero(apellidos) && !comprobarNoVacio(apellidos) && !comprobarPatronTexto(apellidos)){
        errorA.textContent = "Apellidos no válidos. Debe tener debe tener entre 3 y 100 caracteres.";
        return false;
    } else {
        return true;
    }
}

function validarFechaNacimiento() {
    let fechaNac = document.getElementById("inputFecha").value;
    let errorF = document.getElementById("errorFecha");

    const hoy = new Date();

    // Validar que la persona sea menor de edad
    let edadMaxima = 18;
    let fechaHace18Anios = new Date(hoy.getFullYear() - edadMaxima, hoy.getMonth(), hoy.getDate());

    if (fechaNac > hoy) {
        errorF.textContent = "La fecha de nacimiento no puede ser en el futuro.";
        return false;
    } else {
        if (fechaNac <= fechaHace18Anios) {
            errorF.textContent ="Debe tener menos de 18 años.";
            return false;
        } else {
            return true;
        }
    }
}


function validarRegistro(event){
    event.preventDefault(); // Detiene el evento normal
    limpiarErrores(); // Limpia los mensajes de error al comenzar

    if (validarNombre() && validarApellidos() && validarFechaNacimiento()){
        document.getElementById("formulario_registro_hijo").submit(); // Enviar el formulario si todo es válido
    }
}

// Función para limpiar errores anteriores
function limpiarErrores(){
    document.getElementById("errorNombre").textContent = "";
    document.getElementById("errorApellidos").textContent = "";
    document.getElementById("errorFecha").textContent = "";
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
