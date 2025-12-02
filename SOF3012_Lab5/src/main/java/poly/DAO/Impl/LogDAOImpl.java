package poly.DAO.Impl;

import jakarta.persistence.EntityManager;
import poly.DAO.LogDAO;
import poly.entity.Log;

public class LogDAOImpl extends GenericDAOImpl<Log, Long> implements LogDAO {
    public LogDAOImpl(EntityManager em) {
        super(em, Log.class);
    }
}
