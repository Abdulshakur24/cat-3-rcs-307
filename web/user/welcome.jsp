<%-- 
    Document   : welcome
    Created on : 30-Jun-2017, 03:15:31
    Author     : tomsol28
--%>
<%
    response.setHeader("Cache-Control", "no-cache, no-store,must revalidate");
    response.setHeader("pragma", "no-cache"); //HTTP 1.0
//response.setHeader("Expire","0"); //proxies

    if (session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
    }

%>
<div class="row">
    <div id="sidebar" class="span3">
        <div class="well well-small">
            <ul class="nav nav-list" >
                <li class="nav-header"><h5>PERSONAL ACCOUNT</h5></li>
                <li class="active"><a href="<c:url value='/gridView'/>">YOUR ACCOUNT <span class="sr-only">(Current)</span></a></a></li>
                <li class=""><a href="<c:url value='/gridView'/>">PERSONAL INFORMATION</a></li>
                <li class=""><a href="<c:url value='/gridView'/>">ORDER HISTORY</a></li>

            </ul> 
        </div>

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
                                    <li><a href="<c:url value='../subcategory?${3}'/>">Laptop & Tablets </a></li>
                                    <li><a href="<c:url value='../subcategory?${2}'/>">Cameras </a></li>
                                    <li><a href="<c:url value='../subcategory?${1}'/>">Mobile </a></li>
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
                                    <li><a href="<c:url value='../subcategory?${4}'/>">Men </a></li>
                                    <li><a href="<c:url value='../subcategory?${5}'/>">Women </a></li>
                                    <li><a href="<c:url value='../subcategory?${6}'/>">Kids </a></li>
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
                                    <li><a href="<c:url value='../subcategory?${7}'/>">Tracksuits </a></li>
                                    <li><a href="<c:url value='../subcategory?${8}'/>">T-Shirt </a></li>
                                    <li><a href="<c:url value='../subcategory?${9}'/>">Shorts </a></li>
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
                                    <li><a href="<c:url value='../subcategory?${10}'/>">Luggages </a></li>
                                    <li><a href="<c:url value='../subcategory?${11}'/>">Handbags </a></li>
                                    <li><a href="<c:url value='../subcategory?${12}'/>">Laptop Bags </a></li>
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
                                    <li><a href="<c:url value='../subcategory?${13}'/>">Necklaces </a></li>
                                    <li><a href="<c:url value='../subcategory?${14}'/>">Rings </a></li>
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
                                    <li><a href="<c:url value='../subcategory?${15}'/>">Sports </a></li>
                                    <li><a href="<c:url value='../subcategory?${16}'/>">Luxuries </a></li>
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
                                    <li><a href="<c:url value='../subcategory?${17}'/>">Formals </a></li>
                                    <li><a href="<c:url value='../subcategory?${18}'/>">Casuals </a></li>
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

    </div>
    <div class="span9">
        <div class="well well-small">
            <h3 class="page-header"><a class="btn btn-mini pull-right" href="<c:url value='logout'/>" title="Click to Logout"> Logout <span class="icon-user"></span></a> WELCOME! ${username} </h3>

        </div>
    </div>
</div>

