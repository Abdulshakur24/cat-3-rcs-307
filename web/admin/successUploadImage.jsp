<%-- 
    Document   : resultUploadImage
    Created on : 19-Aug-2017, 01:36:30
    Author     : tomsol28
--%>

<div class="row">

    <div class="span12">	
        <div class="wel breadcrumb">
            <h4 class="page-header"> <a class="btn btn-mini pull-right" href="<c:url value='logout'/>" title="Click to Logout"> Logout <span class="icon-user"></span></a> UPLOAD IMAGE CONFIRMATION</h4>

            <table class="table table-bordered table-striped">
                <tr class="header">
                    <th colspan="3" style="text-align: center"> Uploading Image to folder</th>
                </tr>
                <tr>
                    <td>
                        <h3 style="color:#cc0000;text-align:center">${requestScope["message"]}</h3>
                    </td>
                </tr>
            </table>
            <br><br><br>
            <table class="table table-responsive">
                <tr>
                    <td colspan="4">

                        <a href="<c:url value='EDproducts'/>" class="shopBtn btn-large pull-right">
                            <strong> Edit/Delete Product Summary </strong> <span class="icon-arrow-right"></span> </a>
                        <a href="<c:url value='AddProduct.jsp'/>" class="shopBtn btn-large pull-left">
                            <span class="icon-arrow-left"></span><strong> Add Product </strong> </a>

                    </td>
                </tr>
            </table>
        </div>

    </div>
</div>
