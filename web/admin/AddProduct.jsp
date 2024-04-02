<%-- 
    Document   : addProduct
    Created on : 03-Jul-2017, 15:07:46
    Author     : tomsol28
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="js/jquery.validate.js" type="text/javascript"></script>
<script>
function checkPrice(str){
                var num = new Number(str);
        if (/^[0-9]{0,3}(\.[0-9]{0,2})?$/.test(str) && num > 0) {
            // alert('Price is valid');
            $("#CheckPrice").html('<font color="#52AD59"> Price is valid!</font>');
            return true;
        } else {
            //alert('Price is not valid, eg. 20.00');
            $("#CheckPrice").html('<font color="#cc0000"> Price is not valid, eg. 20.00</font>');

            return false;
        }
    }

    function editConfirmation() {
        'use strict';
        //Get reference to the form elements:
        var okay = confirm('Are you sure you want to add it?');

        if (okay) {

            //forwards to edit page.
            return true;

        } else {
            //retrieved the page.
            return false;
        }
    }


    function int() {

        'use strict';

        //confirm that document.getElementById() can be used
        if (document && document.getElementById) {
            var addForm = document.getElementById('addForm');
            addForm.onsubmit = editConfirmation;
        }
    }// End of init() function.
//Asign an event listener to window's load event
    window.onload = init;

</script> 
<div class="row">
    <div id="sidebar" class="span3">
        <div class="well well-small">
            <ul class="nav nav-list">
                <li class="nav-header"><h5>OVERVIEW</h5></li>
                <hr class="soften"/>
                <li><a href="<c:url value='viewCustomers'/>">VIEW ALL CUSTOMERS</a></li>
                <li><a href="<c:url value='viewOrders'/>">VIEW ALL ORDERS</a></li>
                <li><a href="<c:url value='viewUsers'/>">VIEW USER ACCOUNTS</a></li>
                <li style="border:0"> &nbsp;</li>
                <li style="border:0"> &nbsp;</li>
            </ul>

            <ul class="nav nav-list">
                <li class="nav-header"><h5>VIEW PRODUCT</h5></li>
                <hr class="soften"/>
                <li><a href="<c:url value='viewProducts'/>">VIEW ALL PRODUCT</a></li>
                <li><a href="<c:url value='viewCategories'/>">VIEW ALL CATEGORY</a></li>
                <li><a href="<c:url value='viewSubcategories'/>">VIEW ALL SUB CATEGORY</a></li>
                <li style="border:0"> &nbsp;</li>
                <li style="border:0"> &nbsp;</li>
            </ul>

            <div class="block">
                <ul class="nav nav-list">
                    <li class="nav-header"><h5>SETTING MANAGEMENT</h5></li>
                </ul>
                <div class="panel-group category-products" id="accordian"><!--Subcategory-products-->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h6 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordian" href="#electronics">
                                    <span class="badge pull-right"><b class="icon-plus"></b></span>
                                    PRODUCT MANAGEMENT
                                </a>
                            </h6>
                        </div>
                        <div id="electronics" class="panel-collapse collapse">
                            <div class="panel-default">
                                <ul class="nav nav-list" >
                                    <li><a href="<c:url value='AddProduct.jsp'/>">ADD PRODUCT </a></li>
                                    <li><a href="<c:url value='EDproducts'/>">EDIT/DELETE PRODUCT</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="panel-group category-products" id="accordian"><!--category-products-->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h6 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordian" href="#clothes">
                                    <span class="badge pull-right"><b class="icon-plus"></b></span>
                                    CATEGORY MANAGEMENT
                                </a>
                            </h6>
                        </div>
                        <div id="clothes" class="panel-collapse collapse">
                            <div class="panel-default">
                                <ul class="nav nav-list" >
                                    <li><a href="<c:url value='AddCategory.jsp'/>">ADD CATEGORY </a></li>
                                    <li><a href="<c:url value='EDCategories'/>">EDIT/DELETE CATEGORY</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="panel-group category-products" id="accordian"><!--category-products-->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h6 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordian" href="#sportswear">
                                    <span class="badge pull-right"><b class="icon-plus"></b></span>
                                    SUBCATEGORY MANAGEMENT
                                </a>
                            </h6>
                        </div>
                        <div id="sportswear" class="panel-collapse collapse">
                            <div class="panel-default">
                                <ul class="nav nav-list" >
                                    <li><a href="<c:url value='AddSubcategory.jsp'/>">ADD SUBCATEGORY </a></li>
                                    <li><a href="<c:url value='EDSubcategories'/>">EDIT/DELETE SUBCATEGORY </a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <div class="span9">
        <div class="well">
            <h5 class="page-header"> <a class="btn btn-mini pull-right" href="<c:url value='logout'/>" title="Click to Logout"> Logout <span class="icon-user"></span></a>PRODUCT MANAGEMENT</h5>

            <h5 class="page-header"> ADD PRODUCT INFORMATION</h5>

            <form id="addForm" action="<c:url value='addProduct'/>" method="post" class="form-horizontal" onsubmit="return editConfirmation()">
                <fieldset> 
                    <p align="center"> Please fill the form to add product information to database.</p>
                    <hr class="soft"/>

                    <c:if test="${!empty validationProErrorFlag}">

                        <p style="text-align:center" >
                            <span class="text" style="color:#cc0000"><fmt:message key="validationProErrorFlag"/>
                        </p>
                        <hr class="soft"/>
                    </c:if>

                    <div class="control-group">
                        <label class="control-label">Name <sup style="color:#cc0000">*</sup></label>
                        <div class="controls">
                            <input type="text"  name="name" id="name" placeholder=" Enter product's name" value="${param.name}" required/>
                            <c:if test="${!empty nameError}">
                                <label for="name" style="color:#cc0000"><fmt:message key="nameError"/> </label>
                            </c:if>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">Price <sup style="color:#cc0000">*</sup></label>
                        <div class="controls">
                            <input type="text" name="price" class="pull-left" id="price" placeholder=" Enter price per unit" value="${param.price}" required  onkeyup="checkPrice(this.value);"/>
                            <label class="controls" id="CheckPrice"> </label>
                            <c:if test="${!empty priceError}">
                                <label for="price" style="color:#cc0000"><fmt:message key="priceError"/> </label>
                            </c:if>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">Description <sup style="color:#cc0000">*</sup></label>
                        <div class="controls">
                            <textarea  id="description" placeholder="Describe your product here... less than 250 characters" name="description" value="${param.description}" rows="5" id="textarea" class="input-block-level" required/>${param.description}</textarea>
                            <c:if test="${!empty descriptionError}">
                                <label for="description" style="color:#cc0000"><fmt:message key="descriptionError"/> </label>
                            </c:if>
                        </div>
                    </div>	  
                    <div class="control-group">
                        <label class="control-label">Brand <sup style="color:#cc0000">*</sup></label>
                        <div class="controls">
                            <input type="text" name="brand" id="brand" placeholder="Enter brand's name" value="${param.brand}" required/>
                            <c:if test="${!empty brandError}">
                                <label for="brand" style="color:#cc0000"><fmt:message key="brandError"/> </label>
                            </c:if>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">Choose a category: <sup style="color:#cc0000">*</sup></label>
                        <div class="controls">
                            <select class="span3" name="categoryId" id="categoryId" required>
                                <option value=""> Choose a category:</option> 
                                <c:forEach var="category" items="${categories}">
                                    <option value="${category.id}">${category.name}</option>
                                </c:forEach>
                            </select>
                            <c:if test="${!empty categoryIdError}">
                                <label for="categoryId" style="color:#cc0000"><fmt:message key="categoryIdError"/> </label>
                            </c:if>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">Choose a subcategory: <sup style="color:#cc0000">*</sup></label>
                        <div class="controls">
                            <select class="span3" name="subcategoryId" id="subcategoryId" required>
                                <option value=""> Choose a subcategory:</option>
                                <c:forEach var="subcategory" items="${subcategories}">
                                    <option value="${subcategory.id}">${subcategory.name}</option>
                                </c:forEach>
                            </select>
                            <c:if test="${!empty subcategoryIdError}">
                                <label for="subcategoryId" style="color:#cc0000"><fmt:message key="subcategoryIdError"/> </label>
                            </c:if>
                        </div>
                    </div>
                    <div class="control-group">
                        <div class="controls">
                            <button type="submit" id="submit" name="action" value="Add" class="btn btn-warning"/>Add <i class="icon-save"></i></button>
                            <input type="reset" value="Clear" class="btn btn-default"/> 
                        </div>
                    </div>
                </fieldset>
            </form>
            <hr class="softn clr"/>
        </div>

    </div>
</div>
