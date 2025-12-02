package poly.DAO.Impl;

import poly.DAO.FavouriteDAO;
import poly.entity.Favourite;
import jakarta.persistence.EntityManager;

public class FavouriteDAOImpl extends GenericDAOImpl<Favourite, Long> implements FavouriteDAO {
    public FavouriteDAOImpl(EntityManager em) {
        super(em, Favourite.class);
    }
}