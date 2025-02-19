document.addEventListener("DOMContentLoaded", function(event) {
    //código a ejecutar cuando existe la certeza de que el DOM está listo para recibir acciones
    sesionOk()
});


function sesionOk() {
    if (localStorage.getItem("user")) {
        console.log("sesion ok")
        document.getElementById("userName").innerHTML=JSON.parse(localStorage.getItem("user")).nombre
        document.getElementById("cuenta").innerHTML=JSON.parse(localStorage.getItem("user")).nroCuenta
        document.getElementById("cedula").innerHTML=JSON.parse(localStorage.getItem("user")).cedula
        document.getElementById("domicilio").innerHTML=JSON.parse(localStorage.getItem("user")).domicilio
        document.getElementById("telefono").innerHTML=JSON.parse(localStorage.getItem("user")).telefono
    }else{
        console.log("sesion off")
        location.href="../Login/loginCliente.html"
    }
}