package Entity;

import jakarta.persistence.*;
import java.util.List;

public class UserManager {
    private final EntityManagerFactory factory = Persistence.createEntityManagerFactory("PolyOE");
    private final EntityManager em = factory.createEntityManager();

    //Bài 2:
    public void findAll() {
        String jpql = "SELECT o FROM User o";
        TypedQuery<User> query = em.createQuery(jpql, User.class);
        List<User> list = query.getResultList();
        list.forEach(u -> System.out.println(u.getFullname() + ": " + u.isAdmin()));
    }

    public void findById(String id) {
        User user = em.find(User.class, id);
        if (user == null) {
            System.out.println("Không tìm thấy user id=" + id);
            return;
        }
        System.out.println(user.getFullname() + ": " + user.isAdmin());
    }

    public void create() {
        User user = new User("U01", "123", "Trần Minh", "minhtvnh@gmail.com", false);
        try {
            em.getTransaction().begin();
            em.persist(user);
            em.getTransaction().commit();
        } catch (Exception e) {
            if (em.getTransaction().isActive()) em.getTransaction().rollback();
            throw e;
        }
    }

    public void update() {
        try {
            em.getTransaction().begin();
            User user = em.find(User.class, "U01");
            if (user == null) {
                System.out.println("Không có U01 để cập nhật");
            } else {
                user.setFullname("Nguyễn Văn Tèo");
                user.setEmail("teonv@gmail.com");
                // Không cần persist() vì user đang managed
            }
            em.getTransaction().commit();
        } catch (Exception e) {
            if (em.getTransaction().isActive()) em.getTransaction().rollback();
            throw e;
        }
    }

    public void deleteById() {
        try {
            em.getTransaction().begin();
            User user = em.find(User.class, "U01");
            if (user == null) {
                System.out.println("Không có U01 để xoá");
            } else {
                em.remove(user);
            }
            em.getTransaction().commit();
        } catch (Exception e) {
            if (em.getTransaction().isActive()) em.getTransaction().rollback();
            throw e;
        }
    }

    //Bài 3: Tìm user có email fpt và không phải quản lý
    public void findFptUser() {
        String jpql = "SELECT o FROM User o WHERE o.email LIKE :search AND o.admin = :role";
        TypedQuery<User> query = em.createQuery(jpql, User.class);

        query.setParameter("search","%@fpt.edu.vn");
        query.setParameter("role", false);

        List<User> list = query.getResultList();
        list.forEach(u -> System.out.println(u.getFullname() + "- " + u.getEmail()));
    }

    //Bài 4: Tìm theo phân trang
    public void listPage(int pageNumber, int pageSize) {
        String jpql = "SELECT o FROM User o ORDER BY o.id";
        TypedQuery<User> q = em.createQuery(jpql, User.class);

        // pageNumber tính từ 0 → trang 3 tức pageNumber = 2
        q.setFirstResult(pageNumber * pageSize);
        q.setMaxResults(pageSize);

        List<User> list = q.getResultList();
        if (list.isEmpty()) {
            System.out.println("Trang " + (pageNumber + 1) + " trống.");
            return;
        }
        list.forEach(u ->
                System.out.println(u.getId() + " | " + u.getFullname() + " | " + u.getEmail() + " | admin=" + u.isAdmin())
        );
    }


    public void close() {
        if (em.isOpen()) em.close();
        if (factory.isOpen()) factory.close();
    }
}
