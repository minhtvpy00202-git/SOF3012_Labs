package entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name="Users")
public class User {
    @Id
    @Column(name="id")
    String id;

    @Column(name="password") String password;
    @Column(name="fullname") String fullname;
    @Column(name="email") String email;
    @Column(name="admin") Boolean admin;
    @Column(name="active") Boolean active;
    @Column(name="isDelete") Boolean isDelete;

}
