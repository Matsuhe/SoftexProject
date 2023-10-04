package br.com.dicasdeumdev.api.services;

import br.com.dicasdeumdev.api.domain.Usuario;
import br.com.dicasdeumdev.api.domain.dto.UserDTO;

import java.util.List;

public interface UserService {
    Usuario findById(Integer id);
    List<Usuario> findAll();
    Usuario create(UserDTO obj);
}
