package br.com.dicasdeumdev.api.resources;

import br.com.dicasdeumdev.api.domain.Usuario;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value = "/user")
public class UserResource {
    @GetMapping(value = "/{id}")
    public ResponseEntity<Usuario> findById(@PathVariable Integer id){
         return ResponseEntity.ok().body(new Usuario(1, "Matsuhe", "matsuhe@hotmail.com", "123"));
    }
}
