const modalxd = document.getElementById('modalNuevoEgreso')
/* const modalAprobarPago = document.getElementById('modalAprobarPago') */
/* const mAprobar = new mdb.Modal(modalAprobar) */
const xd = new mdb.Modal(modalxd)

document.addEventListener("DOMContentLoaded", async function(event) {
    //código a ejecutar cuando existe la certeza de que el DOM está listo para recibir acciones
    sesionOk()
    /* await cajaPendientes() */
    await cajaEgreso()
    await egresosDelMes()
    await listarEgresos()
    /* await listarPagosEnVerificacion() */
});
document.getElementById("cerrarSesion").addEventListener("click",()=>{
    cerrarSesion()
})

document.getElementById("addEgreso").addEventListener("submit",async (e)=>{
    e.preventDefault()
    xd.hide()
    let form=new FormData(document.getElementById("addEgreso"))
    await fetch('php/addEgreso.php',{
        method:"POST",
        body:form,
    })
    // Exito
    .then(response => response.json())  // convertir a json
    .then(async json => {
        console.log(json)
        await cajaEgreso()
        await egresosDelMes()
        await listarEgresos()
    }) 
})



async function listarEgresos() {
    await fetch('php/listarEgresos.php')
    // Exito
    .then(response => response.json())  // convertir a json
    .then(json => {
        console.log(json)
        dibujarEgresos(json)
    }) 
}




function dibujarEgresos(params) {
    let tr=``
    params.forEach(element => {
        tr+=`
        <tr>
            <td>${element.fecha}</td>
            <td>${element.detalle}</td>
            <td>${element.monto}</td>
        </tr>
        `
    });
    document.getElementById("listarEgresos").innerHTML=tr
}








async function cajaEgreso() {
    await fetch('php/egresosDeHoy.php')
    // Exito
    .then(response => response.json())  // convertir a json
    .then(json => {
        console.log(json)
        document.getElementById("egresosxd").innerHTML=formatWithDots((json.total==null)?0:json.total)
    }) 
}
async function egresosDelMes() {
    await fetch('php/egresosMes.php')
    // Exito
    .then(response => response.json())  // convertir a json
    .then(json => {
        console.log(json)
        document.getElementById("mes").innerHTML=json.mes
        document.getElementById("mesEgresos").innerHTML=formatWithDots((json.total==null)?0:json.total)
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





function formatWithDots(number) {
    return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");
}




