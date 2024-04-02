<%-- 
    Document   : index
    Created on : 02-Jun-2017, 03:10:19
    Author     : tomsol28
--%>
<div class="row">
    <div id="sidebar" class="span3">
        <div class="well well-small">
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
                                    <li><a href="<c:url value='subcategory?${3}'/>">Laptop & Tablets </a></li>
                                    <li><a href="<c:url value='subcategory?${2}'/>">Cameras </a></li>
                                    <li><a href="<c:url value='subcategory?${1}'/>">Mobile </a></li>
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
                                    <li><a href="<c:url value='subcategory?${4}'/>">Men </a></li>
                                    <li><a href="<c:url value='subcategory?${5}'/>">Women </a></li>
                                    <li><a href="<c:url value='subcategory?${6}'/>">Kids </a></li>
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
                                    <li><a href="<c:url value='subcategory?${7}'/>">Tracksuits </a></li>
                                    <li><a href="<c:url value='subcategory?${8}'/>">T-Shirt </a></li>
                                    <li><a href="<c:url value='subcategory?${9}'/>">Shorts </a></li>
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
                                    <li><a href="<c:url value='subcategory?${10}'/>">Luggages </a></li>
                                    <li><a href="<c:url value='subcategory?${11}'/>">Handbags </a></li>
                                    <li><a href="<c:url value='subcategory?${12}'/>">Laptop Bags </a></li>
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
                                    <li><a href="<c:url value='subcategory?${13}'/>">Necklaces </a></li>
                                    <li><a href="<c:url value='subcategory?${14}'/>">Rings </a></li>
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
                                    <li><a href="<c:url value='subcategory?${15}'/>">Sports </a></li>
                                    <li><a href="<c:url value='subcategory?${16}'/>">Luxuries </a></li>
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
                                    <li><a href="<c:url value='subcategory?${17}'/>">Formals </a></li>
                                    <li><a href="<c:url value='subcategory?${18}'/>">Casuals </a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
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

    </div>
    <div class="span9">
        <div class="well np">
            <div id="myCarousel" class="carousel slide homCar">
                <div class="carousel-inner">
                    <div class="item active">
                        <img style="width:100%" src="img/page_shop.png" alt="ecommerce templates">
                        <div class="carousel-caption">
                            <h4>Free E-commerce web application design</h4>
                            <p><span> Contains Retail Management and Customer Order Processing System</span></p>
                        </div>
                    </div>
                    <div class="item">
                        <img style="width:100%" src="img/carousel1.png" alt="ecommerce templates">
                        <div class="carousel-caption">
                            <h4> Using Java technologies</h4>
                            <p><span>Highly adaptable for e-commerce template</span></p>
                        </div>
                    </div>

                    <div class="item">
                        <img style="width:100%" src="img/templates.png" alt="bootstrap templates">
                        <div class="carousel-caption">
                            <h4> Bootstrap templates integration </h4>
                            <p><span>Very clean and simple to use </span></p>
                        </div>
                    </div>
                </div>
                <a class="left carousel-control" href="#myCarousel" data-slide="prev">&lsaquo;</a>
                <a class="right carousel-control" href="#myCarousel" data-slide="next">&rsaquo;</a>
            </div>
        </div>
        <!--
        New Products
        -->
        <div class="well well-small">
            <h3>New Products </h3>
            <hr class="soften"/>
            <div class="row-fluid">
                <div id="newProduct" class="carousel slide">
                    <div class="carousel-inner">
                        <div class="item active">
                            <ul class="thumbnails">
                                <li class="span3">
                                    <div class="thumbnail">
                                        <a class="zoomTool" href="<c:url value='category?${1}'/>" title="View Electronics"><span class="icon-search"></span> QUICK VIEW</a>
                                        <a href="#" class="tag"> <img src="img/new.png" alt=""></a>
                                        <a href="<c:url value='category?${1}'/>" title="View Electronics"><img src="img/categories/Electronics.png" alt="Electronics"></a>

                                    </div>
                                </li>
                                <li class="span3">
                                    <div class="thumbnail">
                                        <a class="zoomTool" href="<c:url value='category?${2}'/>" title="View Clothes"><span class="icon-search"></span> QUICK VIEW</a>
                                        <a href="#" class="tag"> <img src="img/new.png" alt=""></a>
                                        <a  href="<c:url value='category?${2}'/>" title="View Clothes"><img src="img/categories/Clothes.png" alt="Clothes"></a>
                                    </div>
                                </li>
                                <li class="span3">
                                    <div class="thumbnail">
                                        <a class="zoomTool" href="<c:url value='category?${6}'/>" title="View Watches"><span class="icon-search"></span> QUICK VIEW</a>
                                        <a href="#" class="tag"> <img src="img/new.png" alt=""></a>
                                        <a  href="<c:url value='category?${6}'/>" title="View Watches"><img src="img/categories/Watches.png" alt="Watches"></a>
                                    </div>
                                </li>
                                <li class="span3">
                                    <div class="thumbnail">
                                        <a class="zoomTool" href="<c:url value='category?${4}'/>" title="View Bags"><span class="icon-search"></span> QUICK VIEW</a>
                                        <a href="#" class="tag"> <img src="img/new.png" alt=""></a>
                                        <a  href="<c:url value='category?${4}'/>" title="View Bags"><img src="img/categories/Bags.png" alt="Bag"></a>
                                    </div>
                                </li>
                            </ul>
                        </div>
                        <div class="item">
                            <ul class="thumbnails">
                                <li class="span3">
                                    <div class="thumbnail">
                                        <a class="zoomTool" href="<c:url value='category?${5}'/>" title="view Jewellery"><span class="icon-search"></span> QUICK VIEW</a>
                                        <a href="#" class="tag"> <img src="img/new.png" alt=""></a>
                                        <a  href="<c:url value='category?${5}'/>" title="view Jewellery"><img src="img/categories/Jewellery.png" alt="Jewellery"></a>
                                    </div>
                                </li>
                                <li class="span3">
                                    <div class="thumbnail">
                                        <a class="zoomTool" href="<c:url value='category?${3}'/>" title="view sportwears"><span class="icon-search"></span> QUICK VIEW</a>
                                        <a href="#" class="tag"> <img src="img/new.png" alt=""></a>
                                        <a  href="<c:url value='category?${3}'/>" title="view sportwears"><img src="img/categories/sportswear3.png" alt="Sportwear"></a>
                                    </div>
                                </li>
                                <li class="span3">
                                    <div class="thumbnail">
                                        <a class="zoomTool" href="<c:url value='category?${5}'/>" title="View Jewellery"><span class="icon-search"></span> QUICK VIEW</a>
                                        <a href="#" class="tag"> <img src="img/new.png" alt=""></a>
                                        <a  href="<c:url value='category?${5}'/>" title="View Jewellery"><img src="img/categories/jewellery2.png" alt="jewellery"></a>
                                    </div>
                                </li>
                                <li class="span3">
                                    <div class="thumbnail">
                                        <a class="zoomTool" href="<c:url value='category?${7}'/>" title="view Shoes"><span class="icon-search"></span> QUICK VIEW</a>
                                        <a href="#" class="tag"> <img src="img/new.png" alt=""></a>
                                        <a  href="<c:url value='category?${7}'/>" title="view Shoes"><img src="img/categories/shoes2.png" alt="Shoes"></a>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <a class="left carousel-control" href="#newProduct" data-slide="prev">&lsaquo;</a>
                    <a class="right carousel-control" href="#newProduct" data-slide="next">&rsaquo;</a>
                </div>
            </div>

        </div>
        <!--
        Featured Products
        -->
        <div class="well well-small">
            <h3><a class="btn btn-mini pull-right" href="<c:url value='gridView'/>" title="View more">View More <span class="icon-plus"></span></a> Featured Products</h3>
            <hr class="soften"/>
            <div class="row-fluid">
                <ul class="thumbnails">
                    <li class="span4">
                        <div class="thumbnail"> 
                            <img src="img/categories/AppleMacBook.png" alt="Laptop & Tablets" title="View Laptop & Tablets">
                            <div class="caption cntr">
                                <p>Electronics</p>
                                <h4><a class="shopBtn" href="<c:url value='itemWithRelated?${3}'/>" title="Click to view Laptop & Tablets"><span class="icon-search"></span> QUICK VIEW </a></h4>

                                <br class="clr">
                            </div>
                        </div>
                    </li>
                    <li class="span4">
                        <div class="thumbnail"> 
                            <img src="img/categories/converse-shirt.png" alt="Sportswear" title="View Sportswear">
                            <div class="caption cntr">
                                <p>Men</p>
                                <h4><a class="shopBtn" href="<c:url value='itemWithRelated?${9}'/>" title="Click to view Sportswear"><span class="icon-search"></span> QUICK VIEW </a></h4>

                                <br class="clr">
                            </div>
                        </div>
                    </li>
                    <li class="span4">
                        <div class="thumbnail"> 
                            <img src="img/categories/Cameras.png" alt="Watches" title="View Watches">
                            <div class="caption cntr">
                                <p>Cameras</p>
                                <h4><a class="shopBtn" href="<c:url value='itemWithRelated?${2}'/>" title="Click to view Watches"><span class="icon-search"></span> QUICK VIEW </a></h4>

                                <br class="clr">
                            </div>
                        </div>
                    </li>
                </ul>	
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
