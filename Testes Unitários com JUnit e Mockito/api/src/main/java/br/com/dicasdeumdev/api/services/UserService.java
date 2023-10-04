package br.com.dicasdeumdev.api.services;

import br.com.dicasdeumdev.api.domain.Usuario;

public interface UserService {
    Usuario findById(Integer id);
}
