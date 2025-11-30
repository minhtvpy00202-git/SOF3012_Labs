package poly.utils;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public class JpaUtils {


    private static final EntityManagerFactory emf;

    static {
        try {
            emf = Persistence.createEntityManagerFactory("PolyOE");
        } catch (Exception e) {

            throw new ExceptionInInitializerError(e);
        }
    }

    public static EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public static void close() {
        if (emf != null && emf.isOpen()) {
            emf.close();
        }
    }
}
