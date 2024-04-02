<%-- 
    Document   : confirmation
    Created on : 27-Jun-2017, 17:46:59
    Author     : tomsol28
--%>

<!-- 
Body Section 
-->
<div class="breadcrumb well-small">
    <h3 style="text-align: center" class="page-header">CONFIRMATION</h3>
</div>
<div class="well well-small">
    <h4 class="page-header">Order Confirmation</h4>

    <hr class="soften"/>
    <p>
        <strong>Your order has been successfully processed and it will be delivered within 5 weekdays.</strong>
        <br><br>
        Please keep a note of your confirmation number:
        <strong> ${orderRecord.confirmationNumber}</strong>
        <br>
        If you have a query concerning your order, feel free to <a href="<c:url value='/contact'/>">Contact Us</a>.
        <br><br>
        Thank you for shopping at the E-shopper!
    </p>
    <hr class="soften"/>
    <div class="row-fluid">  

        <div class="span7">  
            <div class="breadcrumb">
                <table class="table table-bordered table-striped">
                    <tr class="tableHeading">
                        <th colspan="3" style="text-align: center">Order Summary</th>
                    </tr>
                    <tr>
                        <td><strong>Product</strong></td>
                        <td><strong>Quantity</strong></td>
                        <td><strong>Price</strong></td>
                    </tr>

                    <c:forEach var="orderedProduct" items="${orderedProducts}" varStatus="iter">

                        <tr class="${((iter.index % 2) != 0)}">
                            <td> ${products[iter.index].name}</td>
                            <td> ${orderedProduct.quantity} </td>
                            <td>  &pound; ${products[iter.index].price * orderedProduct.quantity} </td>
                        </tr>

                    </c:forEach>
                    <tr>
                        <td colspan="2" style="text-align: right"><strong>Delivery charge:</strong></td>
                        <td> <strong>&pound; ${initParam.deliveryCharge} </strong></td>
                    </tr>

                    <tr>
                        <td colspan="2" style="text-align: right"><strong>Total:</strong></td>
                        <td><strong>&pound; ${orderRecord.amount}</strong></td>
                    </tr>

                    <tr>
                        <td colspan="3"><strong>Date processed: </strong>
                            ${orderRecord.dateCreated}
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <div class="span5 relative">

            <div class="breadcrumb">   
                <table class="table table-bordered table-striped">
                    <tr class="header">
                        <th colspan="3" style="text-align: center">Delivery Address</th>
                    </tr>

                    <tr>
                        <td >
                            <strong>Full Name: </strong> ${customer.firstName} ${customer.lastName}
                            <br>
                            <strong>Address: </strong> ${customer.address}
                            <br>
                            <strong>City: </strong> ${customer.city}
                            <br>
                            <strong>Post Code: </strong> ${customer.postCode}
                            <br>
                            <hr class="soften">
                            <strong>Email: </strong> ${customer.email}
                            <br>
                            <strong>Phone: </strong> ${customer.phone}
                        </td>
                    </tr>
                </table>
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
