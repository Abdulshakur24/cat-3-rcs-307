<%-- 
    Document   : cart
    Created on : 27-Jun-2017, 17:15:24
    Author     : tomsol28
--%>

<!-- 
Body Section 
-->
<div class="row">
    <div class="span12">
        <ul class="breadcrumb">
            <!--li><a href="index.jsp">Home</a> <span class="divider">/</span></li-->
            <li class="active">Shopping Cart</li>
        </ul>
        <div class="well well-small">
            <h3> Shopping Cart <small class="pull-right"> 
                    <c:choose>
                        <c:when test="${cart.numberOfItems > 1}">
                            <p> Your shopping cart contains ${cart.numberOfItems} items.</p>
                        </c:when>
                        <c:when test="${cart.numberOfItems == 1}">
                            <p> Your shopping cart contains ${cart.numberOfItems} item.</p>
                        </c:when>
                        <c:otherwise>
                            <p> Your shopping cart is empty.</p>
                        </c:otherwise>
                    </c:choose> 
                </small></h3>
            <hr class="soften"/>

            <%-- continue shopping widget --%>
            <c:set var="value">
                <c:choose>
                    <%-- if 'selectedCategory' session object exists, send user to previously viewed category --%>
                    <c:when test="${!empty selectedCategory}">
                        category
                    </c:when>
                    <%-- otherwise send user to welcome page --%>
                    <c:otherwise>
                        index.jsp
                    </c:otherwise>
                </c:choose>
            </c:set>
            <c:url var="url" value="${value}"/>           
            <a href="${url}" class="shopBtn btn-large"><span class="icon-arrow-left"></span> Continue Shopping </a>

            <%-- clear cart widget --%>
            <c:if test="${!empty cart && cart.numberOfItems != 0}">
                <c:url var="url" value="viewCart">
                    <c:param name="clear" value="true"/>
                </c:url>
                <a href="${url}" style="margin: 0 0 0 220px;" class="btn btn-default"> Clear Cart <span class="icon-remove-sign"></span></a>
                </c:if>

            <%-- checkout widget --%>
            <c:if test="${!empty cart && cart.numberOfItems != 0}">
                <a href="<c:url value='checkout'/>" class="shopBtn btn-large pull-right"> Proceed to checkout <span class="icon-arrow-right"></span></a>
                </c:if>

            <hr class="soften"/>

            <c:if test="${!empty cart && cart.numberOfItems != 0}">

                <table class="table table-bordered table-striped">
                    <thead>
                        <tr class="techSpecRow">
                            <th>Product</th>
                            <th>Name</th>
                            <th>Unit Price</th>
                            <th>Quantity </th>
                            <th>Total </th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="cartItem" items="${cart.items}">

                            <c:set var="product" value="${cartItem.product}"/>

                            <tr class="techSpecRow">
                                <td class="techSpecTD2"><div class="span2"><img src="${initParam.productImagePath}${product.name}.png"
                                                                                alt="${product.name}"></div></td>
                                <td class="techSpecTD2">${product.name}</td>
                                <td class="techSpecTD2"> &pound; ${product.price} </td>
                                <td class="techSpecTD2">
                                    <form action="updateCart" method="post">
                                        <div class="input-append">  
                                            <input type="hidden"
                                                   name="productId"
                                                   value="${product.id}">
                                            <input class="span2" type="number"
                                                   style="max-width:34px"
                                                   value="${cartItem.quantity}"
                                                   size="2"
                                                   name="quantity">
                                            <input type="submit"
                                                   name="submit"
                                                   class="btn btn-danger"
                                                   value="Update">
                                        </div> 
                                    </form>
                                </td>
                                <td class="techSpecTD2"> &pound; ${cartItem.total}</td>
                            </tr>

                        </c:forEach> 

                        <tr class="techSpecRow">
                            <td colspan="4" style="text-align:right"> <h5>Subtotal Products:</h5> </td>

                            <td> <h5> &pound; ${cart.subtotal}</h5></td>
                        </tr>
                    </tbody>
                </table> 

            </c:if>
            <br/> 
        </div>
    </div>
</div>

