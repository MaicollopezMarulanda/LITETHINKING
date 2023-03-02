// Call the dataTables jQuery plugin
// La liena siguiente indica que se ejecuta
// todo lo que este dentro del ready apenas de carga la pagina
$(document).ready(function() {
    cargarUsuarios();
    $('#usuarios').DataTable();
    actualizarEmailDelUsuario();
});

function actualizarEmailDelUsuario(){
    document.getElementById('txt-email-usuario').outerHTML = localStorage.correo;
}


function ObtenerId(){
    buscarUsuario(document.getElementById('txtId').value);
}


async function cargarUsuarios(){
      <!--Se especificar antes dela funciona que es asincrona ya que utilizamos la palabra reservada await-->
      const request = await fetch('api/usuarios', {
        method: 'GET',
        headers: getHeaders()
      });
      <!--Esta convirtiendo el resultado en json-->
      const usuarios = await request.json();
      console.log(usuarios);

      let listadoHtml='';
      for(let usuario of usuarios){
         let botonEliminar = '<a href="#" onclick="eliminarUsuario('+ usuario.id +')" class="btn btn-danger btn-circle"><i class="fas fa-trash"></i></a>';
         let botonActualizar = '<a href="actualizar.html" onclick="buscarUsuarioActualizar('+ usuario.id +')" class="btn btn-info btn-circle"><i class="fas fa-info-circle"></i></a>';
         //let telefonoTexto = usuario.telefono == null ? '0' : usuario.telefono;
         let usuarioHtml = '<tr><td>'+usuario.id+'</td><td>'+usuario.nombre+'</td><td>'+usuario.apellido+'</td><td>'+usuario.correo+'</td><td>'+usuario.telefono+'</td><td>'+usuario.password+'</td><td>'+botonEliminar+'</td><td>'+botonActualizar+'</td></tr>';
         listadoHtml+=usuarioHtml;
      }
      console.log(usuarios);
      document.querySelector('#usuarios tbody').outerHTML = listadoHtml;

}

async function eliminarUsuario(id) {
     if (!confirm('¿Desea eliminar este usuario?')) {
        return;
     }
     const request = await fetch('api/usuarios/' + id, {
        method: 'DELETE',
        headers: getHeaders()
     });
     location.reload()
}
function limpiar() {
    document.getElementById('txtId').value="";
}

async function buscarUsuario(id) {
    const request = await fetch('api/usuarios/' + id, {
       method: 'GET',
       headers: getHeaders()
    });
    const usuarios = await request.json();
    alert(JSON.stringify(usuarios));
    document.getElementById('txtId').value
    limpiar();
}

function getHeaders() {
    return {
     'Accept': 'application/json',
     'Content-Type': 'application/json',
     'Authorization': localStorage.token
   };
}

