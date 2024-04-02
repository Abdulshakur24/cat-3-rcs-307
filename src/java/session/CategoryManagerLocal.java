
package session;

import entity.Category;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author tomsol28
 */
@Local
public interface CategoryManagerLocal {

    void addCategory(Category category);

    void editCategory(Category category);

    void deleteCategory(Integer id);

    Category getCategory(Integer id);

    List<Category> getAllCategory();
    
}
