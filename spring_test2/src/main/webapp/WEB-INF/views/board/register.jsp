<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<jsp:include page="../layout/header.jsp" />
<jsp:include page="../layout/nav.jsp" />


<div class="container">
<sec:authentication property="principal.mvo.email" var="authEmail"/>
<form action="/board/register" method="post" enctype="multipart/form-data">
	<div class="mb-3">
	  <label for="t" class="form-label">title</label>
	  <input type="text" class="form-control" name="title" id="t" placeholder="title">
	</div>
	<div class="mb-3">
	  <label for="w" class="form-label">writer</label>
	  <input type="text" class="form-control" name="writer" value="${authEmail }" id="w" placeholder="writer">
	</div>
	<div class="mb-3">
	  <label for="c" class="form-label">Content</label>
	  <textarea class="form-control" name="content" id="c" rows="3"></textarea>
	</div>

	<div class="mb-3">
	  <input type="file" class="form-control" name="files" id="files" style="display:none;" multiple="multiple">
	  <!-- 파일 버튼 트리거 사용하기 위해서 주는 버튼 -->
	  <button type="button" id="trigger" class="btn btn-outline-primary">File Upload</button>
	</div>
		<!-- 첨부파일 표시될 영역 -->
	<div class="mb-3" id="fileZone">
	
	</div>
	<button type="submit" class="btn btn-dark" id="regBtn">등록</button>
</form>
</div>
<script src="/resources/js/boardRegister.js"></script>
<jsp:include page="../layout/footer.jsp" />
</body>
</html>