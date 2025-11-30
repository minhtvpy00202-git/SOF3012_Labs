package poly.DAO;

import poly.entity.Share;
import poly.model.ShareReport;

import java.util.List;

public interface ShareDAO extends GenericDAO<Share, Long> {

    // Bài 4: tổng hợp chia sẻ của từng video
    List<ShareReport> getShareReports();
}
