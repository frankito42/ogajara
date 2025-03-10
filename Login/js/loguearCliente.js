document.getElementById("formInicioSesion").addEventListener("submit",async (e)=>{
    e.preventDefault()
    let credenciales=new FormData(document.getElementById("formInicioSesion"))
    console.log("uwuuuuuuuuu")
    await fetch(`php/loguearCli.php`,{
        method:"post",
        body:credenciales
    })
    .then(response => response.json())
    .then((data)=>{
        console.log(data) 
        if(data=="mal"){
            alert("Ops ocurrio un error")
        }else{
            localStorage.setItem("user", JSON.stringify(data));
            location.href="../cliente/index.html"

        }
    });
})
console.log("asd")