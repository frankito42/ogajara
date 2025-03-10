const modalAprobar = document.getElementById('modalAprobar')
const modalAprobarPago = document.getElementById('modalAprobarPago')
const mAprobar = new mdb.Modal(modalAprobar)
const mAprobarPago = new mdb.Modal(modalAprobarPago)

document.addEventListener("DOMContentLoaded", async function(event) {
    //código a ejecutar cuando existe la certeza de que el DOM está listo para recibir acciones
    sesionOk()
    await cajaPendientes()
    await cajaHoy()
    await cajaMes()
    await listarPagosEnVerificacion()
});
document.getElementById("cerrarSesion").addEventListener("click",()=>{
    cerrarSesion()
})

document.getElementById("modalAprobar").addEventListener("submit",async (e)=>{
    e.preventDefault()
   
})



async function cajaHoy() {
    await fetch('php/caja.php')
    // Exito
    .then(response => response.json())  // convertir a json
    .then(json => {
        console.log(json)
        document.getElementById("cobradoCount").innerHTML=json.contador
        document.getElementById("cobrado").innerHTML=formatWithDots((json.total==null)?0:json.total)
    }) 
}
async function cajaMes() {
    await fetch('php/mes.php')
    // Exito
    .then(response => response.json())  // convertir a json
    .then(json => {
        console.log(json)
        document.getElementById("mes").innerHTML=json.mes
        document.getElementById("mesCount").innerHTML=json.contador
        document.getElementById("mesCobrado").innerHTML=formatWithDots((json.total==null)?0:json.total)
    }) 
}
async function cajaPendientes() {
    await fetch('php/hoyMasPendientes.php')
    // Exito
    .then(response => response.json())  // convertir a json
    .then(json => {
        console.log(json)
        document.getElementById("cobradoAConfirmar").innerHTML=json.contador
        document.getElementById("ingresoAConfirmar").innerHTML=formatWithDots((json.total==null)?0:json.total)
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

async function listarPagosEnVerificacion() {
    // Solicitud GET (Request).
  
    await fetch('php/pagosEnVerificacion.php')
    // Exito
    .then(response => response.json())  // convertir a json
    .then(json => {
        console.log(json)
        dibujarPagosVerificacion(json)
    })    //imprimir los datos en la consola
}

function dibujarPagosVerificacion(params) {
    let verificacionCard=``
    params.forEach(element => {
        verificacionCard+=`<div class="col-12 mb-2">
            <div class="card text-bg-info mb-3">
                <div class="card-header">${element.nombre} ${element.apellido} ${element.nroCuenta}</div>
                <div class="card-body">
                  <h5 class="card-title">pago: ${element.cuotas}</h5>
                  <h5 class="card-title">Total: $${formatWithDots(element.pagado)}</h5>
                  <button onclick="abrirModalEstadoCuenta(${element.id})" class="btn btn-secondary btn-block">Verificar</button>
                </div>
            </div>
        </div>`
    });

    if(params.length==0){
        verificacionCard=`<div class="col-12 mb-2">
        <div class="card text-bg-info mb-3">
            <div class="card-header">Sin cuotas a aprobar</div>
        </div>
    </div>`
    }






        document.getElementById("listarPagos").innerHTML=verificacionCard
}
function dibujarPagosPendientes(params) {
    let aAprobar=``
    params.forEach(element => {
        aAprobar+=`<div class="col-12 mb-2">
            <div class="card border border-info shadow-0 mb-3">
                                <div class="card-body">
                                    <h4 style="display: flex;justify-content: space-between;background: #54b4d3;border-radius: 5px;" class="card-title text-center p-1 text-white"><span>${element.fechaPago} </span><span>Cuota N°${element.nroCuota} </span></h4>
                                    <p class="card-text">Metodo de pago: ${element.metodoPago}</p>
                                    <p class="card-text">Total: $${formatWithDots(element.total)}</p>
                                    <p class="card-text">Vencimiento: ${element.vencimiento}</p>
                                    <button type="button" onclick="abrirModalAprobarPago(${element.id})" class="btn btn-success btn-block" data-mdb-ripple-init>Aprobar</button>
                                </div>
                            </div>
        </div>`
    });
        document.getElementById("Aaprobar").innerHTML=aAprobar
}

async function abrirModalEstadoCuenta(id) {
    localStorage.setItem("ec",id)
    mAprobar.show()
    await traerEstadoDeCuenta()
}
async function abrirModalAprobarPago(id) {
    localStorage.setItem("cuota",id)
    mAprobar.hide()
    mAprobarPago.show()
}
async function traerEstadoDeCuenta() {
    let id=localStorage.getItem("ec")
    await fetch('php/aprobar.php?id='+id)
    // Exito
    .then(response => response.json())  // convertir a json
    .then(json => {
        console.log(json)
        dibujarPagosPendientes(json)
    }) 
}
async function aprobarCuota() {
    let id=localStorage.getItem("cuota")
    await fetch('php/aprobarCuota.php?id='+id)
    // Exito
    .then(response => response.json())  // convertir a json
    .then(async json => {
        console.log(json)
        mAprobarPago.hide()
        await abrirModalEstadoCuenta(localStorage.getItem("ec"))
        await cajaPendientes()
        await cajaHoy()
        await listarPagosEnVerificacion()
        /* dibujarPagosPendientes(json) */
    }) 
}


function formatWithDots(number) {
    return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");
}



function cerrarModal() {
    mAprobarPago.hide()
    mAprobar.show()
}




async function localUser() {
    let user=JSON.parse(localStorage.getItem("user"))
    console.log(user.grupo)
    await fetch('php/addGrupo.php?g='+user.grupo)
    // Exito
    .then(response => response.json())  // convertir a json
    .then(json => {
        console.log(json)
        if(json==false){
            document.getElementById("nroCuenta").value=user.grupo+"-001"
            document.getElementById("nroCuenta").focus()
        }else{
            document.getElementById("nroCuenta").value=incrementarNumero(json.nroCuenta)
            document.getElementById("nroCuenta").focus()
        }
        /* dibujarCuotas(json) */
    }) 
}



