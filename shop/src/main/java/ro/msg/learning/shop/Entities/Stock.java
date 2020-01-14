package ro.msg.learning.shop.Entities;

import lombok.*;

import javax.persistence.*;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@Entity
@Builder
public class Stock {

    @Id
    @GeneratedValue
    private Integer id;

    private Integer quantity;

    @ManyToOne
    private Product product;

    @ManyToOne
    private Location location;
}
