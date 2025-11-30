// src/main/java/poly/DAO/Impl/ShareDAOImpl.java
package poly.DAO.Impl;

import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;
import poly.DAO.ShareDAO;
import poly.entity.Share;
import poly.model.ShareReport;

import java.util.List;

public class ShareDAOImpl extends GenericDAOImpl<Share, Long> implements ShareDAO {

    public ShareDAOImpl(EntityManager em) {
        super(em, Share.class);
    }

    @Override
    public List<ShareReport> getShareReports() {
        String jpql =
                "SELECT new poly.model.ShareReport(" +
                        "   s.video.id, s.video.title, " +
                        "   COUNT(s), MIN(s.shareDate), MAX(s.shareDate)) " +
                        "FROM Share s " +
                        "GROUP BY s.video.id, s.video.title " +
                        "ORDER BY COUNT(s) DESC";

        TypedQuery<ShareReport> query =
                em.createQuery(jpql, ShareReport.class);
        return query.getResultList();
    }
}
