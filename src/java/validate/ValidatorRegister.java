
package validate;

import javax.servlet.http.HttpServletRequest;


public class ValidatorRegister {
public boolean validateForm(String username,
                            String password,
                   HttpServletRequest request) {

        boolean errorFlag = false;
        boolean usernameError;
        boolean passwordError;
     
        if (username == null
                || username.equals("")
                || username.length() < 3) {
            errorFlag = true;
            usernameError = true;
            request.setAttribute("usernameError", usernameError);
        }
         if (password == null
                || password.equals("")
                || password.length() < 5) {
            errorFlag = true;
            passwordError = true;
            request.setAttribute("passwordError", passwordError);
        }       

        return errorFlag;
    }
}
