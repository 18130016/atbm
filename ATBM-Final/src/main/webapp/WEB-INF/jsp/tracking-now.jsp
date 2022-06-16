<!-- Start Banner Area -->

<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<head>
    <meta charset="UTF-8">
    <title>Cùng mua sắm ngay nào - Danh sách sản phẩm</title>


</head>
<%--header ở đaya--%>
<%@ include file="_header.jsp" %>
<body>
<section class="banner-area organic-breadcrumb">
    <div class="container">
        <div class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
            <div class="col-first">
                <h1>Order Tracking</h1>
                <nav class="d-flex align-items-center">
                    <a href="index.html">Home<span class="lnr lnr-arrow-right"></span></a>
                    <a href="category.html">Fashon Category</a>
                </nav>
            </div>
        </div>
    </div>
</section>
<!-- End Banner Area -->

<!--================Tracking Box Area =================-->
<section class="tracking_box_area section_gap">
    <div class="container">
        <div class="tracking_box_inner">
            <p>To track your order please enter your Order ID in the box below and press the "Track" button. This
                was given to you on your receipt and in the confirmation email you should have received.</p>
            <form class="row tracking_form" action="#" method="post" novalidate="novalidate">
                <div class="col-md-12 form-group">
                    <input type="text" class="form-control" id="order" name="order" placeholder="Order ID" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Order ID'">
                </div>
                <div class="col-md-12 form-group">
                    <input type="email" class="form-control" id="email" name="email" placeholder="Billing Email Address" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Billing Email Address'">
                </div>
                <div class="col-md-12 form-group">
                    <button type="submit" value="submit" class="primary-btn">Track Order</button>
                </div>
            </form>
        </div>

       <a href="#" onclick="alertNoti('info','Nó nè:',' CODE: ${codeoder}')">Code ở đây này</a>
    </div>
</section>

<!--================End Tracking Box Area =================-->
</body>
<%@ include file="_footer.jsp" %>
</html>

