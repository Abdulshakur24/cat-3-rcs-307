
package validate;

import java.math.BigDecimal;
import javax.servlet.http.HttpServletRequest;


public class ValidatorProduct {
    
// performs simple validation on checkout form
    public boolean validateForm(String name,
                                BigDecimal price,
                                String description,
                                String brand,
                                String categoryId,
                                String subcategoryId,
                                HttpServletRequest request) {

        boolean errorFlag = false;
        boolean nameError;
        boolean priceError;
        boolean descriptionError;
        boolean brandError;
        boolean categoryIdError;
        boolean subcategoryIdError;

        if (name == null
                || name.equals("")
                || name.length() < 3) {
            errorFlag = true;
            nameError = true;
            request.setAttribute("nameError", nameError);
        }
        if (price == null
                || price.equals("")
                || price.compareTo(BigDecimal.ZERO) < 0) {
            errorFlag = true;
            priceError = true;
            request.setAttribute("priceError", priceError);
        }
//        if (email == null
//                || email.equals("")
//                || !email.contains("@")) {
//            errorFlag = true;
//            emailError = true;
//            request.setAttribute("emailError", emailError);
//price.contains("[0-9]+([,.][0-9]{1,2})?"))
//compareTo(BigDecimal.ZERO)== 0.00
//        }
        if (description == null
                || description.equals("")
                || description.length() < 25) {
            errorFlag = true;
            descriptionError = true;
            request.setAttribute("descriptionError", descriptionError);
        }
        if (brand == null
                || brand.equals("")
                || brand.length() < 3) {
            errorFlag = true;
            brandError = true;
            request.setAttribute("brandError", brandError);
        }
        if (categoryId == null
                || categoryId.equals("")
                || categoryId.contains(".*[^0-9].*")) {
            errorFlag = true;
            categoryIdError = true;
            request.setAttribute("categoryIdError", categoryIdError);
        }
        if (subcategoryId == null
                || subcategoryId.equals("")
                || subcategoryId.contains(".*[^0-9].*")) {
            errorFlag = true;
            subcategoryIdError = true;
            request.setAttribute("subcategoryIdError", subcategoryIdError);
        }
       
        return errorFlag;
    }
    
}
