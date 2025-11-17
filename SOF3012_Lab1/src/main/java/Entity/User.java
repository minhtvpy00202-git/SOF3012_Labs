package Entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.*;
@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name="Users")
public class User {
    @Id
    @Column(name="id")
    String id;
    @Column(name="password")
    String password;
    @Column(name="fullname")
    String fullname;
    @Column(name="email")
    String email;
    @Column(name="admin")
    boolean admin=false;
}
