package br.com.dicasdeumdev.api.services.impl;

import br.com.dicasdeumdev.api.domain.Usuario;
import br.com.dicasdeumdev.api.domain.dto.UserDTO;
import br.com.dicasdeumdev.api.repositories.UserRepository;
import br.com.dicasdeumdev.api.services.exceptions.DataIntegratyViolationException;
import br.com.dicasdeumdev.api.services.exceptions.ObjectNotFoundException;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.modelmapper.ModelMapper;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;
import java.util.Optional;

import static org.hibernate.validator.internal.util.Contracts.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.ArgumentMatchers.*;
import static org.mockito.Mockito.when;


@SpringBootTest
class UserServiceImplTest {
    public static final int ID = 1;
    public static final String name = "Matsuhe";
    public static final String email = "matsuhe@hotmail.com";
    public static final String password = "123";
    public static final String OBJETO_NAO_ENCONTRADO = "Objeto nao encontrado";
    private static final int INDEX = 0;

    @InjectMocks
    private UserServiceImpl service;
    @Mock
    private UserRepository repository;
    @Mock
    private ModelMapper mapper;
    private Usuario user;
    private UserDTO userDTO;
    private Optional<Usuario> optionalUser;
    @BeforeEach
    void setUp() {
        MockitoAnnotations.openMocks(this);
        startUser();
    }

    @Test
    void findById() {
        when(repository.findById(any())).thenReturn(optionalUser);
        Usuario response = service.findById(ID);
        assertNotNull(response);
        assertEquals(Usuario.class, response.getClass());
        assertEquals(ID, response.getId());
        assertEquals(name, response.getName());
        assertEquals(email, response.getEmail());
    }

    @Test
    void whenFindByIdThenReturnAnObjectNotFoundException() {

        when(repository.findById(anyInt())).thenThrow(new ObjectNotFoundException(OBJETO_NAO_ENCONTRADO));

        try{
            service.findById(ID);
        } catch (Exception ex) {
            assertEquals(ObjectNotFoundException.class, ex.getClass());
            assertEquals(OBJETO_NAO_ENCONTRADO, ex.getMessage());
        }
    }

    @Test
    void findAll() {
        when(repository.findAll()).thenReturn(List.of(user));

        List<Usuario> response = service.findAll();

        assertNotNull(response);
        assertEquals(1, response.size());
        assertEquals(Usuario.class, response.get(INDEX).getClass());

        assertEquals(ID, response.get(INDEX).getId());
        assertEquals(name, response.get(INDEX).getName());
        assertEquals(email, response.get(INDEX).getEmail());
        assertEquals(password, response.get(INDEX).getPassword());
    }

    @Test
    void create() {
        when(repository.save(any())).thenReturn(user);

        Usuario response = service.create(userDTO);

        assertNotNull(response);
        assertEquals(Usuario.class, response.getClass());
        assertEquals(ID, response.getId());
        assertEquals(name, response.getName());
        assertEquals(email, response.getEmail());
        assertEquals(password, response.getPassword());
    }

    @Test
    void whenCreateThenReturnAnDataIntegrityViolationException() {
        when(repository.findByEmail(anyString())).thenReturn(optionalUser);

        try{
            optionalUser.get().setId(2);
            service.create(userDTO);
        } catch (Exception ex) {
            assertEquals(DataIntegratyViolationException.class, ex.getClass());
            assertEquals("Email ja cadastrado no sistema", ex.getMessage());
        }
    }

    @Test
    void update() {
        when(repository.save(any())).thenReturn(user);

        Usuario response = service.update(userDTO);

        assertNotNull(response);
        assertEquals(Usuario.class, response.getClass());
        assertEquals(ID, response.getId());
        assertEquals(name, response.getName());
        assertEquals(email, response.getEmail());
        assertEquals(password, response.getPassword());
    }

    @Test
    void delete() {
    }

    private void startUser(){
        
        user = new Usuario(ID, name, email, password);
        userDTO = new UserDTO (ID, name, email, password);
        optionalUser = Optional.of(new Usuario(ID, name, email, password));

    }
}