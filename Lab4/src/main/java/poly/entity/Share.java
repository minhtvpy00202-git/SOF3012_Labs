package poly.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Entity
@Table(name="Share")
public class Share {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)  private Long id;
    @ManyToOne
    @JoinColumn(name="VideoId")
    private Video  video;
    @ManyToOne
    @JoinColumn(name="UserId")
    private User user;
    private String emails;
    @Temporal(TemporalType.DATE)
    private Date shareDate;
}
