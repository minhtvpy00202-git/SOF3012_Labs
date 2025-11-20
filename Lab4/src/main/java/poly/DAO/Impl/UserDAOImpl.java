package poly.DAO.Impl;

import jakarta.persistence.NoResultException;
import jakarta.persistence.TypedQuery;
import poly.DAO.UserDAO;
import poly.entity.User;
import jakarta.persistence.EntityManager;

public class UserDAOImpl extends GenericDAOImpl<User, String> implements UserDAO {

    public UserDAOImpl(EntityManager em) {
        super(em, User.class);
    }

    @Override
    public User findByIdOrEmail(String idOrEmail) {
        try {
            String jpql = "SELECT u FROM User u WHERE u.id = :idOrEmail OR u.email = :idOrEmail";
            TypedQuery<User> query = em.createQuery(jpql, User.class);
            query.setParameter("idOrEmail", idOrEmail);
            return query.getSingleResult();
        } catch (NoResultException e) {
            return null;
        }
    }

    @Override
    public User login(String idOrEmail, String password) {
        try {
            String jpql = "SELECT u FROM User u " +
                    "WHERE (u.id = :idOrEmail OR u.email = :idOrEmail) " +
                    "AND u.password = :password";
            TypedQuery<User> query = em.createQuery(jpql, User.class);
            query.setParameter("idOrEmail", idOrEmail);
            query.setParameter("password", password);
            return query.getSingleResult();
        } catch (NoResultException e) {
            return null;
        }
    }
}
