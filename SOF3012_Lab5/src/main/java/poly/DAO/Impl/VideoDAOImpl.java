// src/main/java/poly/DAO/Impl/VideoDAOImpl.java
package poly.DAO.Impl;

import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;
import poly.DAO.VideoDAO;
import poly.entity.Video;

import java.util.List;

public class VideoDAOImpl extends GenericDAOImpl<Video, String> implements VideoDAO {

    public VideoDAOImpl(EntityManager em) {
        super(em, Video.class);
    }

    @Override
    public List<Video> findByKeyword(String keyword) {
        String jpql = "SELECT v FROM Video v WHERE v.title LIKE :kw";
        TypedQuery<Video> query = em.createQuery(jpql, Video.class);
        query.setParameter("kw", "%" + keyword + "%");
        return query.getResultList();
    }
}
