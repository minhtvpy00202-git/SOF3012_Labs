package poly.DAO.Impl;

import poly.DAO.VideoDAO;
import poly.entity.Video;
import jakarta.persistence.EntityManager;

public class VideoDAOImpl extends GenericDAOImpl<Video, String> implements VideoDAO {
    public VideoDAOImpl(EntityManager em) {
        super(em, Video.class);
    }
}
