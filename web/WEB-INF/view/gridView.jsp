<%-- 
    Document   : gridView
    Created on : 17-Jul-2017, 02:31:35
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
        <!--
         Featured Products
        -->
        <div class="well well-small">
            <h3> Featured Products</h3>
            <hr class="soften"/>
            <div class="row-fluid">
                <ul class="thumbnails">
                    <li class="span4">
                        <div class="thumbnail"> 
                            <img src="img/categories/SportwearTracksuit.png" alt="Laptop & Tablets" title="View Laptop & Tablets">
                            <div class="caption cntr">
                                <p>Sportswear Tracksuit</p>
                                <h4><a class="shopBtn" href="<c:url value='itemView?${20}'/>" title="Click to view Laptop & Tablets"><span class="icon-search"></span> QUICK VIEW </a></h4>

                                <br class="clr">
                            </div>
                        </div>
                    </li>
                    <li class="span4">
                        <div class="thumbnail"> 
                            <img src="img/products/Sneaker Shoes.png" alt="Shoes" title="View Shoes for casuals ">
                            <div class="caption cntr">
                                <p>Sneaker Shoes</p>
                                <h4><a class="shopBtn" href="<c:url value='itemView?${34}'/>" title="Click to view Sheos for casuals"><span class="icon-search"></span> QUICK VIEW </a></h4>

                                <br class="clr">
                            </div>
                        </div>
                    </li>
                    <li class="span4">
                        <div class="thumbnail"> 
                            <img src="img/products/Samsung Galaxy S8.png" alt="Electronics" title="View Electronics">
                            <div class="caption cntr">
                                <p>Samsung Galaxy S8</p>
                                <h4><a class="shopBtn" href="<c:url value='itemView?${8}'/>" title="Click to view electronics for mobiles"><span class="icon-search"></span> QUICK VIEW </a></h4>

                                <br class="clr">
                            </div>
                        </div>
                    </li>
                </ul>	
            </div>
            <div class="row-fluid">
                <ul class="thumbnails">
                    <li class="span4">
                        <div class="thumbnail"> 
                            <img src="img/products/Girls Floral Dress.png" alt="Clothes for Women" title="View Clothes for Women">
                            <div class="caption cntr">
                                <p>Girls Floral Dress</p>
                                <h4><a class="shopBtn" href="<c:url value='itemView?${13}'/>" title="Click to view clothes for women"><span class="icon-search"></span> QUICK VIEW </a></h4>

                                <br class="clr">
                            </div>
                        </div>
                    </li>
                    <li class="span4">
                        <div class="thumbnail"> 
                            <img src="img/products/Pretty Green Shirt.png" alt="Clothes" title="View Clothes for men">
                            <div class="caption cntr">
                                <p>Pretty Green Shirt</p>
                                <h4><a class="shopBtn" href="<c:url value='itemView?${10}'/>" title="Click to view clothes for men"><span class="icon-search"></span> QUICK VIEW </a></h4>

                                <br class="clr">
                            </div>
                        </div>
                    </li>
                    <li class="span4">
                        <div class="thumbnail"> 
                            <img src="img/categories/Fleece Jogger Short.png" alt="Kids" title="View clothes for kids">
                            <div class="caption cntr">
                                <p>Fleece Jogger Short</p>
                                <h4><a class="shopBtn" href="<c:url value='itemView?${15}'/>" title="Click to view clothes for kids"><span class="icon-search"></span> QUICK VIEW </a></h4>

                                <br class="clr">
                            </div>
                        </div>
                    </li>
                </ul>	
            </div>
            <div class="row-fluid">
                <ul class="thumbnails">
                    <li class="span4">
                        <div class="thumbnail"> 
                            <img src="img/products/Microsoft Surface Book.png" alt="Laptop & Tablets" title="View Laptop & Tablets">
                            <div class="caption cntr">
                                <p>Microsoft Surface Book</p>
                                <h4><a class="shopBtn" href="<c:url value='itemView?${5}'/>" title="Click to view Laptop & Tablets"><span class="icon-search"></span> QUICK VIEW </a></h4>

                                <br class="clr">
                            </div>
                        </div>
                    </li>
                    <li class="span4">
                        <div class="thumbnail"> 
                            <img src="img/products/Apple Watch Series 2.png" alt="Watches" title="View watches for sport">
                            <div class="caption cntr">
                                <p>Apple Watch Series 2</p>
                                <h4><a class="shopBtn" href="<c:url value='itemView?${29}'/>" title="Click to view watches for sports"><span class="icon-search"></span> QUICK VIEW </a></h4>

                                <br class="clr">
                            </div>
                        </div>
                    </li>
                    <li class="span4">
                        <div class="thumbnail"> 
                            <img src="img/products/Eminent Suitcase.png" alt="Bags" title="View Luggages">
                            <div class="caption cntr">
                                <p>Luggage</p>
                                <h4><a class="shopBtn" href="<c:url value='itemView?${21}'/>" title="Click to view Bags for Luggages"><span class="icon-search"></span> QUICK VIEW </a></h4>

                                <br class="clr">
                            </div>
                        </div>
                    </li>
                </ul>	
            </div>
            <div class="row-fluid">
                <ul class="thumbnails">
                    <li class="span4">
                        <div class="thumbnail"> 
                            <img src="img/products/Microsoft Surface Pro.png" alt="Mobiles" title="View electronics for mobiles">
                            <div class="caption cntr">
                                <p>Microsoft Surface Pro</p>
                                <h4><a class="shopBtn" href="<c:url value='itemView?${6}'/>" title="Click to view mobiles"><span class="icon-search"></span> QUICK VIEW </a></h4>

                                <br class="clr">
                            </div>
                        </div>
                    </li>
                    <li class="span4">
                        <div class="thumbnail"> 
                            <img src="img/categories/Laptop Bag.png" alt="Bags" title="View bags for laptop bags">
                            <div class="caption cntr">
                                <p>Laptop Bags</p>
                                <h4><a class="shopBtn" href="<c:url value='itemView?${23}'/>" title="Click to view bags for laptop bags"><span class="icon-search"></span> QUICK VIEW </a></h4>

                                <br class="clr">
                            </div>
                        </div>
                    </li>
                    <li class="span4">
                        <div class="thumbnail"> 
                            <img src="img/products/Training Shorts.png" alt="Sportswear" title="View Sportswear">
                            <div class="caption cntr">
                                <p>Training Shorts</p>
                                <h4><a class="shopBtn" href="<c:url value='itemView?${19}'/>" title="Click to view Sportswear for Shorts"><span class="icon-search"></span> QUICK VIEW </a></h4>

                                <br class="clr">
                            </div>
                        </div>
                    </li>
                </ul>	
            </div>
        </div> 

    </div> 
</div>

