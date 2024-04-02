
package session;

import entity.Product;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author tomsol28
 */
@Local
public interface ProductManagerLocal {

    void addProduct(Product product);

    void editProduct(Product product);

    void deleteProduct(Integer id);

    Product getProduct(Integer id);

    List<Product> getAllProduct();
    
}
