<%-- 
    Document   : addProConfirmation
    Created on : 17-Aug-2017, 20:57:53
    Author     : tomsol28
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
function validateForm(){
    'use strict';
    //Get reference to the form elements:
    var uploadImage = document.getElementById('uploadImage');

        //validate!
        if ((uploadImage.value.length > 0)) {
            return true;
        } else {
            alert('Image upload cannot be blank!');
            return false;
        }

    }   //End of validationForm() function.

    function int() {
        'use strict';

        //confirm that document.getElementById() can be used
        if (document && document.getElementById) {
            var uploadForm = document.getElementById('uploadForm');
            loginForm.onsubmit = validateForm;
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
        <div class="well well-small">
            <h5 class="page-header"> <a class="btn btn-mini pull-right" href="<c:url value='logout'/>" title="Click to Logout"> Logout <span class="icon-user"></span></a>PRODUCT MANAGEMENT</h5>

            <h5 class="page-header">ADD PRODUCT INFORMATION <a href="<c:url value='viewProducts'/>" class="shopBtn btn-large pull-right">
                    <span class="icon-arrow-left"></span><strong> Back Product Summary</strong></a></h5>

            <table class="table table-bordered table-striped">
                <tr class="header">
                    <th colspan="3" style="text-align: center">You have been added successfully into database!</th>
                </tr>
                <tr>
                    <td><strong>Product ID:</strong></td>
                    <td>${product.id}</td>
                </tr>
                <tr>
                    <td><strong>Name:</strong></td>
                    <td>${product.name}</td>
                </tr>
                <tr>
                    <td><strong>Price:</strong></td>
                    <td>${product.price}</td>
                </tr>
                <tr>
                    <td><strong>Description:</strong></td>
                    <td>${product.description}</td>
                </tr>
            </table>
            <hr class="softn clr"/>

            <div class="well well-small"> 
                <h5 class="page-header">Upload Product Image</h5>
                <div class="control-group"> 
                    <label class="control-label">Finally, choose to upload image in server.<br> 
                        Note that the name of image must be the same as product's name on the above with case sensitive and formating as a <strong> png,</strong> eg. Product.png</label>
                </div>

                <table class="table table-bordered">

                    <tr>

                    <form id="uploadForm" action="<c:url value='ImageUpload'/>" method='POST' enctype='multipart/form-data' onsubmit="return validateForm()">
                        <td>
                            <div class="control-group"> 
                                <label class="control-label">Select Image to upload: <sup style="color:#cc0000">*</sup></label>
                        </td>
                        <td>
                            <div class="controls">
                                <input type="file" id="uploadImage" name="uploadFile"/>
                            </div>
                            </div>
                        </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <div class="control-group">
                                    <div class="controls pull-right">
                                        <button type="submit" name="submit" id="submit" value="Upload" class="btn btn-danger"/>Upload <i class="icon-upload"></i></button>

                                    </div> 
                                </div>
                            </td>
                        </tr>
                    </form>
                </table>
            </div>
        </div>

    </div>
</div>
