const modalNewCliente = document.getElementById('modalClienteNuevo')
const modailCliente = new mdb.Modal(modalNewCliente)

document.addEventListener("DOMContentLoaded", function(event) {
    //código a ejecutar cuando existe la certeza de que el DOM está listo para recibir acciones
    sesionOk()
});
document.getElementById("cerrarSesion").addEventListener("click",()=>{
    cerrarSesion()
})
document.getElementById("search").addEventListener("submit",async (e)=>{
    e.preventDefault()
    await buscarClientes()
})
document.getElementById("addCliente").addEventListener("submit",async (e)=>{
    e.preventDefault()
    await guardarCliente()
})


async function guardarCliente() {
    let form=new FormData(document.getElementById("addCliente"))
    await fetch('php/insertCliente.php',{
        method:"post",
        body:form,
    })
    // Exito
    .then(response => response.json())  // convertir a json
    .then(json => {
        console.log(json)
        modailCliente.hide()
        document.getElementById("addCliente").reset()
    }) 
}

function sesionOk() {
    if (localStorage.getItem("user")) {
        console.log("sesion ok")
        document.getElementById("userName").innerHTML=JSON.parse(localStorage.getItem("user")).user
    }else{
        console.log("sesion off")
        location.href="../Login/admin.html"
    }
}
function cerrarSesion() {
    localStorage.clear()
    location.href="../Login/admin.html"
}

async function buscarClientes() {
    // Solicitud GET (Request).
    let form=new FormData(document.getElementById("search"))
    await fetch('php/filtrar.php',{
        method:"post",
        body:form,
    })
    // Exito
    .then(response => response.json())  // convertir a json
    .then(json => {
        console.log(json)
        dibujar(json)
    })    //imprimir los datos en la consola
}
function dibujar(params) {
    let card=`<div class="col-12 mb-2">
            <div class="d-flex align-items-center cardCliente">
                <i class="fa-solid fa-person fa-2x"></i>
                <div class="ms-3">
                  <p class="fw-bold mb-1">${params.nombre} ${params.apellido}</p>
                  <p class="text-muted mb-0">Nro cuenta ${params.nroCuenta}</p>
                  <p class="text-muted mb-0">${params.cedula}</p>
                  <button class="btn btn-success">Ver estado de cuenta</button>
                </div>
              </div>
        </div>`
        document.getElementById("listarClientes").innerHTML=card
}