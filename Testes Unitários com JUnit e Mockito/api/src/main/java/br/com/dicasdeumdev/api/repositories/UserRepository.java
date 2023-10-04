package br.com.dicasdeumdev.api.repositories;

import br.com.dicasdeumdev.api.domain.Usuario;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends JpaRepository<Usuario, Integer> {
}
