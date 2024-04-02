<%@page import="java.sql.*;"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ page import="java.util.*" %>
<%-- 
    Document   : searchView
    Created on : 25-Jun-2017, 15:07:01
    Author     : tomsol28
--%>

<div class="row">
    <div id="sidebar" class="span3">
        <div class="well well-small">
            <!--        <div class="block">
                    <ul class="nav nav-list">
                        <li class="nav-header">CATEGORIES</li>
                        <hr class="soften"/>
            <c:forEach var="product" items="${products}">
                <li>
                <c:choose>
                    <c:when test="${product.name == selectedProduct.name}">
                    <li class="active"> <a>
                            <strong class="sr-only">(Current) ${product.name} </strong>
                            </a> </li>
                            
                    </c:when>
                    <c:otherwise>
                        <a href="<c:url value='category?${product.id}'/>">
                            <h5><span>
                        ${product.name}
                    </span></h5>
                </a>
                    </c:otherwise>
                </c:choose>
                </li>
            </c:forEach>
                        
                <li style="border:0"> &nbsp;</li>
                
                </ul>
           </div>-->
            <div class="block">
                <ul class="nav nav-list">
                    <li class="nav-header"><h5>SUB CATEGORIES</h5></li>
                </ul>
                <div class="panel-group category-products" id="accordian"><!--Subcategory-products-->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h6 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordian" href="#electronics">
                                    <span class="badge pull-right"><b class="icon-plus"></b></span>
                                    ELECTRONICS
                                </a>
                            </h6>
                        </div>
                        <div id="electronics" class="panel-collapse collapse">
                            <div class="panel-default">
                                <ul class="nav nav-list" >
                                    <li><a href="<c:url value='subcategoryList?${3}'/>">Laptop & Tablets </a></li>
                                    <li><a href="<c:url value='subcategoryList?${2}'/>">Cameras </a></li>
                                    <li><a href="<c:url value='subcategoryList?${1}'/>">Mobile </a></li>
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
                                    CLOTHES
                                </a>
                            </h6>
                        </div>
                        <div id="clothes" class="panel-collapse collapse">
                            <div class="panel-default">
                                <ul class="nav nav-list" >
                                    <li><a href="<c:url value='subcategoryList?${4}'/>">Men </a></li>
                                    <li><a href="<c:url value='subcategoryList?${5}'/>">Women </a></li>
                                    <li><a href="<c:url value='subcategoryList?${6}'/>">Kids </a></li>
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
                                    SPORTSWEAR
                                </a>
                            </h6>
                        </div>
                        <div id="sportswear" class="panel-collapse collapse">
                            <div class="panel-default">
                                <ul class="nav nav-list" >
                                    <li><a href="<c:url value='subcategoryList?${7}'/>">Tracksuits </a></li>
                                    <li><a href="<c:url value='subcategoryList?${8}'/>">T-Shirt </a></li>
                                    <li><a href="<c:url value='subcategoryList?${9}'/>">Shorts </a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="panel-group category-products" id="accordian"><!--category-products-->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h6 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordian" href="#bags">
                                    <span class="badge pull-right"><b class="icon-plus"></b></span>
                                    BAGS
                                </a>
                            </h6>
                        </div>
                        <div id="bags" class="panel-collapse collapse">
                            <div class="panel-default">
                                <ul class="nav nav-list" >
                                    <li><a href="<c:url value='subcategoryList?${10}'/>">Luggages </a></li>
                                    <li><a href="<c:url value='subcategoryList?${11}'/>">Handbags </a></li>
                                    <li><a href="<c:url value='subcategoryList?${12}'/>">Laptop Bags </a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="panel-group category-products" id="accordian"><!--category-products-->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h6 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordian" href="#jewellery">
                                    <span class="badge pull-right"><b class="icon-plus"></b></span>
                                    JEWELLERY
                                </a>
                            </h6>
                        </div>
                        <div id="jewellery" class="panel-collapse collapse">
                            <div class="panel-default">
                                <ul class="nav nav-list" >
                                    <li><a href="<c:url value='subcategoryList?${13}'/>">Necklaces </a></li>
                                    <li><a href="<c:url value='subcategoryList?${14}'/>">Rings </a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="panel-group category-products" id="accordian"><!--category-products-->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h6 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordian" href="#watches">
                                    <span class="badge pull-right"><b class="icon-plus"></b></span>
                                    WATCHES
                                </a>
                            </h6>
                        </div>
                        <div id="watches" class="panel-collapse collapse">
                            <div class="panel-default">
                                <ul class="nav nav-list" >
                                    <li><a href="<c:url value='subcategoryList?${15}'/>">Sports </a></li>
                                    <li><a href="<c:url value='subcategoryList?${16}'/>">Luxuries </a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="panel-group category-products" id="accordian"><!--category-products-->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h6 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordian" href="#shoes">
                                    <span class="badge pull-right"><b class="icon-plus"></b></span>
                                    SHOES
                                </a>
                            </h6>
                        </div>
                        <div id="shoes" class="panel-collapse collapse">
                            <div class="panel-default">
                                <ul class="nav nav-list" >
                                    <li><a href="<c:url value='subcategoryList?${17}'/>">Formals </a></li>
                                    <li><a href="<c:url value='subcategoryList?${18}'/>">Casuals </a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>

        <br/>
        <div class="well well-small alert alert-warning cntr">
            <h2>30% Discount</h2>
            <p> 
                Only valid for online order. <br><br><a class="defaultBtn" href="#">Click here </a>
            </p>
        </div>

        <a class="shopBtn btn-block" href="#">Upcoming products <br><small>Click to view</small></a>
        <br>
        <br>
        <ul class="nav nav-list promowrapper">

            <li style="border:0"> &nbsp;</li>
            <li>
                <div class="thumbnail">
                    <a class="zoomTool" href="product_details.html" title="add to cart"><span class="icon-search"></span> QUICK VIEW</a>
                    <img src="img/shopping-cart-template.PNG" alt="shopping cart template">
                    <div class="caption">
                        <h4><a class="defaultBtn" href="product_details.html">VIEW</a> <span class="pull-right">�250.00</span></h4>
                    </div>
                </div>
            </li>
            <li style="border:0"> &nbsp;</li>

        </ul>

    </div>
    <div class="span9">
        <ul class="breadcrumb">
            <li><a href="index.jsp">Home</a> <span class="divider">/</span></li>
            <li><a href="<c:url value='gridView'/>">Items</a> <span class="divider">/</span></li>
            <li class="active">Preview</li>
        </ul>
        <!--    <section class="our_client">
                <table class="table table-bordered">
                        <tbody>
                            <tr class="breadcrumb">
                                <th>
                                <h4 class="title cntr"><span class="">${selectedProduct.name}</span></h4>
                            </th>
                            </tr>
                        </tbody>
                </table>
            </section> -->
        <div class="well well-small">
            <c:forEach var="product" items="${categoryProducts}">	
                <div class="row-fluid">	
                    <div class="span2">
                        <img src="${initParam.productImagePath}${product.name}.png"
                             alt="${product.name}">
                    </div>
                    <div class="span6">
                        <h5> ${product.name} </h5>
                        <p>
                            ${product.description}
                        </p>
                    </div>
                    <div class="span4 alignR">
                        <h5> Price: &pound; ${product.price}</h5>
                        <label>
                            <a href="<c:url value='itemView?${product.id}'/>" class="defaultBtn"> <span class="icon-search"> VIEW </span></a>
                        </label><br>
                        <div class="btn-group">
                            <form action="<c:url value='addToCart'/>" method="post">    
                                <input type="hidden" name="productId" value="${product.id}">
                                <button type="submit" id="myBtn" class="exclusive shopBtn" name="submit" ><span class="icon-shopping-cart"> Add to cart</span> </button>>
                            </form>
                        </div>	
                    </div>       
                </div>
                <hr class="soften">
            </c:forEach>
        </div>

        <div class="well well-small">
            <div class="row-fluid">
                <c:if test="${!empty itemSearch}">
                    <div class="span5">
                        <div id="myCarousel" class="carousel slide cntr">
                            <div class="carousel-inner">
                                <div class="item active">
                                    <img src="${initParam.productImagePath}${itemSearch.name}.png"
                                         alt="${product.name}" title="iPhone 7">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="span7">
                        <h3>${itemSearch.name}</h3>
                        <hr class="soft"/>
                        <form action="<c:url value='addToCart'/>" method="post" class="form-horizontal qtyFrm"> 
                            <div class="control-group">
                                <label class="control-label"><span>Price</span></label>
                                <div class="controls">
                                    <label class="control-label"><span>&pound; ${itemSearch.price}</span></label>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label"><span>Quantity</span></label>
                                <div class="controls">
                                    <input type="number" class="span6" placeholder="1" name="quantity">
                                </div>
                            </div>	
                            <div class="control-group">
                                <label class="control-label"><span>Brand</span></label>
                                <div class="controls">
                                    <select class="span11">
                                        <option>${itemSearch.brand}</option>

                                    </select>
                                </div>
                            </div>

                            <h4 style="color: green">In stock</h4>
                            <br>
                            <p>${itemSearch.description}</p>

                            <input type="hidden" name="productId" value="${itemSearch.id}">
                            <button type="submit" class="exclusive shopBtn" ><span class="icon-shopping-cart"> Add to cart</span> </button>
                        </form>

                    </div>

                </div>
                <hr class="softn clr"/>


                <ul id="productDetail" class="nav nav-tabs">
                    <li class="active"><a href="#home" data-toggle="tab">Product Details</a></li>
                    <li class=""><a href="#profile"  data-toggle="tab">Related Products </a></li>

                </ul>

                <div id="myTabContent" class="tab-content tabWrapper">
                    <div class="tab-pane fade active in" id="home">
                        <h4>Product Information</h4>
                        <table class="table table-striped">
                            <tbody>
                                <tr class="techSpecRow"><td class="techSpecTD1"><strong>Name:</strong></td><td class="techSpecTD2">${itemSearch.name}</td></tr>
                                <tr class="techSpecRow"><td class="techSpecTD1"><strong>Price:</strong></td><td class="techSpecTD2">&pound;${itemSearch.price}</td></tr>
                                <tr class="techSpecRow"><td class="techSpecTD1"><strong>Brand:</strong></td><td class="techSpecTD2">${itemSearch.brand}</td></tr>
                            </tbody>
                        </table>
                        <p> <strong> Description </strong></p>
                        <p>${itemSearch.description}</p>
                    </c:if>
                </div>
                <!--			<div class="tab-pane fade" id="profile">
                                        
                <c:forEach var="product" items="${subcategoryProducts}">	

                <div class="row-fluid">	  
                <div class="span2">
                        <img src="${initParam.productImagePath}${product.name}.png"
                 alt="${product.name}">
                </div>
                <div class="span6">
                        <h5>${product.name}</h5>
                        <p>
                    ${product.description}
                    </p>
            </div>
            <div class="span4 alignR">
            <form action="<c:url value='addToCart'/>" method="post" class="form-horizontal qtyFrm">    
               
            <h3> &pound; ${product.price}</h3>
            <label>
                <a href="<c:url value='itemView?${product.id}'/>" class="shopBtn"> <span class="icon-search"> VIEW </span></a>
            </label><br>
            <div class="btn-group">
              <input type="hidden" name="productId" value="${product.id}">
              <button type="submit" id="myBtn" class="defaultBtn" name="submit" ><span class="icon-shopping-cart"> Add to cart</span> </button>
              
             </div>
            </form>
            </div>
    </div>
        <hr class="soft">
                </c:forEach>
        </div>-->

            </div>

        </div>
    </div>
</div> <!-- Body wrapper -->
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