<%-- 
    Document   : category
    Created on : 27-Jun-2017, 17:14:48
    Author     : tomsol28
--%>

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
                        <li>
                            <c:choose>
                                <c:when test="${category.name == selectedCategory.name}">
                                <li class="active"> <a>
                                        <strong class="sr-only">(Current) ${category.name} </strong>
                                    </a> </li>

                            </c:when>
                            <c:otherwise>
                                <a href="<c:url value='category?${category.id}'/>">
                                    <h5><span>
                                            ${category.name}
                                        </span></h5>
                                </a>
                            </c:otherwise>
                        </c:choose>
                        </li>
                    </c:forEach>

                    <li style="border:0"> &nbsp;</li>

                </ul>
            </div>
        </div>

        <div class="well well-small alert alert-warning cntr">
            <h2>30% Discount</h2>
            <p> 
                Only valid for online order. <br><br><a class="defaultBtn" href="#">Click here </a>
            </p>
        </div>  
        <a class="shopBtn btn-block" href="#">Upcoming products <br><small>Click to view</small></a>
        <br>
        <br>

    </div>
    <div class="span9">
        <section class="our_client">
            <table class="table table-bordered">
                <tbody>
                    <tr class="breadcrumb">
                        <th>
                            <h4 class="title cntr"><span class="">${selectedCategory.name}</span></h4>
                        </th>
                    </tr>
                </tbody>
            </table>
        </section>   
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
<!--                        <label>
                            <a href="<c:url value='itemView?${product.id}'/>" class="defaultBtn"> <span class="icon-search"> VIEW </span></a>
                        </label>-->
                        <br>
                        <div class="btn-group">
                            <form action="<c:url value='addToCart'/>" method="post">    
                                <input type="hidden" name="productId" value="${product.id}">
                                <input type="submit" id="myBtn" class="exclusive shopBtn" name="submit" value="Add to cart" <span class="icon-shopping-cart"></span>>
                            </form>
                        </div>	
                    </div>       
                </div>
                <hr class="soften">
            </c:forEach>
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
