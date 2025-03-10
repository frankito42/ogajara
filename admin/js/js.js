const modalVerCuotas = document.getElementById('modalVerCuotas')
const modalCasa = document.getElementById('modalVenta')
const estadoCuenta = document.getElementById('estadoCuenta')
const modalNewCliente = document.getElementById('modalClienteNuevo')
const modalTipoPago = document.getElementById('modalTipoPago')
const modailCliente = new mdb.Modal(modalNewCliente)
const modalFormCasa = new mdb.Modal(modalCasa)
const modalEstadoCuenta = new mdb.Modal(estadoCuenta)
const mVerCuotas = new mdb.Modal(modalVerCuotas)
const mTipoPago = new mdb.Modal(modalTipoPago)

document.addEventListener("DOMContentLoaded", async function(event) {
    //código a ejecutar cuando existe la certeza de que el DOM está listo para recibir acciones
    sesionOk()
    if(JSON.parse(localStorage.getItem("user")).privilegios==2){
        await cajaHoy()    
    }else{
        document.getElementById("cajaHoyXd").style.display="none"
    }
    await listarClientes()
    
});
document.getElementById("cerrarSesion").addEventListener("click",()=>{
    cerrarSesion()
})
document.getElementById("search").addEventListener("submit",async (e)=>{
    e.preventDefault()
    await buscarClientes()
})
document.getElementById("formCasa").addEventListener("submit",async (e)=>{
    e.preventDefault()
    await venderCasa()
})
document.getElementById("addCliente").addEventListener("submit",async (e)=>{
    e.preventDefault()
    await guardarCliente()
    await listarClientes() 
})
document.getElementById("formPagar").addEventListener("submit",async (e)=>{
    e.preventDefault()
    await pagarCuota()
    await traerCuotas(localStorage.getItem("planId"))
    await cajaHoy()
})


async function pagarCuota() {
    let form=new FormData(document.getElementById("formPagar"))
    let user=JSON.parse(localStorage.getItem("user"))
    form.append("id",localStorage.getItem("idDeCuota"))
    form.append("idUser",user.idUser)
    await fetch('php/pagar.php',{
        method:"post",
        body:form,
    })
    // Exito
    .then(response => response.json())  // convertir a json
    .then(json => {
        console.log(json)
        mTipoPago.hide()
        document.getElementById("formPagar").reset()
        mVerCuotas.show()
        /* document.getElementById("cardCuota"+localStorage.getItem("idDeCuota")).style.background="#e5ffe5"
        document.getElementById("btnOcultar"+localStorage.getItem("idDeCuota")).style.display="none" */
    }) 
}
async function cajaHoy() {
    let user=JSON.parse(localStorage.getItem("user"))
    await fetch('php/cajaHoy.php?idUser='+user.idUser)
    // Exito
    .then(response => response.json())  // convertir a json
    .then(json => {
        console.log(json)
        document.getElementById("cobradoCount").innerHTML=json.contador
        document.getElementById("cobrado").innerHTML=formatWithDots((json.total==null)?0:json.total)
    }) 
}
async function venderCasa() {
    let form=new FormData(document.getElementById("formCasa"))
    await fetch('php/venderCasa.php',{
        method:"post",
        body:form,
    })
    // Exito
    .then(response => response.json())  // convertir a json
    .then(json => {
        console.log(json)
        modalFormCasa.hide()
        document.getElementById("formCasa").reset()
    }) 
}
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
async function listarClientes() {
    // Solicitud GET (Request).
    let form=new FormData(document.getElementById("search"))
    await fetch('php/listar.php',{
        method:"post",
        body:form,
    })
    // Exito
    .then(response => response.json())  // convertir a json
    .then(json => {
        console.log(json)
        dibujarOption(json)
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
                  <button onclick="abrirModalEstadoCuenta(${params.id})" class="btn btn-success">Ver estado de cuenta</button>
                </div>
              </div>
        </div>`
        if(params==false){
            card=`<div class="col-12 mb-2">
            <div class="d-flex align-items-center cardCliente">
                <i class="fa-solid fa-person fa-2x"></i>
                <div class="ms-3">
                  <p class="fw-bold mb-1">Sin datos.</p>
                </div>
              </div>
        </div>`
        }
        document.getElementById("listarClientes").innerHTML=card
}

async function descargarContrato(id,idE) {
    const formData = new FormData();

            formData.append('id', id);
            formData.append('idE', idE);

            fetch('php/process_word.php', {
                method: 'POST',
                body:formData
            })
            .then(response => response.json())
            .then(data => {
                if (data.filePath) {
                    // Crear un enlace para descargar el archivo
                    const link = document.createElement('a');
                    link.href = "php/uploads/cm.docx";
                    link.download = "CONTRATO"+data.filePath+".docx";
                    link.click();
                } else {
                    alert('Ocurrió un error al procesar el archivo.');
                }
            })
            .catch(error => {
                console.error('Error:', error);
                alert('Hubo un problema con la carga del archivo.');
            });
        
}



function dibujarOption(params) {
    let option=``
    params.forEach(element => {
        option+=`<option value="${element.id}">${element.nombre} ${element.apellido}</option>`
    });
        document.getElementById("selectCliente").innerHTML=option
}

async function abrirModalEstadoCuenta(id) {
    localStorage.setItem("idCliente",id)
    modalEstadoCuenta.show()
    await traerEstadoDeCuenta(id)
}
async function traerEstadoDeCuenta(id) {
    await fetch('php/listarEstadoDeCuenta.php?idCliente='+id)
    // Exito
    .then(response => response.json())  // convertir a json
    .then(json => {
        console.log(json)
        dibujarEstadoDeCuenta(json)
    }) 
}
function dibujarEstadoDeCuenta(params) {
    let tr=``
    params.forEach(element => {
        tr+=`
            <div class="col-12 mb-2">
                <div class="card">
                <div class="card-body">
                    <h5 style="padding: 1%;background: #e1e1e1;border-radius: 5px;" class="card-title"><b>MT2 ${element.mt2}</b></h5>
                    <p class="card-text">Cuotas ${element.cuotas}</p>
                    <p class="card-text">Cuotas pagadas ${element.pagado}</p>
                    <p class="card-text">Estado ${(element.estado==0)?"<span style='border-radius: 5px;background: #fdbcbc;padding: 1%;'>Pendiente</span>":"<span style='border-radius: 5px;background:rgb(203, 253, 188);padding: 1%;'>Pendiente</span>"}</p>
                    <button onclick="verCuotas(${element.id})" class="btn btn-success btn-block">Ver</button>
                    <button onclick="descargarContrato(${element.idCliente},${element.id})" class="btn btn-success btn-block mt-2">Descargar Contrato</button>

                </div>
                </div>
            </div>`
    });
        document.getElementById("compras").innerHTML=tr
}

async function verCuotas(id) {
    localStorage.setItem("planId",id)
    modalEstadoCuenta.hide()
    mVerCuotas.show()
    await traerCuotas(id)
}
async function abriModalPagar(id,total) {
    localStorage.setItem("idDeCuota",id)
    document.getElementById("totalPagar").innerHTML=formatWithDots(total)
    mVerCuotas.hide()
    mTipoPago.show()
}

async function traerCuotas(id) {
    await fetch('php/listarCuotas.php?id='+id)
    // Exito
    .then(response => response.json())  // convertir a json
    .then(json => {
        console.log(json)
        dibujarCuotas(json)
    }) 
}

function dibujarCuotas(params) {
    let tr=``
    let ver=``
    params.forEach(element => {
        if(JSON.parse(localStorage.getItem("user")).privilegios==2){
            ver=`<button style="display:${(element.estado==1)?"none":""};" id="btnOcultar${element.id}" type="button" onclick="abriModalPagar(${element.id},${element.total})" class="btn btn-success btn-block" data-mdb-ripple-init>Pagar</button>`
        }
        tr+=`<div class="col-12 mb-2">
                <div style="background:${(element.estado==1)?"rgb(229, 255, 229)":""};" id="cardCuota${element.id}" class="card">
                <div class="card-body">
                    <h5 class="card-title"><b>Nro cuota ${element.nroCuota}</b></h5>
                    <p class="card-text">Vence: ${element.vencimiento} $${formatWithDots(element.total)}</p>
                    ${ver}
                    ${(element.estado==1)?`<h3 class="text-center" style="background: #14a44d;padding: 1%;border-radius: 5px;color: white;">Fecha de pago ${element.fechaPago}</h3>`:""}
                </div>
                </div>
            </div>`
            ver=``
    });
        document.getElementById("cuotasXd").innerHTML=tr
}
function formatWithDots(number) {
    return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");
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
function incrementarNumero(cadena) {
    // Separa la cadena en dos partes: antes y después del guion
    let partes = cadena.split('-');
    
    // Convierte la segunda parte a un número, lo incrementa y lo formatea nuevamente con ceros a la izquierda
    let numero = parseInt(partes[1], 10);
    numero++;
    let numeroFormateado = numero.toString().padStart(3, '0');
    
    // Junta las dos partes nuevamente
    return partes[0] + '-' + numeroFormateado;
}