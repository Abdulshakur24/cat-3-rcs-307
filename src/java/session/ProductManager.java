
package session;

import entity.Product;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author tomsol28
 */
@Stateless
public class ProductManager implements ProductManagerLocal {

    @PersistenceContext(unitName = "e-commerce_SitePU")
    private EntityManager em;
      
    @Override
    public void addProduct(Product product) {
        
        em.persist(product);
        
    }

    @Override
    public void editProduct(Product product) {
        
        em.merge(product);
        
    }

    @Override
    public void deleteProduct(Integer id) {
        
        em.remove(getProduct(id));
        
    }

    @Override
    public Product getProduct(Integer id) {
        
        return em.find(Product.class, id);
    }
    
   
    @Override
    public List<Product> getAllProduct() {
        return em.createNamedQuery("Product.findAll").getResultList();
    }
    
    
}
