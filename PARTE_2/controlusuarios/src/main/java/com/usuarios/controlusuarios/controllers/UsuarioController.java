package com.usuarios.controlusuarios.controllers;

import com.usuarios.controlusuarios.dao.UsuarioDao;
import com.usuarios.controlusuarios.models.Usuario;
import com.usuarios.controlusuarios.utils.JWTUtil;
import de.mkammerer.argon2.Argon2;
import de.mkammerer.argon2.Argon2Factory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

//La siguiente anotacion indica que esta clase actuara como un controlador
@RestController
public class UsuarioController {
    @Autowired
    private UsuarioDao usuarioDao;
    @Autowired
    private JWTUtil jwtUtil;

    //con la siguiente anotacion de define cual es la ruta que tendra el metodo,ventana,clase a llamar
    @RequestMapping(value = "api/usuariosUno")
    public Usuario getUsuariosUno(){
        Usuario us1 = new Usuario();
        us1.setId(1);
        us1.setNombre("Marilin");
        us1.setApellido("Martinez");
        us1.setCorreo("marilin@gmail.com");
        us1.setTelefono(322);
        us1.setPassword("123456789");
        return us1;
    }

    @RequestMapping(value = "api/usuarios", method = RequestMethod.GET)
    public List<Usuario> getUsuarios(@RequestHeader(value="Authorization") String token){
        if (!validarToken(token)) { return null; }
        return usuarioDao.getUsuarios();
    }

    private boolean validarToken(String token) {
        String usuarioId = jwtUtil.getKey(token);
        return usuarioId != null;
    }

    @RequestMapping(value = "api/usuarios/{id}", method = RequestMethod.DELETE)
    public void eliminarUsuario(@RequestHeader(value="Authorization") String token,@PathVariable Long id) {
        if (!validarToken(token)) { return; }
        usuarioDao.eliminarUsuario(id);
    }

    //METODO BUSCAR
    @RequestMapping(value = "api/usuarios/{id}", method = RequestMethod.GET)
    public Usuario buscarUsuario(@RequestHeader(value="Authorization") String token,@PathVariable Long id) {
        if (!validarToken(token)) { return null; }
        return usuarioDao.buscarUsuario(id);
    }


    @RequestMapping(value = "api/usuarios",method = RequestMethod.POST)
    public void registrarUsuario(@RequestBody Usuario usuario){
        Argon2 argon2= Argon2Factory.create(Argon2Factory.Argon2Types.ARGON2id);
        /*
        El primer valor del siguiente metodo indica la cantidad de interacciones que tendra la clave
        El segundo valor indica el uso de memoria a utilizar
        El tercero indica si se van a crear varios hilos de procesos
        */
        String hash=argon2.hash(1,1024,1,usuario.getPassword());
        usuario.setPassword(hash);
        usuarioDao.registrar(usuario);
    }

    @RequestMapping(value = "api/frutas")
    public List<String> getFrutas(){
        List<String> frutas = new ArrayList<>();
        frutas.add("Manzanas");
        frutas.add("Peras");
        frutas.add("Mango");
        return frutas;
    }
}
