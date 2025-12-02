package poly.entity;

import jakarta.persistence.*;
import java.util.Date;

@Entity
@Table(name = "Logs")
public class Log {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "url", nullable = false, length = 500)
    private String url;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "accessTime", nullable = false)
    private Date accessTime;

    @Column(name = "username", length = 20)
    private String username;

    public Long getId() { return id; }
    public String getUrl() { return url; }
    public void setUrl(String url) { this.url = url; }
    public Date getAccessTime() { return accessTime; }
    public void setAccessTime(Date accessTime) { this.accessTime = accessTime; }
    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }
}
