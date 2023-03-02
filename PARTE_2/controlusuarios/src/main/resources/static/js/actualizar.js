$(document).ready(function() {
    //$('#usuarios').DataTable();
    //saludar();
    //ObtenerId();
});

function saludar(){
    alert("Hola desde actualizar comprobado");
}

async function buscarUsuarioActualizar(id) {
    const request = await fetch('api/usuarios/' + id, {
       method: 'GET',
       headers: getHeaders()
    });
    const usuarios = await request.json();
    document.getElementById('actualizaNombre').outerHTML = localStorage.nombre;
    alert(JSON.stringify(usuarios));
    console.log("Script Actualizar");
    //location.reload();
}