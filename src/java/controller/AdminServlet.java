
package controller;

import entity.Category;
import entity.Customer;
import entity.CustomerOrder;
import entity.Product;
import entity.Subcategory;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.HttpConstraint;
import javax.servlet.annotation.ServletSecurity;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import session.CategoryFacade;
import session.CategoryManagerLocal;
import session.CustomerFacade;
import session.CustomerOrderFacade;
import session.OrderManager;
import session.ProductFacade;
import session.ProductManagerLocal;
import session.SubcategoryFacade;
import session.SubcategoryManagerLocal;
import session.UserFacade;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import validate.ValidatorCategory;
import validate.ValidatorProduct;


@WebServlet(name = "AdminServlet",
            urlPatterns = {"/admin/",
                           "/admin/product",
                           "/admin/viewOrders",
                           "/admin/viewCustomers",
                           "/admin/EDCategories",
                           "/admin/EDSubcategories",
                           "/admin/EDproducts",
                           "/admin/AddSubcategory",
                           "/admin/AddCategory",
                           "/admin/categoryRecDelete",
                           "/admin/CateConfirmation",
                           "/admin/deCategoryConfirmation",
                           "/admin/categoryRecord",
                           "/admin/customerRecord",
                           "/admin/subcategoryRecord",
                           "/admin/subcategoryRecDelete",
                           "/admin/edSubConfirmation",
                           "/admin/deSubConfirmation",
                           "/admin/orderRecord",
                           "/admin/viewUsers",
                           "/admin/ImageUpload",
                           "/admin/productRecord",
                           "/admin/edproductRecord",
                           "/admin/deproductRecord",
                           "/admin/viewProducts",
                           "/admin/viewSubcategories",
                           "/admin/viewCategories",
                           "/admin/addProduct",
                           "/admin/addProConfirmation",
                           "/admin/EdProConfirmation",
                           "/admin/deProConfirmation",
                           "/admin/ProductList",
                           "/admin/confirmation",
                           "/admin/category",
                           "/admin/logout"})

@ServletSecurity( @HttpConstraint(rolesAllowed = {"eshopperAdmin"}) )

public class AdminServlet extends HttpServlet {
    private final String UPLOAD_DIRECTORY = "/Users/tomsol28/NetBeansProjects/e-commerce_Site/web/img/products";
    
    @EJB
    private OrderManager orderManager;
    
    @EJB
    private CustomerFacade customerFacade;
    @EJB
    private CustomerOrderFacade customerOrderFacade;
    @EJB
    private ProductFacade productFacade;
    @EJB
    private UserFacade userFacade;
    @EJB
    
    private CategoryFacade categoryFacade;
    
    @EJB
    private SubcategoryFacade subcategoryFacade;
    
    @EJB
    private SubcategoryManagerLocal subcategoryManager;

    @EJB
    private CategoryManagerLocal categoryManager;

    @EJB
    private ProductManagerLocal productManager;
    
        
    private String userPath;
    private Customer customer;
    private Product product;
    private Category category;
    private Subcategory subcategory;
    private CustomerOrder order;
    private List orderList = new ArrayList();
    private List customerList = new ArrayList();
    private List productList = new ArrayList();
    private List userList = new ArrayList();
    private List categoryList = new ArrayList();
    private List subcategoryList = new ArrayList();
    private List edproductList = new ArrayList();
    private List edcategoryList = new ArrayList();
    private List edsubcategoryList = new ArrayList();
    
    
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(true);
        userPath = request.getServletPath();

        // if viewCustomers is requested
        if (userPath.equals("/admin/viewCustomers")) {
            
            customerList = customerFacade.findAll();
            request.setAttribute("customerList", customerList);
            
        }
        // if viewUsers is requested
        if (userPath.equals("/admin/viewUsers")) {
            userList = userFacade.findAll();
            request.setAttribute("userList", userList);
            
        }
        
        // if viewCustomers is requested
        if (userPath.equals("/admin/viewProducts")) {
            
            productList = productFacade.findAll();
            request.setAttribute("productList", productList);
            
        }
        // if customerRecord is requested
        if (userPath.equals("/admin/productRecord")) {

            // get product ID from request
            String productId = request.getQueryString();
            
            // get product details
            product = productFacade.find(Integer.parseInt(productId));
            request.setAttribute("productRecord", product);
           
        }
        // if editProductRecord is requested
        if (userPath.equals("/admin/edproductRecord")) {
            
            // get product ID from request
            String productId = request.getQueryString();
            
            // get product details
            product = productFacade.find(Integer.parseInt(productId));
            request.setAttribute("edproductRecord", product);
            
        }
         // if editProductRecord is requested
        if (userPath.equals("/admin/deproductRecord")) {
           // get product ID from request
            String productId = request.getQueryString();
            
            // get product details
            product = productFacade.find(Integer.parseInt(productId));
            request.setAttribute("deproductRecord", product);
            
        }
        // if categoryRecord is requested
        if (userPath.equals("/admin/categoryRecord")) {
            
            // get product ID from request
            String categoryId = request.getQueryString();
            
            // get product details
            category = categoryFacade.find(Integer.parseInt(categoryId));
            request.setAttribute("categoryRecord", category);
            
        }
        // if categoryRecord is requested
        if (userPath.equals("/admin/categoryRecDelete")) {
            
          // get product ID from request
            String categoryId = request.getQueryString();
            
            // get product details
            category = categoryFacade.find(Integer.parseInt(categoryId));
            request.setAttribute("categoryRecDelete", category);
            
            
        }
        // if viewCategories is requested
        if (userPath.equals("/admin/viewCategories")) {
            
            categoryList = categoryFacade.findAll();
            request.setAttribute("categoryList", categoryList);
           
        }
        // if edit/DeleteCategories is requested
        if (userPath.equals("/admin/EDCategories")) {
            
             edcategoryList = categoryFacade.findAll();
            request.setAttribute("edcategoryList", edcategoryList);
        }
       
        // if viewSubcategories is requested
        if (userPath.equals("/admin/viewSubcategories")) {
            
            subcategoryList = subcategoryFacade.findAll();
            request.setAttribute("subcategoryList", subcategoryList);
           
        }
        // if subcategoryRecord is requested
        if (userPath.equals("/admin/subcategoryRecord")) {
            // get product ID from request
            String subcategoryId = request.getQueryString();
            
            // get product details
            subcategory = subcategoryFacade.find(Integer.parseInt(subcategoryId));
            request.setAttribute("subcategoryRecord", subcategory);
            
            
        }
         // if categoryRecord is requested
        if (userPath.equals("/admin/subcategoryRecDelete")) {
            
             // get product ID from request
            String subcategoryId = request.getQueryString();
            
            // get product details
            subcategory = subcategoryFacade.find(Integer.parseInt(subcategoryId));
            request.setAttribute("subcategoryRecDelete", subcategory);
            
            
        }
        // if edit/DeleteSubcategories is requested
        if (userPath.equals("/admin/EDSubcategories")) {
            
            edsubcategoryList = subcategoryFacade.findAll();
            request.setAttribute("edsubcategoryList", edsubcategoryList);
            
        }
         // if edit/DeleteSubcategories is requested
        if (userPath.equals("/admin/EDproducts")) {
           
            edproductList = productFacade.findAll();
            request.setAttribute("edproductList", edproductList);
            
        }
        
        // if viewOrders is requested
        if (userPath.equals("/admin/viewOrders")) {
            
            orderList = customerOrderFacade.findAll();
            request.setAttribute("orderList", orderList);
        }

         // if customerRecord is requested
        if (userPath.equals("/admin/customerRecord")) {

            // get customer ID from request
            String customerId = request.getQueryString();

            // get customer details
            customer = customerFacade.find(Integer.parseInt(customerId));
            request.setAttribute("customerRecord", customer);

            // get customer order details
            order = customerOrderFacade.findByCustomer(customer);
            request.setAttribute("order", order);
            
        }

        // if orderRecord is requested
        if (userPath.equals("/admin/orderRecord")) {

            // get customer ID from request
            String orderId = request.getQueryString();

            // get order details
            Map orderMap = orderManager.getOrderDetails(Integer.parseInt(orderId));

            // place order details in request scope
            request.setAttribute("customer", orderMap.get("customer"));
            request.setAttribute("products", orderMap.get("products"));
            request.setAttribute("orderRecord", orderMap.get("orderRecord"));
            request.setAttribute("orderedProducts", orderMap.get("orderedProducts"));
            
        }
        
        // if logout is requested
        if (userPath.equals("/admin/logout")) {
            session = request.getSession();
            session.invalidate();   // terminate session
            response.sendRedirect("/E-Shopper/admin/logout.jsp");
            return;
             
        }
        
        // use RequestDispatcher to forward request internally
        userPath = "/admin/dashboard.jsp";
        
       
        try {
            request.getRequestDispatcher(userPath).forward(request, response);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String userPath = request.getServletPath();
        
        
        ValidatorProduct validatorProduct = new ValidatorProduct();
        ValidatorCategory validatorCategory = new ValidatorCategory();
        // if addProduct action is called
        if (userPath.equals("/admin/addProduct")) {
            
        // extract user data from request
       String action = request.getParameter("action");
       String productId = request.getParameter("id");
      
       Integer id=0;
        
        if(productId!=null && !productId.equals("")){
            id=Integer.parseInt(productId);    
        }
        
        String name = request.getParameter("name");
        String priceBg = request.getParameter("price");
        BigDecimal price= BigDecimal.ZERO;
        
        if(priceBg!=null && !priceBg.equals("")){
           price=new BigDecimal(priceBg);    
        }
        
        String description = request.getParameter("description");
        String brand = request.getParameter("brand");
        
        String categoryId = request.getParameter("categoryId");
        String subcategoryId = request.getParameter("subcategoryId");
 
        Category cat = new Category(Integer.parseInt(categoryId));
        Subcategory subcat = new Subcategory(Integer.parseInt(subcategoryId));
        
                // validate user data
                boolean validationProErrorFlag = false;
                validationProErrorFlag = validatorProduct.validateForm(name, price, description, brand, categoryId, subcategoryId, request);

                // if validation error found, return user to checkout
                if (validationProErrorFlag == true) {
                    request.setAttribute("validationProErrorFlag", validationProErrorFlag);
                    userPath = "/admin/AddProduct.jsp";
                    
                    // otherwise, save user account to database
                } else {
        
        Product product = new Product (id, name, price, description, brand, cat, subcat);
        

        if("Add".equalsIgnoreCase(action)){
            productManager.addProduct(product);
            
        }
        
         // use RequestDispatcher to forward request internally
         request.setAttribute("product", product);
         request.setAttribute("products", productManager.getAllProduct());
         request.getRequestDispatcher("addProConfirmation.jsp").forward(request, response);
       
        
        } 
        }
        // if addProduct action is called
        else if (userPath.equals("/admin/EdProConfirmation")) {
            
            // extract user data from request
            String action = request.getParameter("action");
            String productId = request.getParameter("id");
      
             Integer id=0;
        
        if(productId!=null && !productId.equals("")){
            id=Integer.parseInt(productId);    
        }
        
        String name = request.getParameter("name");
        String priceBg = request.getParameter("price");
        BigDecimal price= BigDecimal.ZERO;
        
        if(priceBg!=null && !priceBg.equals("")){
           price=new BigDecimal(priceBg);    
        }
        
        String description = request.getParameter("description");
        String brand = request.getParameter("brand");
        
        String categoryId = request.getParameter("categoryId");
        String subcategoryId = request.getParameter("subcategoryId");
 
        Category cat = new Category(Integer.parseInt(categoryId));
        Subcategory subcat = new Subcategory(Integer.parseInt(subcategoryId));
       
        
        Product product = new Product (id, name, price, description, brand, cat, subcat);
        

        if("Add".equalsIgnoreCase(action)){
            productManager.addProduct(product);
            
        }else if ("Edit".equalsIgnoreCase(action)){
            productManager.editProduct(product);
        
        }

        
         // use RequestDispatcher to forward request internally
         request.setAttribute("product", product);
         request.setAttribute("products", productManager.getAllProduct());
         request.getRequestDispatcher("EdProConfirmation.jsp").forward(request, response);
            
         // if deleteProduct action is called
        }else if (userPath.equals("/admin/deProConfirmation")) {
            
            // extract user data from request
       String action = request.getParameter("action");
       String productId = request.getParameter("id");
      
       Integer id=0;
        
        if(productId!=null && !productId.equals("")){
            id=Integer.parseInt(productId);    
        }
               
        Product product = new Product (id);
        
      if ("Delete".equalsIgnoreCase(action)){
          productManager.deleteProduct(id); 
          
        }
    
         // use RequestDispatcher to forward request internally
         request.setAttribute("product", product);
         request.setAttribute("products", productManager.getAllProduct());
         request.getRequestDispatcher("deProConfirmation.jsp").forward(request, response);
       
        }
         // if Category confirmation is requested
        else if (userPath.equals("/admin/CateConfirmation")) {
          
        String action = request.getParameter("action");
        String categoryId = request.getParameter("id");
        
        Integer id=0;
        
        if(categoryId!=null && !categoryId.equals("")){
            id=Integer.parseInt(categoryId);    
        }
        String name = request.getParameter("name");
        
        
        Category category = new Category(id, name);
        
         if("Add".equalsIgnoreCase(action)){
            categoryManager.addCategory(category);
        }else if("Edit".equalsIgnoreCase(action)){
            categoryManager.editCategory(category);
        }else if("Delete".equalsIgnoreCase(action)){
            categoryManager.deleteCategory(id);
        }else if("Search".equalsIgnoreCase(action)){
            category = categoryManager.getCategory(id);
        }  
        
        request.setAttribute("category", category);
        request.setAttribute("categories", categoryManager.getAllCategory());
        request.getRequestDispatcher("CateConfirmation.jsp").forward(request, response);
        
        }
         // if deleteConfiCategory is requested
        else if (userPath.equals("/admin/deCategoryConfirmation")) {
            
        String action = request.getParameter("action");
        String categoryId = request.getParameter("id");
        
        Integer id=0;
        
        if(categoryId!=null && !categoryId.equals("")){
            id=Integer.parseInt(categoryId);    
        }
        String name = request.getParameter("name");
        
        
        Category category = new Category(id, name);
        
 
            if("Delete".equalsIgnoreCase(action)){
            categoryManager.deleteCategory(id);
        }
 
         
        
        request.setAttribute("category", category);
        request.setAttribute("categories", categoryManager.getAllCategory());
        request.getRequestDispatcher("deCategoryConfirmation.jsp").forward(request, response);
          
        }
         // if deleteConfiCategory is requested
        else if (userPath.equals("/admin/deProConfirmation")) {
            
            // extract user data from request
       String action = request.getParameter("action");
       String productId = request.getParameter("id");
       
       Integer id=0;
        if(productId!=null && !productId.equals("")){
            id=Integer.parseInt(productId);    
        }
               
        Product product = new Product (id);
        
        
        if ("Delete".equalsIgnoreCase(action)){
          productManager.deleteProduct(id); 
          
        }

        
         request.setAttribute("product", product);
         request.setAttribute("product", productManager.getAllProduct());
     
       // use RequestDispatcher to forward request internally   
        request.getRequestDispatcher("deProductConfirmation.jsp").forward(request, response);
           
        }
        
        
        // if Subcategory confirmation is requested
        else if (userPath.equals("/admin/edSubConfirmation")) {
            
        String action = request.getParameter("action");
        String subcategoryId = request.getParameter("id");
        Integer id=0;
        if(subcategoryId!=null && !subcategoryId.equals("")){
            id=Integer.parseInt(subcategoryId);    
        }
        String name = request.getParameter("name");
        
        
        Subcategory subcategory = new Subcategory(id, name);
        
          if("Delete".equalsIgnoreCase(action)){
            subcategoryManager.deleteSubcategory(id);
            }
         
         
        request.setAttribute("subcategory", subcategory);
        request.setAttribute("subcategories", subcategoryManager.getAllSubcatagory());
        request.getRequestDispatcher("editSubConfirmation.jsp").forward(request, response);
        
        }
        
          // if deleteConfirmation Subcategory is requested
        else if (userPath.equals("/admin/deSubConfirmation")) {
            
        String action = request.getParameter("action");
        String subcategoryId = request.getParameter("id");
        Integer id=0;
        if(subcategoryId!=null && !subcategoryId.equals("")){
            id=Integer.parseInt(subcategoryId);    
        }
        String name = request.getParameter("name");
        
        
        Subcategory subcategory = new Subcategory(id, name);
        
        if("Add".equalsIgnoreCase(action)){
            subcategoryManager.addSubcategory(subcategory);
        }else if("Edit".equalsIgnoreCase(action)){
            subcategoryManager.editSubcategory(subcategory);
        }else if("Delete".equalsIgnoreCase(action)){
            subcategoryManager.deleteSubcategory(id);
        }else if("Search".equalsIgnoreCase(action)){
            subcategory = subcategoryManager.getSubcategory(id);
        }
         
        request.setAttribute("subcategory", subcategory);
        request.setAttribute("subcategories", subcategoryManager.getAllSubcatagory());
        request.getRequestDispatcher("deleteSubConfirmation.jsp").forward(request, response);
        
        }
        
        // if addCategory is requested
        else if (userPath.equals("/admin/AddCategory")) {

        String action = request.getParameter("action");
        String categoryId = request.getParameter("id");
        
        Integer id=0;
        
        if(categoryId!=null && !categoryId.equals("")){
            id=Integer.parseInt(categoryId);    
        }
        String name = request.getParameter("name");
        
        // validate user data
        boolean validationCateErrorFlag = false;
        validationCateErrorFlag = validatorCategory.validateForm(name, request);

        // if validation error found, return user to checkout
        if (validationCateErrorFlag == true) {
        request.setAttribute("validationCateErrorFlag", validationCateErrorFlag);
         userPath = "/admin/AddCategory.jsp";
        
                    // otherwise, save user account to database
                } else {
        
        Category category = new Category(id, name);
       
        
        if("Add".equalsIgnoreCase(action)){
            categoryManager.addCategory(category);
        }

         
        request.setAttribute("category", category);
        request.setAttribute("categories", categoryManager.getAllCategory());
        request.getRequestDispatcher("adCateConfirmation.jsp").forward(request, response);
               
           }
        
        }
        
        // if addSubcategory is requested
        else if (userPath.equals("/admin/AddSubcategory")) {

        String action = request.getParameter("action");
        String subcategoryId = request.getParameter("id");
        Integer id=0;
        if(subcategoryId!=null && !subcategoryId.equals("")){
            id=Integer.parseInt(subcategoryId);    
        }
        String name = request.getParameter("name");
        
        // validate user data
        boolean validationCateErrorFlag = false;
        validationCateErrorFlag = validatorCategory.validateForm(name, request);

        // if validation error found, return user to checkout
        if (validationCateErrorFlag == true) {
        request.setAttribute("validationCateErrorFlag", validationCateErrorFlag);
         userPath = "/admin/AddSubcategory.jsp";
        
         // otherwise, save user account to database
         } else {
        
        Subcategory subcategory = new Subcategory(id, name);
        
        if("Add".equalsIgnoreCase(action)){
            subcategoryManager.addSubcategory(subcategory);
        }

        
         
        request.setAttribute("subcategory", subcategory);
        request.setAttribute("subcategories", subcategoryManager.getAllSubcatagory());
        request.getRequestDispatcher("adSubcateConfirmation.jsp").forward(request, response);
         
         }
        
        } 
        if (userPath.equals("/admin/ImageUpload")) {
               
            //process only if its multipart content
           if(ServletFileUpload.isMultipartContent(request)){
        
            try {

                List<FileItem> multiparts = new ServletFileUpload(

                   new DiskFileItemFactory()).parseRequest(request);

                for(FileItem item : multiparts){

                    if(!item.isFormField()){

                        String name = new File(item.getName()).getName();

                        item.write( new File(UPLOAD_DIRECTORY + File.separator + name));

                    }

                }
                
                //File uploaded successfully
               request.setAttribute("message", "Image Uploaded Successfully");

            } catch (Exception ex) {
                // checks if the request actually contains upload file
               request.setAttribute("message", "Request does not contain upload image. Please try again.");
              

            }         

        }else{

            request.setAttribute("message", "Sorry this Servlet only handles file upload request");

        }

        request.getRequestDispatcher("successUploadImage.jsp").forward(request, response);

            
        }
        
        try {
            request.getRequestDispatcher(userPath).forward(request, response);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    

}
}
