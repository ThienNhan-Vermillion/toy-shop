<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">

<head>
  <jsp:include page="_meta.jsp"/>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/custom.css">
  <title>Đăng nhập</title>
</head>

<body>
<jsp:include page="_header.jsp"/>

<section class="section-content">
  <div class="card mx-auto card-custom-width">
    <div class="card-body">
      <h4 class="card-title mb-4">Đăng nhập</h4>
      <form action="${pageContext.request.contextPath}/signin" method="post">
        <input type="hidden" name="csrfToken" value="${sessionScope.csrfToken}" />

        <div class="mb-3">
          <input name="username"
                 class="form-control ${not empty requestScope.violations.usernameViolations
                   ? 'is-invalid' : (not empty requestScope.values.username ? 'is-valid' : '')}"
                 placeholder="Tên đăng nhập"
                 type="text"
                 autocomplete="off"
                 value="${requestScope.values.username}">
          <c:if test="${not empty requestScope.violations.usernameViolations}">
            <div class="invalid-feedback">
              <ul class="list-unstyled">
                <c:forEach var="violation" items="${requestScope.violations.usernameViolations}">
                  <li>${violation}</li>
                </c:forEach>
              </ul>
            </div>
          </c:if>
        </div>

        <div class="mb-3">
          <input name="password"
                 class="form-control ${not empty requestScope.violations.passwordViolations
                   ? 'is-invalid' : (not empty requestScope.values.password ? 'is-valid' : '')}"
                 placeholder="Mật khẩu"
                 type="password"
                 autocomplete="off"
                 value="${requestScope.values.password}">
          <c:if test="${not empty requestScope.violations.passwordViolations}">
            <div class="invalid-feedback">
              <ul class="list-unstyled">
                <c:forEach var="violation" items="${requestScope.violations.passwordViolations}">
                  <li>${violation}</li>
                </c:forEach>
              </ul>
            </div>
          </c:if>
        </div>

        <button type="submit" class="btn w-100 btn-login">Đăng nhập</button>
      </form>
    </div>
  </div>
  <p class="text-center mt-4">Không có tài khoản? <a href="${pageContext.request.contextPath}/signup">Đăng ký</a></p>
</section>

<jsp:include page="_footer.jsp"/>
</body>

</html>
