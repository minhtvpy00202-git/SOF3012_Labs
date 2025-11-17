package poly.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;


@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder

@Entity
@Table(name="Favourite", uniqueConstraints = @UniqueConstraint(columnNames = {"UserId","VideoId"}))
public class Favourite {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @ManyToOne
    @JoinColumn(name="VideoId")
    private Video video;
    @ManyToOne
    @JoinColumn(name="UserId")
    private User user;
    @Temporal(TemporalType.DATE)
    private Date likeDate;
}
