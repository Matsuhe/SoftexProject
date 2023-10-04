package br.com.dicasdeumdev.api;

import br.com.dicasdeumdev.api.domain.Usuario;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class ApiApplication {

    public static void main(String[] args) {
        SpringApplication.run(ApiApplication.class, args);
        Usuario usuario = new Usuario(1, "Matsuhe", "matsuhe@hotmail.com", "123");
    }

}
