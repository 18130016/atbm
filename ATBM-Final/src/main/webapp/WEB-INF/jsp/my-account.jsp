<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<mvc:resources mapping="/resources/**" location="/resources/static/" />

<!DOCTYPE html>
<html lang="zxx" class="no-js">

<head>
    <!-- Mobile Specific Meta -->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Favicon-->
    <link rel="shortcut icon" href="img/fav.png">
    <!-- Author Meta -->
    <meta name="author" content="CodePixar">
    <!-- Meta Description -->
    <meta name="description" content="">
    <!-- Meta Keyword -->
    <meta name="keywords" content="">
    <!-- meta character set -->
    <meta charset="UTF-8">
    <!-- Site Title -->
    <title>Thông tin tài khoản</title>

</head>

<%@ include file="_header.jsp" %>
<body>


<!-- Start Banner Area -->
<section class="banner-area organic-breadcrumb">
    <div class="container">
        <div class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
            <div class="col-first">
                <h1>Trang thông tin tài khoản</h1>
                <nav class="d-flex align-items-center">
                    <a href="/">Trang chủ<span class="lnr lnr-arrow-right"></span></a>
                    <a href="/account">Tài khoản của tôi</a>
                </nav>
            </div>
        </div>
    </div>
</section>

<!-- My Account Start -->
<div class="container">

    <c:if test="${sessionScope.user == null}">
        <div  style="text-align: center">
            <h2>Vui lòng đăng nhập và thử lại!</h2>
            <a href="/login"><button>Đăng nhập</button></a>
        </div>
    </c:if>
    <c:if test="${user != null}">
    <div class="my-account">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-3">
                    <div class="nav flex-column nav-pills" role="tablist" aria-orientation="vertical">
                        <a class="nav-link active" id="account-nav" data-toggle="pill" href="#account-tab" role="tab"><i class="fa fa-user"></i>Thông tin tài khoản</a>
                        <a class="nav-link" id="orders-nav" data-toggle="pill" href="#orders-tab" role="tab"><i class="fa fa-shopping-bag"></i>Đơn hàng</a>
                        <a class="nav-link" id="payment-nav" data-toggle="pill" href="#payment-tab" role="tab"><i class="fa fa-credit-card"></i>Chữ ký xác nhận</a>
                        <a class="nav-link" id="address-nav" data-toggle="pill" href="#address-tab" role="tab"><i class="fa fa-map-marker-alt"></i>Địa chỉ</a>
                        <a class="nav-link" href="/logout"><i class="fa fa-sign-out-alt"></i>Đăng xuất</a>
                    </div>
                </div>
                <div class="col-md-9">
                    <div class="tab-content">

                        <div class="tab-pane fade show active" id="account-tab" role="tabpanel" aria-labelledby="account-nav">
                            <h4>Thông tin tài khoản</h4>
                            <div class="row">
                                <div class="col-md-12">
                                    <input class="form-control" type="text" value="Họ và tên: ${user.getFullName()}">
                                </div>
                                <div class="col-md-12">
                                    <input class="form-control" type="text" value="Tên đăng nhập: ${user.getUserName()}">
                                </div>
                                <div class="col-md-12">
                                    <input class="form-control" type="text" value="Ngày sinh: ${user.getBirthday()}">
                                </div>
                                <div class="col-md-12">
                                    <button class="btn">Thay đổi thông tin</button>
                                    <br><br>
                                </div>
                            </div>
                            <h4>Thay đổi mật khẩu</h4>
                            <div class="row">
                                <div class="col-md-12">
                                    <input class="form-control" type="password" placeholder="Current Password">
                                </div>
                                <div class="col-md-6">
                                    <input class="form-control" type="text" placeholder="New Password">
                                </div>
                                <div class="col-md-6">
                                    <input class="form-control" type="text" placeholder="Confirm Password">
                                </div>
                                <div class="col-md-12">
                                    <button class="btn">Lưu thay đổi</button>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="orders-tab" role="tabpanel" aria-labelledby="orders-nav">
                            <div class="table-responsive">
                                <table class="table table-bordered">
                                    <thead class="thead-dark">
                                    <tr>
                                        <th>No</th>
                                        <th>Product</th>
                                        <th>Date</th>
                                        <th>Price</th>
                                        <th>Status</th>
                                        <th>Action</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td>1</td>
                                        <td>Product Name</td>
                                        <td>01 Jan 2020</td>
                                        <td>$99</td>
                                        <td>Approved</td>
                                        <td><button class="btn">View</button></td>
                                    </tr>
                                    <tr>
                                        <td>2</td>
                                        <td>Product Name</td>
                                        <td>01 Jan 2020</td>
                                        <td>$99</td>
                                        <td>Approved</td>
                                        <td><button class="btn">View</button></td>
                                    </tr>
                                    <tr>
                                        <td>3</td>
                                        <td>Product Name</td>
                                        <td>01 Jan 2020</td>
                                        <td>$99</td>
                                        <td>Approved</td>
                                        <td><button class="btn">View</button></td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="payment-tab" role="tabpanel" aria-labelledby="payment-nav">
                            <h4>Chữ ký xác nhận</h4>
                            <div class="row">
                                <div class="col-md-8">
                                    <input id="privateKey" class="form-control" type="text">
                                </div>
                                <div class="col-md-4">
                                    <button class="btn" onclick="savePrivateKey()">Lưu file</button>
                                </div>
                                <div class="col-md-12">
                                    <button class="btn" onclick="createPrivateKey(${user.getId()})" >Tạo khóa bảo mật</button>
                                    <br><br>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="address-tab" role="tabpanel" aria-labelledby="address-nav">
                            <h4>Địa chỉ</h4>
                            <div class="row">
                                <div class="col-md-6">
                                    <h5>Payment Address</h5>
                                    <p>123 Payment Street, Los Angeles, CA</p>
                                    <p>Mobile: 012-345-6789</p>
                                    <button class="btn">Edit Address</button>
                                </div>
                                <div class="col-md-6">
                                    <h5>Shipping Address</h5>
                                    <p>123 Shipping Street, Los Angeles, CA</p>
                                    <p>Mobile: 012-345-6789</p>
                                    <button class="btn">Edit Address</button>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
    </c:if>
</div>
<!-- My Account End -->



</body>

<%@ include file="_footer.jsp" %>

</html>