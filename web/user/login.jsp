<%-- 
    Document   : login
    Created on : 30-Jun-2017, 03:15:08
    Author     : tomsol28
--%>

<script>
function validateForm(){
    'use strict';
    //Get reference to the form elements:
    var username = document.getElementById('username');
        var password = document.getElementById('password');

        //validate!
        if ((username.value.length > 0) && (password.value.length > 0)) {
            return true;
        } else {
            alert('Username or Password cannot be blank');
            return false;
        }
    }
//End of validationForm() function.

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
    <div id="sidebar" class="span3">   
        <div class="well well-small">
            <div class="block">
                <ul class="nav nav-list">
                    <li class="nav-header">CATEGORIES</li>
                    <hr class="soften"/>
                    <c:forEach var="category" items="${categories}">
                        <h5><li class=""><a href="<c:url value='../category?${category.id}'/>">
                                    <span class="icon-caret-right"></span> ${category.name}</a></li></h5>
                                </c:forEach>
                    <li style="border:0"> &nbsp;</li>	
                </ul>
            </div>
        </div>

        <a class="shopBtn btn-block" href="#">Upcoming products <br><small>Click to view</small></a>
        <br>
        <br>

    </div>

    <div class="span9">
        <div class="breadcrumb well-small">
            <h3 align="center"> LOGIN</h3>
        </div>	
        <div class="well">
            <form method="post" id="loginForm" class="form-horizontal" action="<c:url value='login'/>" onsubmit="return validateForm()">

                <h5 align="center">Please enter your Login details.</h5>
                <hr class="soft"/><br>

                <div class="control-group">
                    <label class="control-label" for="username">User name <sup>*</sup></label>
                    <div class="controls">
                        <input type="text" class="form-control"  name="username" id="username" placeholder="Enetr Username">
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="password">Password <sup>*</sup></label>
                    <div class="controls">
                        <input type="password"  name="password" id="password" class="form-control" placeholder="Enter Password">
                    </div>
                </div>
                <div class="control-group">
                    <div class="controls">
                        <button type="reset" class="btn btn-group-lg" value="clear"> Clear </button>
                        <Input type="submit" class="btn btn-primary" value="Login &Rrightarrow;" id="submit"/>  

                    </div>
                </div>
            </form>
            <hr class="softn">
            <div class="control-group">
                <label class="control-label"> No account go to <span class="icon-arrow-right"></span> <a class="btn btn-mini" href="<c:url value='/register'/>" title="Click to registration page"> Registration <span class="icon-user"></span></a></label>
            </div> 
        </div>

    </div>
</div>

