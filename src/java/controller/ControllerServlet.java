
package controller;

import cart.ShoppingCart;
import entity.Category;
import entity.Product;
import entity.Subcategory;
import entity.User;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;
import javax.ejb.EJB;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import session.CategoryFacade;
import session.OrderManager;
import session.ProductFacade;
import session.SubcategoryFacade;
import session.UserFacade;
import validate.Validator;
//import validate.ValidatorRegister;




@WebServlet(name = "Controller",
            loadOnStartup = 1,
            urlPatterns = {"/category", 
                            "/subcategory",
                            "/gridView",
                            "/subcategoryList",
                            "/itemView",
                            "/itemWithRelated",
                            "/itemSearch",
                            "/register",
                            "/addRegister",
                            "/success",
                            "/contact",
                            "/addToCart", 
                            "/viewCart",
                            "/userRecord",
                            "/viewUsers",
                            "/updateCart",
                            "/checkout",
                            "/purchase"})

public class ControllerServlet extends HttpServlet {
    
    private String userPath; 
    private String deliverycharge;
    private Product product;
    private User user;
    private List userList = new ArrayList();
    //private Product subcategory_id;
    
    @EJB
    private CategoryFacade categoryFacade;
    @EJB
    private SubcategoryFacade subcategoryFacade;
    @EJB
    private ProductFacade productFacade;
    @EJB
    private OrderManager orderManager;
    
    @EJB
    private UserFacade userFacade;
    
    @Override
    public void init(ServletConfig servletConfig) throws ServletException {
   
        super.init(servletConfig);

        // initialize servlet with configuration information
        deliverycharge = servletConfig.getServletContext().getInitParameter("deliveryCharge");


        // store category list in servlet context
        getServletContext().setAttribute("categories", categoryFacade.findAll());
       
        // store subcategory list in servlet context
        getServletContext().setAttribute("subcategories", subcategoryFacade.findAll());
        
         // store product list in servlet context
        getServletContext().setAttribute("products", productFacade.findAll());
        
    
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
        
        String userPath = request.getServletPath();
        HttpSession session = request.getSession();
        Category selectedCategory;
        Product selectedProduct;
        Subcategory selectedSubcategory;
        Collection <Product> categoryProducts;
        Collection <Product> subcategoryProducts;
        Collection <Product> searchProducts;
        
        // if category page is requested
        if (userPath.equals("/category")) {
            
            // get categoryId from request
          String categoryId = request.getQueryString();

             if (categoryId != null) {
           
                // get selected category
                selectedCategory = categoryFacade.find(Integer.parseInt(categoryId));
     
               // place selected category in request scope
                request.setAttribute("selectedCategory", selectedCategory);
                
               // get all products for selected category
               categoryProducts = selectedCategory.getProductCollection(); 
             
               // place category products in request scope
               request.setAttribute("categoryProducts", categoryProducts);
           }
           
            // if subcategory page is requested
        } else if (userPath.equals("/subcategory")) {
            
             // get subcategoryId from request
              String subcategoryId = request.getQueryString();

              if (subcategoryId != null) {
           
                // get selected subcategory
                selectedSubcategory = subcategoryFacade.find(Integer.parseInt(subcategoryId));
     
                // place selected subcategory in request scope
                request.setAttribute("selectedSubcategory", selectedSubcategory);
           
               // get all products for selected subcategory
               subcategoryProducts = selectedSubcategory.getProductCollection(); 
               
               // place subcategory products in request scope
               request.setAttribute("subcategoryProducts", subcategoryProducts);
           
         }
          
        // if ShowSubcategory page is requested
        } else if (userPath.equals("/subcategoryList")) {
            
             // get subcategoryId from request
              String subcategoryId = request.getQueryString();

              if (subcategoryId != null) {
           
                // get selected subcategory
                selectedSubcategory = subcategoryFacade.find(Integer.parseInt(subcategoryId));
     
                // place selected subcategory in request scope
                request.setAttribute("selectedSubcategory", selectedSubcategory);
           
               // get all products for selected subcategory
               subcategoryProducts = selectedSubcategory.getProductCollection(); 
               
               // place subcategory products in request scope
               request.setAttribute("subcategoryProducts", subcategoryProducts);
           
         }
          // if ItemSearch page is requested
        }else if(userPath.equals("/itemSearch")){
            

            // get product name from request
            String name = request.getQueryString();
            
            
            // get product details
//            product = productFacade.find(name);
//            request.setAttribute("itemSearch", product); 
//            

        

             
        // if ItemView page is requested
        }else if(userPath.equals("/itemView")){
            
            // get product ID from request
            String productId = request.getQueryString();
            
            // get product details
            product = productFacade.find(Integer.parseInt(productId));
            request.setAttribute("itemView", product); 
          
        // if ItemWithRelated is requested
        } else if (userPath.equals("/itemWithRelated")) {
            
                // get product ID from request
            String productId = request.getQueryString();
            
            // get product details
            product = productFacade.find(Integer.parseInt(productId));
            request.setAttribute("itemWithRelated", product); 
          
           
             // get subcategoryId from request
              String subcategoryId = request.getQueryString();

              if (subcategoryId != null) {
           
                // get selected subcategory
                selectedSubcategory = subcategoryFacade.find(Integer.parseInt(subcategoryId));
     
                // place selected subcategory in request scope
                request.setAttribute("selectedSubcategory", selectedSubcategory);
           
               // get all products for selected subcategory
               subcategoryProducts = selectedSubcategory.getProductCollection(); 
               
               // place subcategory products in request scope
               request.setAttribute("subcategoryProducts", subcategoryProducts);
               
              }
          
        // if cart page is requested
        } else if (userPath.equals("/viewCart")) {
            
            String clear = request.getParameter("clear");

             if ((clear != null) && clear.equals("true")) {

               ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
               cart.clear();
                  }

              userPath = "/cart";
            

        // if checkout page is requested
        } else if (userPath.equals("/checkout")) {
            
            ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
            
            // calculate total
            cart.calculateTotal(deliverycharge);
            
            // forward to checkout page and switch to a secure channel

        
        }else if (userPath.equals("/viewUsers")) {
            
            userList = userFacade.findAll();
            request.setAttribute("userList", userList);
            
            
        }
        else if (userPath.equals("/userRecord")) {
             // get product ID from request
//            String userId = request.getQueryString();
//            
//            // get user details
//            user = userFacade.find(Integer.parseInt(userId));
//            request.setAttribute("userRecord", user);
//            
        }

        // use RequestDispatcher to forward request internally
        String url = "/WEB-INF/view" + userPath + ".jsp";

        try {
            request.getRequestDispatcher(url).forward(request, response);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
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
        HttpSession session = request.getSession();
        ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
        Validator validator = new Validator();
//        ValidatorRegister validatorRegister = new ValidatorRegister();
//        
         // if addToCart action is called
        if (userPath.equals("/addToCart")) {

            // if user is adding item to cart for first time
            // create cart object and attach it to user session
            if (cart == null) {

                cart = new ShoppingCart();
                session.setAttribute("cart", cart);
            }

            // get user input from request
            String productId = request.getParameter("productId");

            if (!productId.isEmpty()) {

                Product product = productFacade.find(Integer.parseInt(productId));
                cart.addItem(product);
            }

            userPath = "/cart";

        
       // if ItemSearch page is requested
        }else if(userPath.equals("/itemSearch")){
            

            // get product name from request
            String name = request.getParameter("name");
            
            
            // get product details
            product = productFacade.find(name);
            request.setAttribute("itemSearch", product);
            

             //String result = productFacade.checkProduct(name);
//                  if (productFacade.checkProduct(name)) {
//                    //HttpSession session = request.getSession();
//                    session.setAttribute("name", name);
//                    response.sendRedirect("welcome.jsp"); 
//                    }else {
//                       response.sendRedirect("error.jsp"); 
//                    }
            
        // if register action is called
        } else if (userPath.equals("/addRegister")) {
         
                // extract user data from request
//                String username = request.getParameter("username");
//                String password = request.getParameter("password");
//               
////                PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
////                String hashedPassword = passwordEncoder.encode(password);
//                 
//              
//                // validate user data
//                boolean validationReErrorFlag = false;
//                validationReErrorFlag = validatorRegister.validateForm(username, password, request);
//
//                // if validation error found, return user to checkout
//                if (validationReErrorFlag == true) {
//                    request.setAttribute("validationReErrorFlag", validationReErrorFlag);
//                    userPath = "/register";
//
//                    // otherwise, save user account to database
//                } else {
//                    
//                    String result = userFacade.addUser(username, password);
//                    if (result.equals("Success")) {
//                       
//                       // end session
//                       session.invalidate();
//			
//                        //send forward to success page and display error
//                        userPath = "/success";
//                       // request.setAttribute("registerSuccessFlag", true);
//                        User user = new User(username, password);
//			request.setAttribute("user", user);
//                      
//                        
//                         
//		} else {
//                        // otherwise, send back to register page and display error
//                        userPath = "/register";
//                        request.setAttribute("registerFailureFlag", true);
//		}
//	
//               }
//           
           
        // if updateCart action is called
        }else if (userPath.equals("/updateCart")) {

            // get input from request
            String productId = request.getParameter("productId");
            String quantity = request.getParameter("quantity");

            boolean invalidEntry = validator.validateQuantity(productId, quantity);

                if (!invalidEntry) {

                Product product = productFacade.find(Integer.parseInt(productId));
                cart.update(product, quantity);
            }

            userPath = "/cart";


         // if purchase action is called
         } else if (userPath.equals("/purchase")) {

            if (cart != null) {

                // extract user data from request
                String firstName = request.getParameter("firstName");
                String lastName = request.getParameter("lastName");
                String email = request.getParameter("email");
                String phone = request.getParameter("phone");
                String address = request.getParameter("address");
                String city = request.getParameter("city");
                String postCode = request.getParameter("postCode");
                String county = request.getParameter("county");
                
                // validate user data
                boolean validationErrorFlag = false;
                validationErrorFlag = validator.validateForm(firstName, lastName, email, phone, address, city, postCode, county, request);

                // if validation error found, return user to checkout
                if (validationErrorFlag == true) {
                    request.setAttribute("validationErrorFlag", validationErrorFlag);
                    userPath = "/checkout";

                    // otherwise, save order to database
                } else {

                    int orderId = orderManager.placeOrder(firstName, lastName, email, phone, address, city, postCode, county, cart);

                    // if order processed successfully send user to confirmation page
                    if (orderId != 0) {

                        // dissociate shopping cart from session
                        cart = null;

                        // end session
                        session.invalidate();

                        // get order details
                        Map orderMap = orderManager.getOrderDetails(orderId);

                        // place order details in request scope
                        request.setAttribute("customer", orderMap.get("customer"));
                        request.setAttribute("products", orderMap.get("products"));
                        request.setAttribute("orderRecord", orderMap.get("orderRecord"));
                        request.setAttribute("orderedProducts", orderMap.get("orderedProducts"));

                        userPath = "/confirmation";

                    // otherwise, send back to checkout page and display error
                    } else {
                        userPath = "/checkout";
                        request.setAttribute("orderFailureFlag", true);
                    }
                }
            }
        
         }

        // use RequestDispatcher to forward request internally
        String url = "/WEB-INF/view" + userPath + ".jsp";

        try {
            request.getRequestDispatcher(url).forward(request, response);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

}