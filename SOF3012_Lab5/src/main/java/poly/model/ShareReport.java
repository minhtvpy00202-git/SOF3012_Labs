// src/main/java/poly/model/ShareReport.java
package poly.model;

import java.util.Date;

public class ShareReport {
    private String videoId;
    private String title;
    private Long shareCount;
    private Date firstShareDate;
    private Date lastShareDate;

    public ShareReport(String videoId, String title,
                       Long shareCount, Date firstShareDate, Date lastShareDate) {
        this.videoId = videoId;
        this.title = title;
        this.shareCount = shareCount;
        this.firstShareDate = firstShareDate;
        this.lastShareDate = lastShareDate;
    }

    public String getVideoId() { return videoId; }
    public String getTitle() { return title; }
    public Long getShareCount() { return shareCount; }
    public Date getFirstShareDate() { return firstShareDate; }
    public Date getLastShareDate() { return lastShareDate; }
}
