<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../layout/header.jsp" />
<jsp:include page="../layout/nav.jsp" />
	
	<!-- email, pwd, nick_name -->
<div class="container my-3">
<h4 class="mb-3">Input Your Information</h4>
<form action="/member/register" method="post">
	<div class="mb-3">
	  <label for="e" class="form-label">email</label>
	  <input type="email" class="form-control" name="email" id="e" placeholder="example@OOO.com">
	</div>
	<div class="mb-3">
	  <label for="p" class="form-label">password</label>
	  <input type="password" class="form-control" name="pwd" id="p" placeholder="password">
	</div>
	<div class="mb-3">
	  <label for="n" class="form-label">nick_name</label>
	  <input type="text" class="form-control" name="nickName" id="n" placeholder="nickName">
	</div>
	<button type="submit" class="btn btn-dark">SignUp</button>
</form>
</div>
<jsp:include page="../layout/footer.jsp" />