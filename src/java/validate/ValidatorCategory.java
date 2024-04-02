
package validate;

import javax.servlet.http.HttpServletRequest;


public class ValidatorCategory {
    
 public boolean validateForm(String name,
                                HttpServletRequest request) {

        boolean errorFlag = false;
        boolean nameError;
        
        if (name == null
                || name.equals("")
                || name.length() < 3) {
            errorFlag = true;
            nameError = true;
            request.setAttribute("nameError", nameError);
        }
        
         return errorFlag;
    }
    
}

