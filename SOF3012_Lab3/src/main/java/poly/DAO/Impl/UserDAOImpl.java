package poly.DAO.Impl;

import poly.DAO.UserDAO;
import poly.entity.User;
import jakarta.persistence.EntityManager;

public class UserDAOImpl extends GenericDAOImpl<User, String> implements UserDAO {

    public UserDAOImpl(EntityManager em) {
        super(em, User.class);
    }


}
