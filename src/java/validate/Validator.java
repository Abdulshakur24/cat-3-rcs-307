
package validate;

import javax.servlet.http.HttpServletRequest;



public class Validator {
 // ensures that quantity input is number between 0 and 99
    // applies to quantity fields in cart page
    public boolean validateQuantity (String productId, String quantity) {

        boolean errorFlag = false;

        if (!productId.isEmpty() && !quantity.isEmpty()) {

            int i = -1;

            try {

                i = Integer.parseInt(quantity);
            } catch (NumberFormatException nfe) {

                System.out.println("User did not enter a number in the quantity field");
            }

            if (i < 0 || i > 99) {

                errorFlag = true;
            }
        }

        return errorFlag;
    }


    // performs simple validation on checkout form
    public boolean validateForm(String firstName,
                                String lastName,
                                String email,
                                String phone,
                                String address,
                                String city,
                                String postCode,
                                String county,
                                HttpServletRequest request) {

        boolean errorFlag = false;
        boolean firstNameError;
        boolean lastNameError;
        boolean emailError;
        boolean phoneError;
        boolean addressError;
        boolean cityError;
        boolean postCodeError;
        boolean countyError;

        if (firstName == null
                || firstName.equals("")
                || firstName.length() < 3) {
            errorFlag = true;
            firstNameError = true;
            request.setAttribute("firstNameError", firstNameError);
        }
        if (lastName == null
                || lastName.equals("")
                || lastName.length() < 3) {
            errorFlag = true;
            lastNameError = true;
            request.setAttribute("lastNameError", lastNameError);
        }
        if (email == null
                || email.equals("")
                || !email.contains("@")) {
            errorFlag = true;
            emailError = true;
            request.setAttribute("emailError", emailError);
        }
        if (phone == null
                || phone.equals("")
                || phone.length() < 11) {
            errorFlag = true;
            phoneError = true;
            request.setAttribute("phoneError", phoneError);
        }
        if (address == null
                || address.equals("")
                || address.length() > 45) {
            errorFlag = true;
            addressError = true;
            request.setAttribute("addressError", addressError);
        }
        if (city == null
                || city.equals("")
                || city.length() > 45) {
            errorFlag = true;
            cityError = true;
            request.setAttribute("cityError", cityError);
        }
        if (postCode == null
                || postCode.equals("")
                || postCode.length() < 5) {
            errorFlag = true;
            postCodeError = true;
            request.setAttribute("postCodeError", postCodeError);
        }
        if (county == null
                || county.equals("")
                || county.length() > 45) {
            errorFlag = true;
            countyError = true;
            request.setAttribute("countyError", countyError);
        }
       
        return errorFlag;
    }
    
}
