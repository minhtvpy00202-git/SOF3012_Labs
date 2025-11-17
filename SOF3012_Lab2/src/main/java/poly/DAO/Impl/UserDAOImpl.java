package poly.DAO.Impl;

import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;
import poly.DAO.UserDAO;
import poly.entity.User;
import poly.util.XJPA;

import java.util.List;

public class UserDAOImpl implements UserDAO {

    // 1. XÓA BỎ: Biến EntityManager ở cấp class
    // EntityManager em = XJPA.getEntityManager();

    // 2. XÓA BỎ: Phương thức finalize()
    // @Override
    // protected void finalize() throws Throwable { ... }


    @Override
    public List<User> findAll() {
        // Mỗi phương thức phải tự lấy và đóng EntityManager
        EntityManager em = XJPA.getEntityManager();
        try {
            String jpql = "SELECT o FROM User o";
            TypedQuery<User> query = em.createQuery(jpql, User.class);
            return query.getResultList();
        } finally {
            // Luôn luôn đóng 'em' sau khi dùng xong
            em.close();
        }
    }

    @Override
    public User findById(String id) {
        EntityManager em = XJPA.getEntityManager();
        try {
            return em.find(User.class, id);
        } finally {
            em.close();
        }
    }

    @Override
    public void create(User entity) {
        EntityManager em = XJPA.getEntityManager();
        try {
            // Bắt đầu giao dịch
            em.getTransaction().begin();

            em.persist(entity);

            // Chấp nhận giao dịch
            em.getTransaction().commit();
        } catch (Exception e) {
            // Rollback (hoàn tác) nếu có lỗi
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            e.printStackTrace(); // In lỗi ra console
            throw new RuntimeException("Error creating user", e); // Ném lỗi để tầng trên xử lý
        } finally {
            em.close();
        }
    }

    @Override
    public void update(User entity) {
        EntityManager em = XJPA.getEntityManager();
        try {
            em.getTransaction().begin();

            em.merge(entity); // Dùng merge cho update

            em.getTransaction().commit();
        } catch (Exception e) {
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            e.printStackTrace();
            throw new RuntimeException("Error updating user", e);
        } finally {
            em.close();
        }
    }

    @Override
    public void deleteById(String id) {
        EntityManager em = XJPA.getEntityManager();
        try {
            em.getTransaction().begin();

            // Bạn phải tìm đối tượng trước khi xóa
            User entity = em.find(User.class, id);
            if (entity != null) {
                em.remove(entity);
            }

            em.getTransaction().commit();
        } catch (Exception e) {
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            e.printStackTrace();
            throw new RuntimeException("Error deleting user", e);
        } finally {
            em.close();
        }
    }
}