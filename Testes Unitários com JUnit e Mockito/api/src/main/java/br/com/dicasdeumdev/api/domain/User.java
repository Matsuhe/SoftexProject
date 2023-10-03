package br.com.dicasdeumdev.api.domain;

import jakarta.persistence.*;
import lombok.*;

//@Getter
//@Setter
//@ToString
//@EqualsAndHashCode
@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
public class User   {
    @Id

    @GeneratedValue(strategy = GenerationType.IDENTITY) //deixar o banco de dados cuidar do id
    private Integer id;
    private String name;
    @Column(unique = true)
    private String email;
    private String password;


}
