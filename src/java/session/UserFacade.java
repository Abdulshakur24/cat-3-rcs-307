
package session;

import entity.User;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;


@Stateless
public class UserFacade extends AbstractFacade<User> {

    @PersistenceContext(unitName = "e-commerce_SitePU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public UserFacade() {
        super(User.class);
    }
  public boolean checklogin(String username, String password) {  

        try{
           TypedQuery <User> query = em.createQuery("SELECT u FROM User u WHERE u.username = :username AND u.password = :password", User.class);
           query.setParameter("username", username);
           query.setParameter("password", password); 
          try{ 
           User u = (User) query.getSingleResult();
          return true;
          }catch(javax.persistence.NoResultException e)
        {
            return false;
        }
        }
        finally{
        
        }
    }  
    
public String addUser(String username, String password)
{
  
    try{
        User user = new User();
        user.setUsername(username);
        user.setPassword(password);
        em.persist(user);
       return "Success"; 
       
    }catch(Exception e){
       e.printStackTrace();
       return "Failure";
    }
    
    }

}

