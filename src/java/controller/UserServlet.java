
package controller;

import java.io.IOException;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import session.UserFacade;


@WebServlet(name = "UserServlet", 
                urlPatterns = {"/user/",
                                "/user/customerRecord",
                                "/user/orderRecord",
                                "/user/login", 
                                "/user/welcome",
                                "/user/viewUser",
                                "/user/error",
                                "/user/logout"})


public class UserServlet extends HttpServlet {


    @EJB
    private UserFacade userFacade;

    private String userPath;
    
    
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

        // if logout is requested
        if (userPath.equals("/user/logout")) {
            session = request.getSession();
            session.invalidate();   // terminate session
            response.sendRedirect("/e-commerce_Site/user/logout.jsp");
            return;
        }

        // use RequestDispatcher to forward request internally
        userPath = "/user/welcome.jsp";
        
        try {
            request.getRequestDispatcher(userPath).forward(request, response);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    /**
     * Handles the HTTP <code>GET</code> method.
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
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String userPath = request.getServletPath();
      

        // if userLogin action is called
        if (userPath.equals("/user/login")) {
              
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                
                
                if(userFacade.checklogin(username, password))
                     {
                    HttpSession session = request.getSession();
                    session.setAttribute("username", username);
                    response.sendRedirect("welcome.jsp");
                } else{
                    response.sendRedirect("error.jsp");
                }
    
	}
       
        try {
            request.getRequestDispatcher(userPath).forward(request, response);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    

        }
    
    }
