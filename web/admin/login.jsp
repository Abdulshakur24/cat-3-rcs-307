<%-- 
    Document   : login
    Created on : 30-Jun-2017, 03:10:34
    Author     : tomsol28
--%>
<script>
function validateForm(){
    'use strict';
    //Get reference to the form elements:
    var j_username = document.getElementById('j_username');
        var j_password = document.getElementById('j_password');

        //validate!
        if ((j_username.value.length > 0) && (j_password.value.length > 0)) {
            return true;
        } else {
            alert('Username or Password cannot be blank!');
            return false;
        }

    }   //End of validationForm() function.

    function int() {
        'use strict';

        //confirm that document.getElementById() can be used
        if (document && document.getElementById) {
            var loginForm = document.getElementById('loginForm');
            loginForm.onsubmit = validateForm;
        }
    }// End of init() function.
//Asign an event listener to window's load event
    window.onload = init;

</script>
<div class="row">

    <div class="span12">	
        <div class="wel breadcrumb">
            <form action="j_security_check" method="post" class="form-horizontal" id="loginForm" onsubmit="return validateForm()">
                <fieldset> 
                    <h3 align="center">Your Login Details</h3>
                    <hr class="soft"/><br>

                    <div class="control-group">
                        <label class="control-label">User name <sup>*</sup></label>
                        <div class="controls">
                            <input type="text" class="form-control" name="j_username" id="j_username" placeholder=" Enter Username">
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label">Password <sup>*</sup></label>
                        <div class="controls">
                            <input type="password"  name="j_password"  id="j_password" class="form-control" placeholder="Enter Password">
                        </div>
                    </div>

                    <div class="control-group">
                        <div class="controls">
                            <button type="reset" class="btn btn-group-lg" value="clear"> Clear </button>
                            <input type="submit"  id="submit" class="btn btn-primary" value="Login &Rrightarrow;"> 

                        </div>

                    </div>
                </fieldset>
            </form>
        </div>

    </div>
</div>

