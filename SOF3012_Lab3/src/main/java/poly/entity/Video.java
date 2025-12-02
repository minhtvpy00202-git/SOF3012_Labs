package poly.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
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
@Table(name="Video")
public class Video {
    @Id
    private String id;
    private String title;
    private String poster;
    private String description;
    private boolean active;
    private int views;
    @OneToMany(mappedBy = "video")
    private List<Favourite> favourites;
}
