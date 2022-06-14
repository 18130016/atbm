<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <meta charset="UTF-8">
    <title>Cùng mua sắm ngay nào - Danh sách sản phẩm</title>


</head>
<%--header ở đaya--%>
<%@ include file="_header.jsp" %>
<body>

<c:if test="${cartSize==0}">
    <section class="exclusive-deal-area">
        <div class="container-fluid">
            <div class="row justify-content-center align-items-center">
                <div class="col no-padding exclusive-left">
                    <div class="row clock_sec clockdiv" id="clockdiv">
                        <div class="col-lg-12">
                            <h1>Chưa có sản phẩm nào trong giỏ hàng!</h1>
                            <p> Các sản phẩm đang chờ bạn đấy. Đến và mua sản phẩm ngay nào !</p>
                        </div>

                    </div>
                    <a href="/danh-sach-san-pham" class="primary-btn">Xem ngay</a>
                </div>

            </div>
        </div>
    </section>
</c:if>
<c:if test="${cartSize!=0}">
    <section class="banner-area organic-breadcrumb">
        <div class="container">
            <div class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
                <div class="col-first">
                    <h1>Shopping Cart</h1>
                    <nav class="d-flex align-items-center">
                        <a href="index.html">Home<span class="lnr lnr-arrow-right"></span></a>
                        <a href="category.html">Cart</a>
                    </nav>
                </div>
            </div>
        </div>
    </section>
    <section class="cart_area">
        <div class="container">
            <div class="cart_inner">
                <div class="table-responsive">
                    <table class="table">
                        <thead>
                        <tr>
                            <th scope="col"></th>
                            <th scope="col">Sản phẩm</th>
                            <th scope="col">Giá</th>
                            <th scope="col">Số lượng</th>
                            <th scope="col">Tổng</th>
                            <th scope="col"></th>
                        </tr>
                        </thead>
                        <tbody>

                        <c:forEach items="${cartItems}" var="item">
                            <tr>
                                <td>
                                    <div class="media">
                                        <div class="media-body">
                                            <input type="checkbox" id="checkCart${item.id}" value="${item.id}" onclick="checkCartItem('checkCart${item.id}',${item.id})">
                                        </div>
                                    </div>
                                </td>

                                <td>
                                    <div class="media">
                                        <div class="d-flex">
                                            <img style="max-width: 100px;height: auto;"
                                                 src="/image/display/${item.product.id}" alt="">
                                        </div>
                                        <div class="media-body">
                                            <p>${item.product.name}</p>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <h5>${item.product.price} đ</h5>
                                </td>
                                <td>
                                    <div style="margin: 10px;display: flex">
                                        <button onclick="var result = document.getElementById('sst${item.id}'); var sst${item.id}  = result.value; if( !isNaN( sst${item.id} ) &amp;&amp; sst${item.id} > 1 ) result.value--;saveCart(${item.product.id},${item.product.price},'#total_price${item.id}',result.value);return false; "
                                                class="btn primary circle arrow" type="button"><i
                                                class="lnr ti-minus"></i></button>
                                        <input type="text" name="qty" id="sst${item.id}" maxlength="3"
                                               value="${item.quantity}" title="Quantity:"
                                               class="text-center" size="5">
                                        <button onclick="var result = document.getElementById('sst${item.id}'); var sst${item.id} = result.value; if( !isNaN( sst${item.id} )  )  result.value++;saveCart(${item.product.id},${item.product.price},'#total_price${item.id}',result.value);return false;"
                                                class=" btn primary circle arrow" type="button"><i
                                                class="lnr ti-plus"></i></button>


                                    </div>
                                </td>
                                <td>
                                    <h5 id="total_price${item.id}">${item.getSubtotal()} đ</h5>
                                </td>
                                <td>
                                    <a href="/cart/delete/${item.id}">
                                        <button class="btn">Xóa</button>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>



                        <tr class="bottom_button">
                            <td>
                                <a class="gray_btn" href="#">Update Cart</a>
                            </td>
                            <td>
                            <td>

                            </td>
                            <td>

                            </td>
                            </td>
                            <td>

                            </td>
                            <td>
                                <div class="cupon_text d-flex align-items-center">
                                    <input type="text" placeholder="Coupon Code">
                                    <a class="primary-btn" href="#">Apply</a>
                                    <a class="gray_btn" href="#">Close Coupon</a>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>

                            </td>
                            <td>

                            </td>
                            <td>

                            </td>
                            <td>

                            </td>
                            <td>
                                <h5>Subtotal</h5>
                            </td>
                            <td>
                                <h5>$2160.00</h5>
                            </td>
                        </tr>
                        <tr class="shipping_area">
                            <td>

                            </td>
                            <td>
                            <td>

                            </td>
                            <td>

                            </td>
                            </td>
                            <td>
                                <h5>Shipping</h5>
                            </td>
                            <td>
                                <div class="shipping_box">
                                    <ul class="list">
                                        <li><a href="#">Flat Rate: $5.00</a></li>
                                        <li><a href="#">Free Shipping</a></li>
                                        <li><a href="#">Flat Rate: $10.00</a></li>
                                        <li class="active"><a href="#">Local Delivery: $2.00</a></li>
                                    </ul>
                                    <h6>Calculate Shipping <i class="fa fa-caret-down" aria-hidden="true"></i></h6>
                                    <select class="shipping_select">
                                        <option value="1">Bangladesh</option>
                                        <option value="2">India</option>
                                        <option value="4">Pakistan</option>
                                    </select>
                                    <select class="shipping_select">
                                        <option value="1">Select a State</option>
                                        <option value="2">Select a State</option>
                                        <option value="4">Select a State</option>
                                    </select>
                                    <input type="text" placeholder="Postcode/Zipcode">
                                    <a class="gray_btn" href="#">Update Details</a>
                                </div>
                            </td>
                        </tr>
                        <tr class="out_button_area">
                            <td>

                            </td>
                            <td>

                            </td>
                            <td>

                            </td>
                            <td>
                                <div class="checkout_btn_inner d-flex align-items-center">
                                    <a class="gray_btn" href="#">Continue Shopping</a>
                                    <a class="primary-btn" href="#">Proceed to checkout</a>
                                </div>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </section>
</c:if>
<!--========
========End Cart Area =================-->
</body>
<%@ include file="_footer.jsp" %>
</html>

