<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../layout/header.jsp" />
<jsp:include page="../layout/nav.jsp" />

<!-- 게시글상세정보란 시작 -->

<div class="container my-3">
   <div class="col-md-7 col-lg-8">
     <h4 class="mb-3">Board information</h4>
       <div class="row g-3">

         <div class="col-12">
           <label for="email" class="form-label">Writer</label>
           <div class="input-group has-validation">
             <span class="input-group-text">@</span>
             <input type="email" class="form-control" name="writer"
             id="writer" value="${bvo.writer }" readonly>              
           </div>
         </div>
         
         <div class="col-12">
           <label for="regAt" class="form-label">Reg At</label>
           <input type="text" class="form-control" value="${bvo.regAt }" readOnly>              
         </div>
         <div class="col-12">
           <label for="modAt" class="form-label">Mod At</label>
           <input type="text" class="form-control" value="${bvo.modAt }" readOnly>              
         </div>
         <div class="col-12">
           <label for="readCount" class="form-label">Read Count</label>
           <input type="text" class="form-control" value="${bvo.readCount }" readOnly>              
         </div>
         <div class="col-12">
           <label for="title" class="form-label">Title</label>
           <input type="text" class="form-control" name="title"
            id="title" placeholder="Title" value="${bvo.title }" readOnly>              
         </div>

         <div class="col-12">
           <label for="cont" class="form-label">Content</label>
           <textarea class="form-control" name="content" readOnly
            id="cont" placeholder="Content">${bvo.content }</textarea>              
         </div>
         

 	   	<a href="/board/modify?bno=${bvo.bno }" id="modBtn" class="btn btn-outline-warning">MOD</a>
 	   	<a href="/board/remove?bno=${bvo.bno }" id="delBtn" class="btn btn-outline-danger">DEL</a>
 	   	<a href="/board/list"  class="btn btn-outline-info">LIST</a>

     </div>
   </div>
   <br>
   <hr>
   <br>
   
   <!-- 댓글 등록 라인 -->
   <div class="input-group mb-3">
	  <span class="input-group-text" id="cmtWriter">${bvo.writer }</span>
	  <input type="text" class="form-control" id="cmtText" aria-label="Amount (to the nearest dollar)">
	  <button type="button" class="btn btn-success" id="cmtPostBtn">Post</button>
	</div>
   
   <!-- 댓글 표시 라인 -->
   <ul class="list-group list-group-flush" id="cmtListArea">
	  <li class="list-group-item">
	  	<div class="mb-3">
	  		<div class="fw-bold">Writer</div>
	  		content
	  	</div>
	  	<span class="badge rounded-pill text-bg-warning">modAt</span>
	  </li>
	</ul>
	
	<!-- 댓글 더보기 버튼 -->
	<div>
		<button type="button" id="moreBtn" data-page="1" class="btn btn-outline-dark" style="visibility:hidden">MORE+</button>
	</div>
    
</div>
<script type="text/javascript">
let bnoVal = `<c:out value="${bvo.bno}" />`;
console.log(bnoVal);
</script>

<script src="/resources/js/boardComment.js" ></script>
<script type="text/javascript">
spreadCommentList(bnoVal);
</script>
<jsp:include page="../layout/footer.jsp" />
</body>
</body>
</html>