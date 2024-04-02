<%-- 
    Document   : checkout
    Created on : 27-Jun-2017, 17:15:45
    Author     : tomsol28
--%>
<%
    response.setHeader("Cache-Control", "no-cache, no-store,must revalidate");
    response.setHeader("pragma", "no-cache"); //HTTP 1.0
//response.setHeader("Expire","0"); //proxies

    if (session.getAttribute("username") == null) {
        response.sendRedirect("user/loginCheckout.jsp");
    }

%>
<script src="js/jquery.validate.js" type="text/javascript"></script>

<script type="text/javascript">

    $(document).ready(function(){
        $("#checkoutForm").validate({
            rules: {
                firstName: {
                    required: true,
                    minlength: 3
                },
                lastName: {
                    required: true,
                    minlength: 3
                },
                email: {
                    required: true,
                    email: true
                },
                phone: {
                    required: true,
                    number: true,
                    minlength: 11
                },
                address: {
                    required: true
                },
                city: {
                    required: true
                },
                postCode: {
                    required: true,
                    minlength: 8
                },
                county: {
                    required: true
                }
            }

        });
    });

    function postcode_validate(postCode)
    {

        var regPostcode = /^([a-zA-Z]){1}([0-9][0-9]|[0-9]|[a-zA-Z][0-9][a-zA-Z]|[a-zA-Z][0-9][0-9]|[a-zA-Z][0-9]){1}([ ])([0-9][a-zA-z][a-zA-z]){1}$/;

        if (regPostcode.test(postCode) === false)
        {

            document.getElementById("status").innerHTML = '<font color="#cc0000">Postcode is not yet valid.</font>';

        } else
        {

            document.getElementById("status").innerHTML = '<font color="#52AD59">You have entered a valid postcode!</font>';

        }
    }
</script>

<!-- 
Body Section 
-->
<div class="breadcrumb">
    <h3 class="header"> CHECKOUT</h3>
</div>
<div class="well well-small">
    <h4 class="page-header"> Purchase Registration</h4>
    <p>In order to purchase the items in your shopping cart, 
        please provide us with the following information:
    </p>

    <hr class="soften"/>
    <div class="breadcrumb">
        <c:if test="${!empty orderFailureFlag}">
            <h4 align="center"> Order Confirmation</h4>
            <hr class="soft"/>
            <table class="table table-bordered">
                <tbody>
                    <tr align="center"> <th> Oops! Order was unsuccessful</th> </tr>
                    <tr>
                        <td>
                            <p style="color:#cc0000"><fmt:message key="orderFailureError"/></p>
                        </td>
                    </tr>
                </tbody>
            </table>
        </c:if>
    </div>
    <div class="row-fluid">  
        <div class="span7">  
            <form id="checkoutForm" action="<c:url value='purchase'/>" method="post" class="form-horizontal">
                <div class="well">
                    <h4 align="center"> Your Personal & Billing Details</h4>
                    <hr class="soft"/>
                    <table id="checkoutTable">
                        <c:if test="${!empty validationErrorFlag}">
                            <tr>
                                <td colspan="2" style="text-align:center">
                                    <span class="text" style="color:#cc0000"><fmt:message key="validationErrorMessage"/>
                                </td>
                            </tr>
                        </c:if>
                    </table>
                    <br>
                    <div class="control-group">
                        <label class="control-label">First name <sup style="color:#cc0000">*</sup></label>
                        <div class="controls">
                            <input type="text" id="firstName" placeholder="First name" value="${param.firstName}" name="firstName" maxlength="45" id="firstName" required>
                            <c:if test="${!empty firstNameError}">
                                <label for="firstName" style="color:#cc0000" id="firstName"><fmt:message key="firstNameError"/> </label>
                            </c:if>  
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="lastName">Last name <sup style="color:#cc0000">*</sup></label>
                        <div class="controls">
                            <input type="text" id="lastName" placeholder="Last name" value="${param.lastName}" name="lastName" maxlength="45" required>
                            <c:if test="${!empty lastNameError}">
                                <label for="lastName" id="lastName" style="color:#cc0000"><fmt:message key="lastNameError"/> </label>
                            </c:if>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">Email <sup style="color:#cc0000">*</sup></label>
                        <div class="controls">
                            <input type="text" placeholder="Email" id="email" name="email" value="${param.email}" required>
                            <c:if test="${!empty emailError}">
                                <label for="email" style="color:#cc0000"><fmt:message key="emailError"/> </label>
                            </c:if>
                        </div>
                    </div>	  
                    <div class="control-group">
                        <label class="control-label">Phone No. <sup style="color:#cc0000">*</sup></label>
                        <div class="controls">
                            <input type="text" placeholder="Phone No." value="${param.phone}" name="phone" maxlength="16" required>
                            <c:if test="${!empty phoneError}">
                                <label for="phone" style="color:#cc0000"><fmt:message key="phoneError"/> </label>
                            </c:if>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">Address <sup style="color:#cc0000">*</sup></label>
                        <div class="controls">
                            <input type="text" placeholder=" Address" value="${param.address}" name="address" maxlength="45" required>
                            <c:if test="${!empty addressError}">
                                <label for="address" style="color:#cc0000"><fmt:message key="addressError"/> </label>
                            </c:if>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">City <sup style="color:#cc0000">*</sup></label>
                        <div class="controls">
                            <input type="text" placeholder=" City" value="${param.city}" name="city" required>
                            <c:if test="${!empty cityError}">
                                <label for="city" style="color:#cc0000"><fmt:message key="cityError"/> </label>
                            </c:if>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">Post Code <sup style="color:#cc0000">*</sup></label>
                        <div class="controls">
                            <input type="text" placeholder="Post Code" value="${param.postCode}" name="postCode"  id="postCode" onkeyup="postcode_validate(this.value);" required>

                            <c:if test="${!empty postCodeError}">
                                <label for="postCode" style="color:#cc0000"><fmt:message key="postCodeError"/> </label>
                            </c:if>
                        </div>
                        <div class="controls" id="status">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">County <sup style="color:#cc0000">*</sup></label>
                        <div class="controls">
                            <input type="text" placeholder=" County" value="${param.county}" name="county" required>
                            <c:if test="${!empty countyError}">
                                <label for="county" style="color:#cc0000"><fmt:message key="countyError"/> </label>
                            </c:if>
                        </div>
                    </div><br>
                    <div class="control-group">
                        <div class="controls">
                            <input type="submit" name="submit" value="submit purchase" class="exclusive shopBtn">
                            <button type="reset" class="btn defaultBtn" value="clear"> Clear </button>
                        </div>
                    </div>

                </div>

            </form>
        </div>

        <div class="span5 relative">
            <br><br><br>
            <div class="breadcrumb">   
                <div class="well wellsmall">
                    <div class="control-group">
                        <ul>
                            <li>Next-day delivery is guaranteed</li>
                            <li>A &pound; ${initParam.deliveryCharge}
                                delivery charge is applied to all purchase orders</li>
                        </ul>
                    </div>
                    <hr class="soften"/>
                    <div class="control-group">
                        <label class="control-label"><h5>Subtotal: &pound; ${cart.subtotal} </h5></label>  
                        <label class="control-label"> <h5> Delivery Charge: &pound; ${initParam.deliveryCharge}</h5></label>  
                        <label class="control-label"><h5>Total: &pound; ${cart.total}</h5></label>  
                    </div>
                </div>
            </div>
        </div>
    </div>	
</div>
<!-- 
Clients 
-->
<section class="our_client">
    <hr class="soften"/>
    <h4 class="title cntr"><span class="text">Manufactures</span></h4>
    <hr class="soften"/>
    <div class="row">
        <div class="span2">
            <a href="#"><img alt="" src="img/manufactures/nike.png"></a>
        </div>
        <div class="span2">
            <a href="#"><img alt="" src="img/manufactures/2.png"></a>
        </div>
        <div class="span2">
            <a href="#"><img alt="" src="img/manufactures/m2.png"></a>
        </div>
        <div class="span2">
            <a href="#"><img alt="" src="img/manufactures/4.png"></a>
        </div>
        <div class="span2">
            <a href="#"><img alt="" src="img/manufactures/3.png"></a>
        </div>
        <div class="span2">
            <a href="#"><img alt="" src="img/manufactures/11.png"></a>
        </div>
    </div>
</section>  
