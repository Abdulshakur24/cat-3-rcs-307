<%-- 
    Document   : deProConfirmation
    Created on : 17-Aug-2017, 23:37:38
    Author     : tomsol28
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

            <h5 class="page-header">DELETE PRODUCT INFORMATION <a href="<c:url value='viewProducts'/>" class="shopBtn btn-large pull-right">
                    <span class="icon-arrow-left"></span><strong> Back Product Summary</strong></a></h5>

            <table class="table table-bordered table-striped">
                <tr class="header">
                    <th colspan="3" style="text-align: center">You have been deleted successfully from database!</th>
                </tr>
                <tr>
                    <td><strong>Product ID:</strong></td>
                    <td>${product.id}</td>
                </tr>

            </table>
            <br><br><br>
            <table class="table table-responsive">
                <tr>
                    <td colspan="4">

                        <a href="<c:url value='EDproducts'/>" class="shopBtn btn-large pull-left">
                            <span class="icon-arrow-left"></span> <strong> Edit/Delete Product Summary </strong> </a>
                        <a href="<c:url value='AddProduct.jsp'/>" class="shopBtn btn-large pull-right">
                            <strong> Add Product </strong><span class="icon-arrow-right"></span> </a>

                    </td>
                </tr>
            </table>
        </div>

    </div>
</div>
