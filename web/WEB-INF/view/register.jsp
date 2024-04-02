<%-- 
    Document   : register
    Created on : 17-Jun-2017, 01:14:12
    Author     : tomsol28
--%>
<script src="js/jquery.validate.js" type="text/javascript"></script>
<script type="text/javascript">

    function checkPasswordMatch() {
        var password = $("#txtPassword").val();
        var confirmPassword = $("#txtConfirmPassword").val();

        if (password !== confirmPassword)
            $("#CheckPasswordMatch").html('<font color="#cc0000">Passwords do not match!</font>');
        else
            $("#CheckPasswordMatch").html('<font color="#52AD59">Passwords match.</font>');
    }


</script>
<!-- 
Body Section 
-->
<div class="row">
    <div id="sidebar" class="span3">
        <div class="well well-small">
            <div class="block">
                <ul class="nav nav-list">
                    <li class="nav-header">CATEGORIES</li>
                    <hr class="soften"/>
                    <c:forEach var="category" items="${categories}">
                        <h5><li class=""><a href="<c:url value='category?${category.id}'/>">
                                    <span class="icon-caret-right"></span> ${category.name}</a></li></h5>
                                </c:forEach>
                    <li style="border:0"> &nbsp;</li>	
                </ul>
            </div>
        </div>

        <div class="well well-small alert alert-warning cntr">
            <h2>30% Discount</h2>
            <p> 
                only valid for online order. <br><br><a class="defaultBtn" href="#">Click here </a>
            </p>
        </div>

        <a class="shopBtn btn-block" href="#">Upcoming products <br><small>Click to view</small></a>
        <br>
        <br>

    </div>

    <div class="span9">
        <div class="well well-small">
            <h3 align="center"> REGISTRATION</h3>
        </div>

        <div class="well">
            <form id="signupForm" action="<c:url value='/addRegister'/>" method="post" class="form-horizontal">
                <fieldset> 
                    <p align="center"> Please create an E-Shopper account now to make shopping quicker.</p>
                    <hr class="soft"/>

                    <c:if test="${!empty validationReErrorFlag}">

                        <p style="text-align:center" >
                            <span class="text" style="color:#cc0000"><fmt:message key="validationReErrorMessage"/>
                        </p>
                        <hr class="soft"/>
                    </c:if>

                    <div class="control-group">
                        <label class="control-label" for="username">User name <sup>*</sup></label>
                        <div class="controls">
                            <input type="text" class="form-control" id="username" name="username" value="${param.username}" placeholder="User Name" required>
                            <c:if test="${!empty usernameError}">
                                <label for="username" style="color:#cc0000"><fmt:message key="usernameError"/> </label>
                            </c:if>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label" for="password">Password <sup>*</sup></label>
                        <div class="controls">
                            <input type="password"  id="txtPassword" name="password" value="${param.password}" class="form-control" placeholder="Password" required>
                            <c:if test="${!empty passwordError}">
                                <label for="password" style="color:#cc0000"><fmt:message key="passwordError"/> </label>
                            </c:if>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="confirmPassword"> Confirm Password <sup>*</sup></label>
                        <div class="controls">
                            <input type="password" id="txtConfirmPassword" onkeyup="checkPasswordMatch();" placeholder="Confirm Password" required>
                        </div>
                        <div class="controls" id="CheckPasswordMatch">
                        </div>
                    </div>
                    <div class="control-group">
                        <div class="controls">
                            <label class="checkbox">
                                <input name="agree" type="checkbox" required>  Please agree to our policy.
                            </label>
                        </div>
                    </div>
                    <!--        <div class="control-group">
                                <div class="controls">
                    <%=(request.getAttribute("errMessage") == null) ? "" : request.getAttribute("errMessage")%>
                </div>
            </div>-->
                    <div class="control-group">
                        <div class="controls">
                            <button type="submit" class="btn btn-primary"> Register</button> 
                            <button type="reset" class="btn btn-group-lg" value="clear"> Clear </button>
                        </div>
                    </div>
                </fieldset>
            </form>

            <hr class="softn">
            <div class="control-group">
                <label class="control-label"> Already registered <span class="icon-arrow-right"></span> <a class="btn btn-mini" href="<c:url value='/user/login.jsp'/>" title="Click to Login page"> Login Here <span class="icon-user"></span></a></label>
            </div>    
        </div>

    </div>
</div>
