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
            <p>Nhập mã xác nhận để xác nhận đơn hàng</p>
            <div class="tracking_form row">
                <div class="col-md-9 form-group">
                    <input type="text" class="form-control" id="code-order"  value="${codeoder}" disabled>
                </div>
                <div class="col-md-3 form-group">
                    <button  onclick="copyCodeOrder()" class="primary-btn">Sao chép</button>
                </div>

                <div class="col-md-12 form-group">
                    <input type="text" class="form-control" id="decodeText" placeholder="Billing Email Address" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Mã xác nhận'">
                </div>
                <div class="col-md-3 form-group">
                    <button onclick="checkCodeOrder(${sessionScope.user.id})" class="primary-btn">Xác nhận đơn hàng</button>
                </div>
            </div>
        </div>

    </div>
</section>

<!--================End Tracking Box Area =================-->
</body>
<%@ include file="_footer.jsp" %>
</html>

