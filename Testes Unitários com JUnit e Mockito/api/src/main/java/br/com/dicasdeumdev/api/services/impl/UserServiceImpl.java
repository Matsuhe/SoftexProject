package br.com.dicasdeumdev.api.services.impl;

import br.com.dicasdeumdev.api.domain.Usuario;
import br.com.dicasdeumdev.api.domain.dto.UserDTO;
import br.com.dicasdeumdev.api.repositories.UserRepository;
import br.com.dicasdeumdev.api.services.UserService;
import br.com.dicasdeumdev.api.services.exceptions.ObjectNotFoundException;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserRepository repository;
    @Autowired
    private ModelMapper mapper;
    @Override
    public Usuario findById(Integer id) {
        Optional<Usuario> obj = repository.findById(id);
        return obj.orElseThrow(()->new ObjectNotFoundException("Objeto não encontrado"));
    }

    public List<Usuario> findAll(){
        return repository.findAll();
    }

    @Override
    public Usuario create(UserDTO obj) {
        return repository.save(mapper.map(obj, Usuario.class));
    }
}
