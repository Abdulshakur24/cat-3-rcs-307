
package session;

import entity.Subcategory;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author tomsol28
 */
@Local
public interface SubcategoryManagerLocal {

    boolean addSubcategory(Subcategory subcategory);

    void editSubcategory(Subcategory subcategory);

    void deleteSubcategory(Integer id);

    Subcategory getSubcategory(Integer id);

    List<Subcategory> getAllSubcatagory();

    Subcategory findByName(String name);
    
}
