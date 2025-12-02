package poly.entity;

import java.util.List;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

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

    public String getPassword() {
        return password;
    }

    public String getId() {
        return id;
    }

    public String getFullname() {
        return fullname;
    }

}
