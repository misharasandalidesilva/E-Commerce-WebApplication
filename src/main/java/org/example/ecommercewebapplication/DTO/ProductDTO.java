package org.example.ecommercewebapplication.DTO;

import lombok.*;

@Getter
@Setter
@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProductDTO {
    private int id;
    private String name;
    private String description;
    private double price;
    private int categoryId;
    private String categoryName;
    private int quantity;
    private String size;
    private String category;
}
