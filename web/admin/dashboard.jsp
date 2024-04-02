<%-- 
    Document   : index
    Created on : 30-Jun-2017, 03:10:19
    Author     : tomsol28
--%>
<script>

function editConfirmation(){
    'use strict';
    //Get reference to the form elements:
     var okay = confirm('Are you sure you want to edit it?');

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
            var editForm = document.getElementById('editForm');
            editForm.onsubmit = editConfirmation;
        }
    }// End of init() function.

    function deleteConfirmation() {
        'use strict';
        //Get reference to the form elements:
        var okay = confirm('Are you sure you want to delete it?');

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
            var deleteForm = document.getElementById('deleteForm');
            deleteForm.onsubmit = deleteConfirmation;
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
                <!--li class="active"><a href="#">OVERVIEW <span class="sr-only">(Current)</span></a></li-->
                <li><a href="<c:url value='viewCustomers'/>">VIEW ALL CUSTOMERS</a></li>
                <li><a href="<c:url value='viewOrders'/>">VIEW ALL ORDERS</a></li>
                <li><a href="<c:url value='viewUsers'/>">VIEW USER ACCOUNTS</a></li>
                <li style="border:0"> &nbsp;</li>
                <li style="border:0"> &nbsp;</li>
            </ul>

            <ul class="nav nav-list">
                <li class="nav-header"><h5>VIEW PRODUCT</h5></li>
                <hr class="soften"/>
                <!--li class="active"><a href="#">OVERVIEW <span class="sr-only">(Current)</span></a></li-->
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
            <h3 class="page-header"><a class="btn btn-mini pull-right" href="<c:url value='logout'/>" title="Click to Logout"> Logout <span class="icon-user"></span></a> DASHBOARD</h3>

            <%-- customerList is requested --%>
            <c:if test="${!empty customerList}">

                <table class="table table-bordered table-striped">

                    <tr class="">
                        <th colspan="5" style="text-align:center">Customers</th>
                    </tr>

                    <tr class="tableHeading">
                        <td><strong>Customer id</strong></td>
                        <td><strong>First name</strong></td>
                        <td><strong>Email</strong></td>
                        <td><strong>Phone</strong></td>
                        <td><strong> View</strong></td>
                    </tr>

                    <c:forEach var="customer" items="${customerList}" varStatus="iter">

                        <tr class="tableRow"
                            onclick="document.location.href = 'customerRecord?${customer.id}'">

                            <td>${customer.id}</td>
                            <td>${customer.firstName}</td>
                            <td>${customer.email}</td>
                            <td>${customer.phone}</td>

                            <%-- Below anchor tags are provided in case JavaScript is disabled --%>
                            <td><a href="customerRecord?${customer.id}" class="btn btn-mini"><strong> View Customer Details <span class="icon-arrow-right"></span></strong></a></td>

                        </tr>

                    </c:forEach>

                </table>

            </c:if>

            <%-- orderList is requested --%>
            <c:if test="${!empty orderList}">

                <table class=" table table-bordered table-striped">

                    <tr class="header">
                        <th colspan="5" style="text-align:center">Orders</th>
                    </tr>

                    <tr class="tableHeading">
                        <td><strong>Order ID</strong></td>
                        <td><strong>Confirmation Number</strong></td>
                        <td><strong>Amount</strong></td>
                        <td><strong>Date Created</strong></td>
                        <td><strong></strong></td>
                    </tr>

                    <c:forEach var="order" items="${orderList}" varStatus="iter">

                        <tr class="tableRow"
                            onclick="document.location.href = 'orderRecord?${order.id}'">

                            <td>${order.id}</td>
                            <td>${order.confirmationNumber}</td>

                            <td><fmt:formatNumber type="currency"
                                              currencySymbol="&pound; "
                                              value="${order.amount}"/></td>

                            <td><fmt:formatDate value="${order.dateCreated}"
                                            type="both"
                                            dateStyle="short"
                                            timeStyle="short"/></td>

                            <%-- Below anchor tags are provided in case JavaScript is disabled --%>
                            <td><a href="orderRecord?${order.id}" class="btn btn-mini"><strong> View Order Summary <span class="icon-arrow-right"></span></strong></a></td>

                        </tr>

                    </c:forEach>

                </table>

            </c:if>

            <%-- customerRecord is requested --%>
            <c:if test="${!empty customerRecord}">

                <table  class="table table-bordered table-striped">

                    <tr class="header">
                        <th colspan="2" style="text-align:center">Customer Details</th>
                    </tr>
                    <tr>
                        <td style="width: 290px"><strong>Customer ID:</strong></td>
                        <td>${customerRecord.id}</td>
                    </tr>
                    <tr>
                        <td><strong>First Name:</strong></td>
                        <td>${customerRecord.firstName}</td>
                    </tr>
                    <tr>
                        <td><strong>Last Name:</strong></td>
                        <td>${customerRecord.lastName}</td>
                    </tr>
                    <tr>
                        <td><strong>Email:</strong></td>
                        <td>${customerRecord.email}</td>
                    </tr>
                    <tr>
                        <td><strong>Phone:</strong></td>
                        <td>${customerRecord.phone}</td>
                    </tr>
                    <tr>
                        <td><strong>Address:</strong></td>
                        <td>${customerRecord.address}</td>
                    </tr>
                    <tr>
                        <td><strong>City:</strong></td>
                        <td>${customerRecord.city}</td>
                    </tr>
                    <tr>
                        <td><strong>Post Code:</strong></td>
                        <td>${customerRecord.postCode}</td>
                    </tr>
                    <tr>
                        <td><strong>County:</strong></td>
                        <td>${customerRecord.county}</td>
                    </tr>
                    <tr><td colspan="2" style="padding: 0 20px"><br><br></td></tr>

                    <tr class="tableRow"
                        onclick="document.location.href = 'orderRecord?${order.id}'">
                        <td colspan="2">
                            <%-- Anchor tag is provided in case JavaScript is disabled --%>
                            <a href="orderRecord?${order.id}" class="shopBtn btn-large pull-left">
                                <strong>View Order Summary </strong> <span class="icon-arrow-right"></span></a></td>
                    </tr>
                </table>

            </c:if>

            <%-- orderRecord is requested --%>
            <c:if test="${!empty orderRecord}">

                <table class="table table-bordered table-striped">

                    <tr class="header">
                        <th style="text-align:center" colspan="2">Order Summary</th>
                    </tr>
                    <tr>
                        <td><strong>Order ID:</strong></td>
                        <td>${orderRecord.id}</td>
                    </tr>
                    <tr>
                        <td><strong>Confirmation Number:</strong></td>
                        <td>${orderRecord.confirmationNumber}</td>
                    </tr>
                    <tr>
                        <td><strong>Date Processed:</strong></td>
                        <td>
                            <fmt:formatDate value="${orderRecord.dateCreated}"
                                            type="both"
                                            dateStyle="short"
                                            timeStyle="short"/></td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <table class="table table-bordered table-responsive">
                                <tr class="tableHeading">
                                    <td><strong>Product</strong></td>
                                    <td style="text-align:center"><strong>Quantity</strong></td>
                                    <td style="text-align:center"><strong>Price</strong></td>
                                </tr>

                                <c:forEach var="orderedProduct" items="${orderedProducts}" varStatus="iter">

                                    <tr>
                                        <td>
                                            ${products[iter.index].name}
                                        </td>
                                        <td style="text-align:center">
                                            ${orderedProduct.quantity}
                                        </td>
                                        <td class="confirmationPriceColumn" style="text-align:center">
                                            <fmt:formatNumber type="currency" currencySymbol="&pound; "
                                                              value="${products[iter.index].price * orderedProduct.quantity}"/>
                                        </td>
                                    </tr>

                                </c:forEach>
                                <tr><td colspan="3" style="padding: 0 20px"></td></tr>
                                <tr>
                                    <td colspan="2" id="deliverySurchargeCellLeft" style="text-align:right"><strong>Delivery Charge:</strong></td>
                                    <td id="deliverySurchargeCellRight" style="text-align:center">
                                        <fmt:formatNumber type="currency"
                                                          currencySymbol="&pound; "
                                                          value="${initParam.deliveryCharge}"/></td>
                                </tr>

                                <tr>
                                    <td colspan="2" id="totalCellLeft" style="text-align:right"><strong>Total amount:</strong></td>
                                    <td id="totalCellRight" style="text-align:center"><strong>
                                            <fmt:formatNumber type="currency"
                                                              currencySymbol="&pound; "
                                                              value="${orderRecord.amount}"/></strong></td>
                                </tr>
                            </table>
                        </td>
                    </tr>

                    <tr class="tableRow"
                        onclick="document.location.href = 'customerRecord?${customer.id}'">
                        <td colspan="2">
                            <%-- Anchor tag is provided in case JavaScript is disabled --%>
                            <a href="customerRecord?${customer.id}" class="shopBtn btn-large pull-left">
                                <strong>View Customer Details </strong> <span class="icon-arrow-right"></span></a></td>
                    </tr>
                </table>

            </c:if>

            <%-- ProductList is requested --%>
            <c:if test="${!empty productList}">
                <h5 class="page-header"><a href="<c:url value='AddProduct.jsp'/>" class="btn btn-small pull-right" title="Click to Logout"><strong> Product Management </strong><span class="icon-arrow-right"></span></a> SUBCATEGORY INFORMATION</h5>

                <table class="table table-bordered table-striped">
                    <tr class="header">
                        <th style="text-align:center" colspan="5">Products</th>
                    </tr>
                    <tr>
                        <th>Product ID </th>
                        <th>Name </th>
                        <th>Price </th>
                        <th>Brand </th>
                        <th>View</th>
                    </tr>
                    <c:forEach var="products" items="${productList}">
                        <tr class="tableRow"
                            onclick="document.location.href = 'productRecord?${products.id}'">
                            <td>${products.id}</td>
                            <td>${products.name}</td>
                            <td>${products.price}</td>
                            <td>${products.brand}</td>

                            <td><a href="productRecord?${products.id}" class="btn btn-mini"><strong>View Details <span class="icon-arrow-right"></span></strong></a></td>
                        </tr>

                    </c:forEach>
                </table>
            </c:if>

            <%-- Edit ProductList is requested --%>
            <c:if test="${!empty edproductList}">
                <h5 class="page-header"><a href="<c:url value='AddProduct.jsp'/>" class="btn btn-small pull-right" title="Click to Logout"><strong> Product Management </strong><span class="icon-arrow-right"></span></a> EDIT / DELETE PRODUCT INFORMATION</h5>

                <table class="table table-bordered table-striped">
                    <tr class="header">
                        <th style="text-align:center" colspan="5">Products</th>
                    </tr>
                    <tr>
                        <th>Product ID </th>
                        <th>Name </th>
                        <th>Price </th>
                        <th>View to Edit </th>
                        <th> View to Delete</th>
                    </tr>
                    <c:forEach var="products" items="${edproductList}">
                        <tr class="tableRow"
                            onclick="document.location.href = 'edproductRecord?${products.id}'">
                            <td>${products.id}</td>
                            <td>${products.name}</td>
                            <td>${products.price}</td>

                            <td><a href="edproductRecord?${products.id}" class="btn btn-mini btn-warning "><strong> View to Update <span class="icon-arrow-right"></span></strong></a></td>
                            <td><a href="deproductRecord?${products.id}" class="btn btn-mini btn-danger"><strong> View to Delete <span class="icon-arrow-right"></span></strong></a></td>

                        </tr>

                    </c:forEach>
                </table>
            </c:if>


            <%-- productRecord is requested --%>
            <c:if test="${!empty productRecord}">

                <table id="adminTable" class="table table-bordered table-striped">

                    <tr class="header">
                        <th colspan="2" style="text-align:center">Product Details</th>
                    </tr>
                    <tr>
                        <td style="width: 290px"><strong>Product ID:</strong></td>
                        <td>${productRecord.id}</td>
                    </tr>
                    <tr>
                        <td><strong>Name:</strong></td>
                        <td>${productRecord.name}</td>
                    </tr>
                    <tr>
                        <td><strong>Price:</strong></td>
                        <td>${productRecord.price}</td>
                    </tr>
                    <tr>
                        <td><strong>Brand:</strong></td>
                        <td>${productRecord.brand}</td>
                    </tr>
                    <tr>
                        <td><strong>Description:</strong></td>
                        <td>${productRecord.description}</td>
                    </tr>
                    <tr>
                        <td><strong>Last Updated:</strong></td> 
                        <td> <fmt:formatDate value="${productRecord.lastUpdate}"
                                        type="both"
                                        dateStyle="short"
                                        timeStyle="short"/></td>
                    </tr>
                    <!--         <tr>
                                <td><strong>Category ID:</strong></td>
                                <td>${productRecord.categoryId}</td>
                            </tr>-->
                    <tr><td colspan="2" style="padding: 0 20px"><br><br></td></tr>

                    <tr>
                        <td colspan="2">
                            <%-- Anchor tag is provided in case JavaScript is disabled --%>
                            <a href="<c:url value='viewProducts'/>" class="shopBtn btn-large pull-left">
                                <span class="icon-arrow-left"></span><strong> Back Product Summary </strong></a></td>
                    </tr>
                </table>

            </c:if>

            <%-- CategoryList is requested --%>
            <c:if test="${!empty categoryList}">
                <h5 class="page-header"><a href="<c:url value='AddCategory.jsp'/>" class="btn btn-small pull-right" title="Click to Logout"><strong> Category Management </strong><span class="icon-arrow-right"></span></a> SUBCATEGORY INFORMATION</h5>

                <table class="table table-bordered table-striped">
                    <tr class="header">
                        <th style="text-align:center" colspan="2">Category List</th>
                    </tr>
                    <tr>
                        <th>Category ID </th>
                        <th>Name </th>

                    </tr>
                    <c:forEach var="categories" items="${categoryList}">
                        <tr>
                            <td>${categories.id}</td>
                            <td>${categories.name}</td>

                        </tr>
                    </c:forEach>
                    <tr>
                    <tr><td colspan="4" style="padding: 0 20px"><br><br></td></tr>

                    <td colspan="4">
                        <%-- Anchor tag is provided in case JavaScript is disabled --%>
                        <a href="<c:url value='AddCategory.jsp'/>" class="shopBtn btn-large pull-left">
                            <strong> Add Category </strong>  <span class="icon-arrow-right"></span></a>
                        <a href="<c:url value='EDCategories'/>" class="shopBtn btn-large pull-right">
                            <strong> Edit/Remove Category </strong>  <span class="icon-arrow-right"></span></a></td>
                    </tr>
                </table>
            </c:if>

            <%-- CategoryList is requested --%>
            <c:if test="${!empty edcategoryList}">
                <h5 class="page-header"><a href="<c:url value='AddCategory.jsp'/>" class="btn btn-small pull-right" title="Click to Logout"><strong> Category Management </strong><span class="icon-arrow-right"></span></a> EDIT / DELETE CATEGORY INFORMATION</h5>

                <table class="table table-bordered table-striped">
                    <tr class="header">
                        <th style="text-align:center" colspan="4">Category List</th>
                    </tr>
                    <tr>
                        <th>Category ID </th>
                        <th>Name </th>
                        <th>Edit Category </th>
                        <th>Delete Category </th>

                    </tr>
                    <c:forEach var="categories" items="${edcategoryList}">
                        <tr>
                            <td>${categories.id}</td>
                            <td>${categories.name}</td>

                            <td><a class="btn btn-warning" alt="Update" href="categoryRecord?${categories.id}">  View to Update <i class="icon-edit"></i> </a></td>      
                            <td><a class="btn btn-danger" alt="delete" href="categoryRecDelete?${categories.id}"> View to Delete <i class="icon-remove-sign"></i></a></td>      

                        </tr>
                    </c:forEach>
                    <tr>
                    <tr><td colspan="4" style="padding: 0 20px"><br><br></td></tr>

                    <td colspan="4">
                        <%-- Anchor tag is provided in case JavaScript is disabled --%>
                        <a href="<c:url value='AddCategory.jsp'/>" class="shopBtn btn-large pull-left">
                            <strong> Add Category </strong>  <span class="icon-arrow-right"></span></a></td>
                    </tr>
                </table>
            </c:if>

            <%-- categoryRecord is requested --%>
            <c:if test="${!empty categoryRecord}">

                <table id="adminTable" class="table table-bordered table-striped">
                    <form id="editForm" action="<c:url value='CateConfirmation'/>" method="POST" class="form-horizontal" onsubmit="return editConfirmation()">

                        <h5 class="page-header">EDIT CATEGORY INFORMATION</h5>

                        <tr class="header">
                            <th colspan="2" style="text-align:center">Category Details</th>
                        </tr>
                        <tr>
                            <td style="width: 290px"><strong>Category ID:</strong></td>
                            <td><input type="text" name="id" value="${categoryRecord.id}" placeholder="ID"/></td>
                        </tr>
                        <tr>
                            <td><strong>Name:</strong></td>
                            <td><input type="text" name="name" value="${categoryRecord.name}"  placeholder="name"/> </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td >
                                <button type="submit" id="submit" name="action" value="Edit" class="btn btn-warning"/>Edit <i class="icon-edit"></i></button>
                            </td>

                        </tr>
                    </form> 
                    <tr><td colspan="2" style="padding: 0 20px"><br><br></td></tr>

                    <tr>
                        <td colspan="2">
                            <%-- Anchor tag is provided in case JavaScript is disabled --%>
                            <a href="<c:url value='viewCategories'/>" class="shopBtn btn-large pull-left">
                                <span class="icon-arrow-left"></span><strong> Back Category Summary </strong></a></td>
                    </tr>
                </table>

            </c:if>

            <%-- categoryRecord is requested --%>
            <c:if test="${!empty categoryRecDelete}">

                <table id="adminTable" class="table table-bordered table-striped">
                    <form id="deleteForm" action="<c:url value='deCategoryConfirmation'/>" method="POST" class="form-horizontal" onsubmit="return deleteConfirmation()">

                        <h5 class="page-header">DELETE CATEGORY INFORMATION</h5>

                        <tr class="header">
                            <th colspan="2" style="text-align:center">Category Details</th>
                        </tr>
                        <tr>
                            <td style="width: 290px"><strong>Category ID:</strong></td>
                            <td><input type="text" name="id" value="${categoryRecDelete.id}" placeholder="ID"/></td>
                        </tr>
                        <tr>
                            <td><strong>Name:</strong></td>
                            <td><input type="text" name="name" value="${categoryRecDelete.name}"  placeholder="name"/> </td>
                        </tr>
                        <tr >
                            <td></td>
                            <td>
                                <button type="submit" name="action" id="submit" value="Delete" class="btn btn-danger"/>Delete <i class="icon-remove-sign"></i></button>

                            </td>
                        </tr>
                    </form> 
                    <tr><td colspan="2" style="padding: 0 20px"><br><br></td></tr>

                    <tr>
                        <td colspan="2">
                            <%-- Anchor tag is provided in case JavaScript is disabled --%>
                            <a href="<c:url value='viewCategories'/>" class="shopBtn btn-large pull-left">
                                <span class="icon-arrow-left"></span><strong> Back Category Summary </strong></a></td>
                    </tr>
                </table>

            </c:if> 

            <%-- SubcategoryList is requested --%>
            <c:if test="${!empty subcategoryList}">

                <h5 class="page-header"><a href="<c:url value='AddSubcategory.jsp'/>" class="btn btn-small pull-right" title="Click to Logout"><strong> Subcategory Management </strong><span class="icon-arrow-right"></span></a> SUBCATEGORY INFORMATION</h5>

                <table class="table table-bordered table-striped">
                    <tr class="header">
                        <th style="text-align:center" colspan="2">Subcategory List</th>
                    </tr>
                    <tr>
                        <th>Category ID </th>
                        <th>Name </th>
                    </tr>
                    <c:forEach var="subcategory" items="${subcategoryList}">
                        <tr>
                            <td>${subcategory.id}</td>
                            <td>${subcategory.name}</td>
                        </tr>
                    </c:forEach>

                    <tr>
                        <td colspan="2">
                            <%-- Anchor tag is provided in case JavaScript is disabled --%>
                            <a href="<c:url value='AddSubcategory.jsp'/>" class="shopBtn btn-large pull-left">
                                <strong> Subcategory Management </strong>  <span class="icon-arrow-right"></span></a></td>
                    </tr>
                </table>
            </c:if>
            <%-- SubcategoryList is requested --%>
            <c:if test="${!empty edsubcategoryList}">

                <h5 class="page-header"><a href="<c:url value='AddSubcategory.jsp'/>" class="btn btn-small pull-right" title="Click to Logout"><strong> Subcategory Management </strong><span class="icon-arrow-right"></span></a> EDIT / DELETE SUBCATEGORY INFORMATION</h5>

                <table class="table table-bordered table-striped">
                    <tr class="header">
                        <th style="text-align:center" colspan="4">Subcategory List</th>
                    </tr>
                    <tr>
                        <th>Subcategory ID </th>
                        <th>Name </th>
                        <th> Edit Subcategory</th>
                        <th> Delete Subcategory</th>
                    </tr>
                    <c:forEach var="subcategory" items="${edsubcategoryList}">
                        <tr>
                            <td>${subcategory.id}</td>
                            <td>${subcategory.name}</td>

                            <td><a class="btn btn-warning" alt="Update" href="subcategoryRecord?${subcategory.id}">  View to Update <i class="icon-edit"></i> </a></td>      
                            <td><a class="btn btn-danger" alt="delete"  href="subcategoryRecDelete?${subcategory.id}"> View to Delete <i class="icon-remove-sign"></i></a></td>      

                        </tr>
                    </c:forEach>

                    <tr>
                        <td colspan="4">
                            <%-- Anchor tag is provided in case JavaScript is disabled --%>
                            <a href="<c:url value='AddSubcategory.jsp'/>" class="shopBtn btn-large pull-left">
                                <strong>  Add Subcategory </strong>  <span class="icon-arrow-right"></span></a></td>
                    </tr>
                </table>
            </c:if>

            <%-- SubcategoryRecord is requested --%>
            <c:if test="${!empty subcategoryRecord}">

                <table id="adminTable" class="table table-bordered table-striped">
                    <form id="editForm" action="<c:url value='edSubConfirmation'/>" method="POST" class="form-horizontal" onsubmit="return editConfirmation()">

                        <h5 class="page-header">EDIT SUBCATEGORY INFORMATION</h5>

                        <tr class="header">
                            <th colspan="2" style="text-align:center">Subcategory Details</th>
                        </tr>
                        <tr>
                            <td style="width: 290px"><strong>Category ID:</strong></td>
                            <td><input type="text" name="id" value="${subcategoryRecord.id}" placeholder="ID"/></td>
                        </tr>
                        <tr>
                            <td><strong>Name:</strong></td>
                            <td><input type="text" name="name" value="${subcategoryRecord.name}"  placeholder="name"/> </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td >
                                <button type="submit" id="submit" name="action" value="Edit" class="btn btn-warning"/>Edit <i class="icon-edit"></i></button>
                            </td>

                        </tr>
                    </form> 
                    <tr><td colspan="2" style="padding: 0 20px"><br><br></td></tr>

                    <tr>
                        <td colspan="2">
                            <%-- Anchor tag is provided in case JavaScript is disabled --%>
                            <a href="<c:url value='EDCategories'/>" class="shopBtn btn-large pull-left">
                                <span class="icon-arrow-left"></span><strong> Back Subcategory Summary </strong></a></td>
                    </tr>
                </table>
            </c:if>


            <%-- categoryRecord is requested --%>
            <c:if test="${!empty subcategoryRecDelete}">

                <table id="adminTable" class="table table-bordered table-striped">
                    <form id="deleteForm" action="<c:url value='deSubConfirmation'/>" method="POST" class="form-horizontal" onsubmit="return deleteConfirmation()">

                        <h5 class="page-header">DELETE SUBCATEGORY INFORMATION</h5>

                        <tr class="header">
                            <th colspan="2" style="text-align:center">Subcategory Details</th>
                        </tr>
                        <tr>
                            <td style="width: 290px"><strong>Category ID:</strong></td>
                            <td><input type="text" name="id" value="${subcategoryRecDelete.id}" placeholder="ID"/></td>
                        </tr>
                        <tr>
                            <td><strong>Name:</strong></td>
                            <td><input type="text" name="name" value="${subcategoryRecDelete.name}"  placeholder="name"/> </td>
                        </tr>
                        <tr >
                            <td></td>
                            <td>
                                <button type="submit" name="action" id="submit" value="Delete" class="btn btn-danger"/>Delete <i class="icon-remove-sign"></i></button>

                            </td>
                        </tr>
                    </form> 
                    <tr><td colspan="2" style="padding: 0 20px"><br><br></td></tr>

                    <tr>
                        <td colspan="2">
                            <%-- Anchor tag is provided in case JavaScript is disabled --%>
                            <a href="<c:url value='EDSubcategories'/>" class="shopBtn btn-large pull-left">
                                <span class="icon-arrow-left"></span><strong> Back Subcategory Summary </strong></a></td>
                    </tr>
                </table>

            </c:if> 

            <%-- productRecord is requested --%>
            <c:if test="${!empty edproductRecord}">

                <table id="adminTable" class="table table-bordered table-striped">
                    <form id="editForm" action="<c:url value='EdProConfirmation'/>" method="POST" class="form-horizontal" onsubmit="return editConfirmation()">

                        <h5 class="page-header">EDIT PRODUCT INFORMATION</h5>

                        <tr class="header">
                            <th colspan="2" style="text-align:center">Product Details</th>
                        </tr>
                        <tr>
                            <td style="width: 290px"><strong>Product ID:</strong></td>
                            <td> <input type="text" name="id" value="${edproductRecord.id}"/> </td>
                        </tr>
                        <tr>
                            <td><strong>Name:</strong></td>
                            <td><input type="text" name="name" value="${edproductRecord.name}"/>

                            </td>

                        </tr>
                        <tr>
                            <td><strong>Price:</strong></td>
                            <td><input type="text" name="price" value="${edproductRecord.price}"/>

                            </td>
                        </tr>
                        <tr>
                            <td><strong>Brand:</strong></td>
                            <td><input type="text" name="brand" value="${edproductRecord.brand}"/>

                            </td>
                        </tr>
                        <tr>
                            <td><strong>Description:</strong></td>
                            <td>
                <!--                <input type="text" name="description" value="${edproductRecord.description}"/>-->
                                <textarea name="description" rows="5" id="textarea" class="input-block-level" value="${edproductRecord.description}"/>${edproductRecord.description}</textarea>
                            </td>
                        </tr>
                        <tr>
                            <td><strong>Last Updated:</strong></td> 
                            <td> <fmt:formatDate value="${edproductRecord.lastUpdate}"
                                            type="both"
                                            dateStyle="short"
                                            timeStyle="short"/>
                            </td>
                        </tr>
                        <tr>
                            <td><strong>Category ID:</strong></td>
                            <td> <input type="text" name="categoryId" value="${edproductRecord.categoryId}" required/>
                                <br><span style="color:#cc0000" >Please modify by typing only ID number as it displays, eg. 1 </span>

                            </td>
                        </tr>
                        <tr>
                            <td><strong>Subcategory ID:</strong></td>
                            <td><input type="text" name="subcategoryId" value="${edproductRecord.subcategoryId}" required/>
                                <br><span style="color:#cc0000" >Please modify by typing only ID number as it shows, eg. 1 </span>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td >
                                <button type="submit" id="submit" name="action" value="Edit" class="btn btn-warning"/>Edit <i class="icon-edit"></i></button>
                            </td>

                        </tr>
                    </form> 
                    <tr><td colspan="2" style="padding: 0 20px"><br><br></td></tr>

                    <tr>
                        <td colspan="2">
                            <%-- Anchor tag is provided in case JavaScript is disabled --%>
                            <a href="<c:url value='EDproducts'/>" class="shopBtn btn-large pull-left">
                                <span class="icon-arrow-left"></span><strong> Back Edit Product Summary </strong></a></td>
                    </tr>
                </table>

            </c:if>

            <%-- productRecord is requested --%>
            <c:if test="${!empty deproductRecord}">

                <table id="adminTable" class="table table-bordered table-striped">
                    <form id="deleteForm" action="<c:url value='deProConfirmation'/>" method="POST" class="form-horizontal" onsubmit="return deleteConfirmation()">

                        <h5 class="page-header">DELETE PRODUCT INFORMATION</h5>

                        <tr class="header">
                            <th colspan="2" style="text-align:center">Product Details</th>
                        </tr>
                        <tr>
                            <td style="width: 290px"><strong>Product ID:</strong></td>
                            <td> <input type="text" name="id" value="${deproductRecord.id}"/> </td>
                        </tr>
                        <tr>
                            <td><strong>Name:</strong></td>
                            <td>${deproductRecord.name}</td>
                        </tr>
                        <tr>
                            <td><strong>Price:</strong></td>
                            <td>${deproductRecord.price}</td>
                        </tr>
                        <tr>
                            <td><strong>Brand:</strong></td>
                            <td>${deproductRecord.brand}</td>
                        </tr>
                        <tr>
                            <td><strong>Description:</strong></td>
                            <td>${deproductRecord.description}</td>
                        </tr>
                        <tr>
                            <td><strong>Last Updated:</strong></td> 
                            <td> <fmt:formatDate value="${deproductRecord.lastUpdate}"
                                            type="both"
                                            dateStyle="short"
                                            timeStyle="short"/>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td >
                                <button type="submit" id="submit" name="action" value="Delete" class="btn btn-danger"/>Delete <i class="icon-remove-sign"></i></button>
                            </td>

                        </tr>
                    </form> 
                    <tr><td colspan="2" style="padding: 0 20px"><br><br></td></tr>

                    <tr>
                        <td colspan="2">
                            <%-- Anchor tag is provided in case JavaScript is disabled --%>
                            <a href="<c:url value='EDproducts'/>" class="shopBtn btn-large pull-left">
                                <span class="icon-arrow-left"></span><strong> Back Edit/Delete Product Summary </strong></a></td>
                    </tr>
                </table>

            </c:if>

            <%-- customerList is requested --%>
            <c:if test="${!empty userList}">

                <table class="table table-bordered table-striped">

                    <tr class="">
                        <th colspan="4" style="text-align:center">Users</th>
                    </tr>

                    <tr class="tableHeading">
                        <td><strong>User id</strong></td>
                        <td><strong>User Name</strong></td>
                        <td><strong>Password</strong></td>

                    </tr>

                    <c:forEach var="user" items="${userList}" varStatus="iter">

                        <tr class="tableRow"
                            onclick="document.location.href = 'userRecord?${user.id}'">

                            <td>${user.id}</td>
                            <td>${user.username}</td>
                            <td></td> 

                        </tr>

                    </c:forEach>

                </table>

            </c:if> 
        </div>
    </div>
</div>
