<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../layout/header.jsp" />
<jsp:include page="../layout/nav.jsp" />
<div class="container my-3">
<h4 class="mb-3">Input Your Information</h4>
	<form action="/member/login" method="post">
	<div class="mb-3">
	  <label for="e" class="form-label">email</label>
	  <input type="email" class="form-control" name="email" id="e" placeholder="example@OOO.com">
	</div>
	<div class="mb-3">
	  <label for="p" class="form-label">password</label>
	  <input type="password" class="form-control" name="pwd" id="p" placeholder="password">
	</div>
	
	<c:if test="${not empty param.errMsg }">
	<div class="mb-3 text-danger">
		<c:choose>
			<c:when test="${param.errMsg eq 'Bad credentials' }">
				<c:set value="이메일 & 비밀번호가 일치하지 않습니다." var="errText" ></c:set>
			</c:when>
			<c:otherwise>
				<c:set value="관리자에게 문의해주세요." var="errText" ></c:set>
			</c:otherwise>
		</c:choose>
		${errText }
	</div>
</c:if>
	
	<button type="submit" class="btn btn-dark">Login</button>
</form>



</div>

<jsp:include page="../layout/footer.jsp" />