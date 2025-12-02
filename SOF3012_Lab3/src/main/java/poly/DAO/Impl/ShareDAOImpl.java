package poly.DAO.Impl;

import poly.DAO.ShareDAO;
import poly.entity.Share;
import jakarta.persistence.EntityManager;

public class ShareDAOImpl extends GenericDAOImpl<Share, Long> implements ShareDAO {
    public ShareDAOImpl(EntityManager em) {
        super(em, Share.class);
    }
}
