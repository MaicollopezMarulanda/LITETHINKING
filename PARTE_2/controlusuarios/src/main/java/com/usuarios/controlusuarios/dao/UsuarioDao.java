package com.usuarios.controlusuarios.dao;

import com.usuarios.controlusuarios.models.Usuario;

import java.util.List;

public interface UsuarioDao {
    List<Usuario> getUsuarios();

    void eliminarUsuario(Long id);

    void registrar(Usuario usuario);

    Usuario obtenerUsuarioPorCredenciales(Usuario usuario);

    Usuario buscarUsuario(Long id);
}
