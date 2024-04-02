
package session;

import entity.Category;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author tomsol28
 */
@Stateless
public class CategoryManager implements CategoryManagerLocal {

    @PersistenceContext(unitName = "e-commerce_SitePU")
    private EntityManager em;
    
    
    @Override
    public void addCategory(Category category) {
    
    em.persist(category);
    
    }
    

    @Override
    public void editCategory(Category category) {
        
        em.merge(category);
        
    }

    @Override
    public void deleteCategory(Integer id) {
        
        em.remove(getCategory(id));
        
    }

    @Override
    public Category getCategory(Integer id) {
        
       return em.find(Category.class,id);
        
    }

    @Override
    public List<Category> getAllCategory() {
        return em.createNamedQuery("Category.findAll").getResultList();
    }

}
