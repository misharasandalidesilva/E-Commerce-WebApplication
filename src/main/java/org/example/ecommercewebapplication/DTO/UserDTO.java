package org.example.ecommercewebapplication.DTO;

import lombok.*;

@Getter
@Setter
@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserDTO {

    private int id;
    private String name;
    private String email;
    private String password;
    private String confirmPassword;
    private String role;
}
