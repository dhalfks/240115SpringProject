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
<c:set value="${bdto.bvo }" var="bvo"></c:set>
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
         
         <!-- file line -->
<c:set value="${bdto.flist }" var="flist"></c:set>
		<div class="col-12">
		<label for="f" class="form-label"></label>
			<ul class="list-group list-group-flush">
				<c:forEach items="${flist }" var="fvo">
					<li class="list-group-item">
						<c:choose>
							<c:when test="${fvo.fileType == 1 }">
								<div>
									<img alt="" src="/upload/${fvo.saveDir }/${fvo.uuid}_th_${fvo.fileName}">
								</div>
							</c:when>
							<c:otherwise>
								<div>
									<!-- 일반 파일 표시할 아이콘 -->
									<a href="/upload/${fvo.saveDir }/${fvo.uuid}_${fvo.fileName}" download="${fvo.fileName }">
										<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-journal-arrow-down" viewBox="0 0 16 16">
										  <path fill-rule="evenodd" d="M8 5a.5.5 0 0 1 .5.5v3.793l1.146-1.147a.5.5 0 0 1 .708.708l-2 2a.5.5 0 0 1-.708 0l-2-2a.5.5 0 1 1 .708-.708L7.5 9.293V5.5A.5.5 0 0 1 8 5z"/>
										  <path d="M3 0h10a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2v-1h1v1a1 1 0 0 0 1 1h10a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H3a1 1 0 0 0-1 1v1H1V2a2 2 0 0 1 2-2z"/>
										  <path d="M1 5v-.5a.5.5 0 0 1 1 0V5h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1H1zm0 3v-.5a.5.5 0 0 1 1 0V8h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1H1zm0 3v-.5a.5.5 0 0 1 1 0v.5h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1H1z"/>
										</svg>
									</a>
								</div>
							</c:otherwise>
						</c:choose>
						<div class="ms-2 me-auto">
							<div class="fw-bold">${fvo.fileName }</div>
							<span class="badge rounded-pill text-bg-primary">${fvo.fileSize }Byte</span>
						</div>
					</li>
				</c:forEach>
			</ul>
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
    
    <!-- 모달창 라인 -->
<div class="modal" id="myModal" tabindex="-1">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Writer</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div class="input-group mb-3">
        	<input type="text" class="form-control" id="cmtTextMod" >
        	<button type="button" class="btn btn-primary" id="cmtModBtn">Post</button>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
    
</div>
<script type="text/javascript">
let bnoVal = `<c:out value="${bdto.bvo.bno}" />`;
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