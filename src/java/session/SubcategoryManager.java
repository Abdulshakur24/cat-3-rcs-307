
package session;

import entity.Subcategory;
import java.util.List;
import javax.ejb.EJB;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author tomsol28
 */


@Stateless
public class SubcategoryManager implements SubcategoryManagerLocal {

    @PersistenceContext(unitName = "e-commerce_SitePU")
    private EntityManager em;
    
//    @EJB
//    private SubcategoryFacade subcategoryFacade;

    
    @Override
    public boolean addSubcategory(Subcategory subcategory) {
    try{
        em.persist(subcategory);
        return true;
    }catch (Exception e){
        e.printStackTrace();
        return false;
        
         }
        
    }

    @Override
    public void editSubcategory(Subcategory subcategory) {
    
        em.merge(subcategory);
        em.flush();
    }

    @Override
    public void deleteSubcategory(Integer id) {
    
    em.remove(getSubcategory(id));
    em.flush();
    //System.out.println('Deleted');
    }

    @Override
    public Subcategory getSubcategory(Integer id) {
        return em.find(Subcategory.class, id);
    }
//    @Override
//    public Subcategory findByName(String name) {
//        return em.find(Subcategory.class, name);
//    }
    

    @Override
    public List<Subcategory> getAllSubcatagory() {
        return em.createNamedQuery("Subcategory.findAll").getResultList();
    }

    @Override
    public Subcategory findByName(String name) {
        return em.find(Subcategory.class, name);
    }

  
//    public void save(Category entity) {
//
//    Category existingEntity = this.find(entity.getName());
//    if (existingEntity == null) {
//       em.persist(entity);
//       //code to commit ...
//    } else {
//        entity.setId(existingEntity.getId());
//        em.merge(entity);
//        //code to commit ...
//    }
//}
//
//public Category find(String categoryName) {
//    try {
//        return (Category) getEm().createNamedQuery("Category.findByName").
//                setParameter("name", categoryName).getSingleResult();
//    } catch (NoResultException e) {
//        return null;
//
//    }
//}

}
