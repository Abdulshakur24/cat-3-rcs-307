<%-- 
    Document   : deleteSubConfirmation
    Created on : 13-Aug-2017, 01:07:01
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
            <h5 class="page-header"> <a class="btn btn-mini pull-right" href="<c:url value='logout'/>" title="Click to Logout"> Logout <span class="icon-user"></span></a>CATEGORY MANAGEMENT</h5>

            <h5 class="page-header">DELETE SUBCATEGORY INFORMATION <a href="<c:url value='viewSubcategories'/>" class="shopBtn btn-large pull-right">
                    <span class="icon-arrow-left"></span><strong> Back Subcategory Summary</strong></a></h5>

            <table class="table table-bordered table-striped">
                <tr class="header">
                    <th colspan="3" style="text-align: center">You have been deleted successfully!</th>
                </tr>
                <tr>
                    <td><strong>Subcategory ID:</strong></td>
                    <td>${subcategory.id}</td>
                </tr>
                <tr>
                    <td><strong>Name:</strong></td>
                    <td>${subcategory.name}</td>
                </tr>

            </table>
            <br><br><br>
            <table class="table table-responsive">
                <tr>
                    <td colspan="4">

                        <a href="<c:url value='EDSubcategories'/>" class="shopBtn btn-large pull-left">
                            <span class="icon-arrow-left"></span> <strong> Edit/Delete Subcategory Summary </strong> </a>
                        <a href="<c:url value='AddSubcategory.jsp'/>" class="shopBtn btn-large pull-right">
                            <strong> Add Subcategory </strong><span class="icon-arrow-right"></span> </a>

                    </td>
                </tr>
            </table>
        </div>
        <div class="well well-small">
            <h3 class="page-header">CATEGORY LIST</h3>

            <table class="table table-bordered table-striped">
                <tr class="">
                    <th colspan="2" style="text-align:center">SUBCATEGORIES</th>
                </tr>
                <th>ID</th>
                <th>Name</th>
                    <c:forEach items="${subcategories}" var="subcategory">
                    <tr>
                        <td>${subcategory.id}</td>
                        <td>${subcategory.name}</td>
                    </tr>
                </c:forEach>
            </table>  
        </div>
    </div>
</div>