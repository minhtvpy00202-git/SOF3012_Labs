package poly.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
@Table(name="Users")
public class User {
    @Id
    private String id;
    private String password;
    private String fullname;
    private String email;
    private boolean admin;
    @OneToMany(mappedBy = "user") private List<Favourite> favourites;

    public String getPassword() { return password; }
    public String getFullname() { return fullname; }
}
