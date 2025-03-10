const modalDetalleCuotas = document.getElementById('modalDetalleCuotas')
const modalD = new mdb.Modal(modalDetalleCuotas)

document.addEventListener("DOMContentLoaded",async function(event) {
    //código a ejecutar cuando existe la certeza de que el DOM está listo para recibir acciones


    document.getElementById("cerrarSesion").addEventListener("click",()=>{
        cerrarSesion()
    })













    sesionOk()
    await traerEstadoDeCuenta()
    await traerHistorial()
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


async function traerEstadoDeCuenta() {
    let id=JSON.parse(localStorage.getItem("user")).id
    await fetch('php/verMiEstadoCuenta.php?id='+id)
    // Exito
    .then(response => response.json())  // convertir a json
    .then(json => {
        console.log(json)
        dibujarEstadoCuenta(json)
    }) 
}

async function abrirDetalles(id) {
    modalD.show()
    await listarCuotas(id)

}



async function traerHistorial() {
    let id=JSON.parse(localStorage.getItem("user")).id
    await fetch('php/historial.php?id='+id)
    // Exito
    .then(response => response.json())  // convertir a json
    .then(json => {
        console.log(json)
        dibujarHistorial(json)
    }) 
}
async function listarCuotas(id) {
    await fetch('php/listarCuotas.php?id='+id)
    // Exito
    .then(response => response.json())  // convertir a json
    .then(json => {
        console.log(json)
        dibujarCuotitas(json)
    }) 
}

function dibujarCuotitas(params) {
    let card=``
    params.forEach(element => {
        card+=`<div class="col-12 mb-2">
                <div class="card text-center">
                  <div class="card-header" style="font-weight: bold;">Cuota N°${element.nroCuota}</div>
                  <div class="card-body">
                    <h5 class="card-title">Monto a pagar: $${formatWithDots(element.total)}</h5>
                    <p class="card-text">${(element.idUser!=0)?`Vencimiento: ${element.vencimiento}`:``}</p>
                  </div>
                  ${(element.idUser!=0)?`<div class="card-footer text-success">Pagado el: ${element.fechaPago}</div>`:`<div class="card-footer text-danger">Vencimiento: ${element.vencimiento}</div>`}
                </div>
              </div>`
    });

    document.getElementById("listarCuotasXd").innerHTML=card
}
function dibujarHistorial(params) {
    let card=``
    params.forEach(element => {
        card+=`<tr>
            <td>${element.fechaPago}</td>
            <td>${element.nroCuota}</td>
            <td>$${formatWithDots(element.total)}</td>
        </tr>`
    });
    if (params.lenght>=0) {
        card=`<tr>
            <td coslpan="3">Sin datos</td>
        </tr>` 
    }
    document.getElementById("xdTablaHistorial").innerHTML=card
}
function dibujarEstadoCuenta(params) {
    let card=``
    params.forEach(element => {
        card+=`<div class="col-12 mb-2">
                <div class="card text-bg-info mb-3">
                    <div class="card-header">Estado de cuenta</div>
                    <div class="card-body">
                      <h5 class="card-title">MT2 ${element.mt2}</h5>
                      <p class="card-text">Cuotas pagadas ${element.pagado}/${element.cuotas}</p>
                      <button onclick="abrirDetalles(${element.id})" type="button" class="btn btn-secondary btn-block" data-mdb-ripple-init>Ver Cuotas</button>
                    </div>
                  </div>
            </div>`
    });
    if (params.lenght>=0) {
        card=`<div class="col-12 mb-2">
        <div class="card text-bg-info mb-3">
            <div class="card-header">Estado de cuenta</div>
            <div class="card-body">
              <h5 class="card-title">Sin datos.</h5>
              <p class="card-text">sin Datos</p>
            </div>
          </div>
    </div>  ` 
    }
    document.getElementById("listarEstadoCuenta").innerHTML=card
}


function formatWithDots(number) {
    return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");
}
function cerrarSesion() {
    localStorage.clear()
    location.href="../Login/loginCliente.html"
}