<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--header ở đaya--%>
<%@ include file="_admin-header.jsp" %>

<body>
<%--content--%>
<h2 style="margin: 0 auto">Quản lý tài khoản</h2>
<div class="container">
    <div class="row>
        <div class=" col-sm-12 tm-block-col
    ">
    <div class="tm-bg-primary-dark tm-block tm-block-products">
        <div class="tm-product-table-container">
            <table class="table table-hover tm-table-small tm-product-table">
                <thead>
                <tr>
                    <th scope="col">&nbsp;</th>
                    <th scope="col">Họ và tên</th>
                    <th scope="col">Tên đăng nhập</th>
                    <th scope="col">Ngày sinh</th>
                    <th scope="col">Public Key</th>
                    <th scope="col">Quyền quản trị viên</th>
                    <th scope="col">&nbsp;</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="item" items="${listU}">
                <tr>

                    <th scope="row"><input type="checkbox"/></th>
                    <td>${item.fullName}</td>
                    <td>${item.userName}</td>
                    <td>${item.birthday}</td>
                    <td>
                        <c:forEach var="key" items="${listK}">
                            <c:if test="${item.id == key.userId}">
                                <button onclick="showKey('${key.publicKey}')" class="btn btn-info"> Xem khóa    </button>

                            </c:if>

                        </c:forEach>

                    </td>

                    <c:if test="${item.isAdmin==1}">
                        <td><a class=" btn btn-success"> Quản trị viên</a></td>
                    </c:if>

                    <c:if test="${item.isAdmin==0}">
                        <td><a href="#" class="btn btn-dark"> Cấp quyền quản trị</a></td>
                    </c:if>

                    <td>
                        <c:if test="${item.id!=1}">
                            <a href="/usermanager/delete?uid=${item.id}" class="btn btn-danger">Xóa</a>


                        </c:if>
                    </td>

                </tr>
                </c:forEach>
            </table>
        </div>
        <!-- table container -->
        <a
                href="add-product.html"
                class="btn btn-primary btn-block text-uppercase mb-3">Add new product</a>
        <button class="btn btn-primary btn-block text-uppercase">
            Delete selected products
        </button>
    </div>
</div>

</div>
</div>
<script>
    function showKey(key){
        Swal.fire(
            'Public Key!',
            key,
        )
    }

</script>
</body>
<%@ include file="_admin-footer.jsp" %>
</html>

