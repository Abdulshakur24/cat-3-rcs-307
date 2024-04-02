<%-- 
    Document   : AddSubcategory
    Created on : 20-Jul-2017, 02:41:55
    Author     : tomsol28
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
function getConfirmation(){
    
    'use strict';
    //Get reference to the form elements:
     var okay = confirm('Are you sure you want to add this data?');
    // var name = '';
     
    if (okay){
         return true;    
    }else {
      return false;
    }
    
}

function int(){
    'use strict';
    
  //confirm that document.getElementById() can be used
  if (document && document.getElementById){
      var addForm = document.getElementById('addForm');
      addForm.onsubmit = getConfirmation;
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
           <li><a href="<c:url value='viewCustomers'/>">VIEW ALL CUSTOMERS</a></li>
            <li><a href="<c:url value='viewOrders'/>">VIEW ALL ORDERS</a></li>
            <li><a href="<c:url value='viewUsers'/>">VIEW USER ACCOUNTS</a></li>
            <li style="border:0"> &nbsp;</li>
            <li style="border:0"> &nbsp;</li>
        </ul>
            
            <ul class="nav nav-list">
              <li class="nav-header"><h5>VIEW PRODUCT</h5></li>
             <hr class="soften"/>
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
        <h5 class="page-header"> <a class="btn btn-mini pull-right" href="<c:url value='logout'/>" title="Click to Logout"> Logout <span class="icon-user"></span></a>SUBCATEGORY MANAGEMENT</h5>

       <h5 class="page-header"> ADD SUBCATEGORY INFORMATION</h5>
       
       <p align="center"> Please enter subcategory's name to add into database.</p>
        
        <form id="addForm" action="<c:url value='AddSubcategory'/>" method="POST" class="form-horizontal" onsubmit="return getConfirmation()">

        <hr class="soft"/>

          <c:if test="${!empty validationCateErrorFlag}">
            
                <p style="text-align:center" >
                    <span class="text" style="color:#cc0000"><fmt:message key="validationCateErrorFlag"/>
                </p>
           <hr class="soft"/>
          </c:if>
           
                <div class="control-group">
                 <label class="control-label" for="name"> Name: </label>
		
                 <div class="controls">
                    
                     <input type="text" name="name" value="${subcategory.name}"  placeholder=" Enter subcategory name" required/>
		
                 <c:if test="${!empty nameError}">
                    <label for="name" style="color:#cc0000"><fmt:message key="nameError"/> </label>
                 </c:if>
                </div>
                </div>
                <div class="control-group">
                    <div class="controls">
                         <button type="submit" id="submit" name="action" value="Add" class="btn btn-warning"/>Add <i class="icon-save"></i></button>
                        <input type="reset" value="Clear" class="btn btn-default"/> 
                    </div>
                        
                </div>

        </form>        

                <hr class="softn clr"/>
        </div>

</div>
</div>
