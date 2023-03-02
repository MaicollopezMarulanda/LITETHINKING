$(document).ready(function() {
});

async function iniciarSesion() {
  let datos = {};
  datos.correo = document.getElementById('txtCorreo').value;
  datos.password = document.getElementById('txtPassword').value;

  const request = await fetch('api/login', {
    method: 'POST',
    headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    },
    body: JSON.stringify(datos)
  });

  const respuesta = await request.text();
     if (respuesta != 'FAIL') {
        localStorage.token = respuesta;
        localStorage.correo = datos.correo;
        window.location.href = 'usuarios.html'
      } else {
        alert("Las credenciales son incorrectas. Por favor intente nuevamente.");
      }
}