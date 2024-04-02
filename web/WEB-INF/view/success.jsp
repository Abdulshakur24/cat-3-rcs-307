<%-- 
    Document   : success
    Created on : 03-Aug-2017, 23:48:40
    Author     : tomsol28
--%>
<%
    response.setHeader("Cache-Control", "no-cache, no-store,must revalidate");
//response.setHeader ("pragma","no-cache"); //HTTP 1.0
    response.setHeader("Expire", "0"); //proxies

//if(session.getAttribute("username")==null)
//response.sendRedirect("./user/login.jsp");
%>

<div class="breadcrumb well-small">
    <h3 style="text-align: center"> ACCOUNT CONFIRMATION</h3>
</div>
<div class="well well-small">
    <h4>WELCOME!<strong> ${user.username}</strong></h4>
    <hr class="soften"/>
    <p>
        <strong>You have been successfully registered and you can login now.</strong>
        <br><br>
        Please click to go into <a href="<c:url value='/user/login'/>">Login Account.</a>
        <br><br>
        Thank you for being member of the E-shopper!
    </p>
    <hr class="soften"/>
    <div class="row-fluid">  
        <div class="span7"> 
            <div class="breadcrumb">   
                <table class="table table-bordered table-striped">
                    <tr class="header">
                        <th colspan="3" style="text-align: center">Your Login Account Information</th>
                    </tr>
                    <tr>
                        <td >
                            <strong>User Name: </strong> ${user.username}
                            <br>
                            <strong>Password: </strong> ${user.password}
                            <br>
                            <hr class="soften">
                            <p> Keep it secure your login information. </p>
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
