
function iniciar(){
    document.getElementById("acceder_cliente").addEventListener("click", validarAcceso, false);
}

document.getElementById("formulario_acceso_cliente").setAttribute("novalidate","novalidate"); //Desactivar validacion de HTML si está activo JavaScript

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

function validarPassword(){
    let password = document.getElementById("inputPassword").value;
    let errorP = document.getElementById("errorPassword");
    
    if(password.length >= 8 && password.length <= 12 && comprobacionCaracteresPassword(password) && comprobarNoVacio(password)){
        return true;
    } else {
        errorP.textContent = "Contraseña no válida. Debe tener entre 8 y 12 caracteres y contener números, caracteres especiales, mayúsculas y minúsculas.";
        return false;
    }
}

function validarAcceso(event){
    event.preventDefault(); // Detiene el evento normal
    limpiarErrores(); // Limpia los mensajes de error al comenzar

    if (validarUsuario() && validarPassword()){
        document.getElementById("formulario_acceso_cliente").submit(); // Enviar el formulario si todo es válido
    }
}

// Función para limpiar errores anteriores
function limpiarErrores(){
    document.getElementById("errorUsuario").textContent = "";
    document.getElementById("errorPassword").textContent = "";
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



/*Para facilitar la lectura del código, se juntan las 4 comprobaciones
en una para que no se extienda tanto en las dos validaciones de la contraseña*/
function comprobacionCaracteresPassword(textoCP){
    if (contieneNumero(textoCP) && contieneCaracterEspecial(textoCP) && tieneMayusculas(textoCP) && tieneMinusculas(textoCP)){
        return true;
    } else {
        return false;
    }
}
