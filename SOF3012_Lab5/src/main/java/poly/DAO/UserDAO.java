package poly.DAO;

import poly.entity.User;

public interface UserDAO extends GenericDAO<User, String> {


    User findByIdOrEmail(String idOrEmail);


    User login(String idOrEmail, String password);

}
