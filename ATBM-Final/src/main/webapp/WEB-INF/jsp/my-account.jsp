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
                        <a class="nav-link " id="account-nav" data-toggle="pill" href="#account-tab" role="tab"><i class="fa fa-user"></i>Thông tin tài khoản</a>
                        <a class="nav-link" id="orders-nav" data-toggle="pill" href="#orders-tab" role="tab"><i class="fa fa-shopping-bag"></i>Đơn hàng</a>
                        <a class="nav-link active" id="payment-nav" data-toggle="pill" href="#payment-tab" role="tab"><i class="fa fa-credit-card"></i>Chữ ký xác nhận</a>
                        <a class="nav-link" id="address-nav" data-toggle="pill" href="#address-tab" role="tab"><i class="fa fa-map-marker-alt"></i>Địa chỉ</a>
                        <a class="nav-link" href="/logout"><i class="fa fa-sign-out-alt"></i>Đăng xuất</a>
                    </div>
                </div>
                <div class="col-md-9">
                    <div class="tab-content">

                        <div class="tab-pane fade " id="account-tab" role="tabpanel" aria-labelledby="account-nav">
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
                        <div class="tab-pane fade show active" id="payment-tab" role="tabpanel" aria-labelledby="payment-nav">
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
                            <div class="row"style="height: 100px;">
                               <div class="col-md-8"><h4>Địa chỉ</h4></div>
                                <div class="col-md-4">
                                    <button class="genric-btn success arrow radius" data-toggle="modal" data-target="#exampleModalCenter">+ Thêm địa chỉ mới</button></div>


                                <!-- Modal -->
                                <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-centered" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLongTitle">Thêm địa chỉ</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <div class="col-md-12 form-group">
                                                    <input type="tel" class="form-control" id="phone" name="phone" placeholder="Số điện thoại">
                                                </div>
                                                <div class="col-md-12 form-group">
                                                    <input type="text" class="form-control" id="Province" name="province"
                                                           placeholder="Tỉnh/Thành phố">
                                                </div>
                                                <div class="col-md-12 form-group">
                                                    <input type="text" class="form-control" id="districts" name="districts"
                                                           placeholder="Quận/Huyện">
                                                </div>
                                                <div class="col-md-12 form-group">
                                                    <input type="text" class="form-control" id="wards" name="wards" placeholder="Phường/Xã">
                                                </div>
                                                <div class="col-md-12 form-group">
                                                    <input type="text" class="form-control" id="addressDetails" name="addressDetails"
                                                           placeholder="Địa chỉ cụ thể: VD: Số nhà, đường...">
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                                                <button type="button" class="btn btn-primary" onclick="addNewAddress()">Tạo mới</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>


                            <div class="row" id="addressCre" style="max-height: 300px;overflow-y: scroll">
<%--                                <div  id="addressCre"></div>--%>
                                <c:forEach var="iaddress" items="${listAddress}">

                                    <div  class="col-md-5" style=" margin:5px;padding: 10px;border: 1px solid #FF7856;
border-radius: 15px 10px 13px 10px;" >
                                        <h5>Địa chỉ giao hàng</h5>
                                        <p>${iaddress.wards}, ${iaddress.districts},  ${iaddress.province}</p>
                                        <p>Địa chỉ cụ thể: ${iaddress.addressDetails}</p>
                                        <p>Số điện thoại: ${iaddress.phone}</p>
                                        <button class="btn" onclick="deleteAddress(${iaddress.id})">Xóa</button>
                                    </div>
                                </c:forEach>


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