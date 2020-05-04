<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="ko">

<head>

	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">
	<meta name="author" content="">
	
	<title>코로나 119 - 신종 코로나 바이러스 종합 정보 포털</title>
	
	<!-- Bootstrap core CSS -->
	<link href="/corona/resources/vendor/bootstrap/css/bootstrap.min.css"
		  rel="stylesheet">
	
	<!-- Custom styles for this template -->
	<link href="/corona/resources/css/simple-sidebar.css" 
		  rel="stylesheet">
	
	<!-- Custom styles for this template -->
	<link href="/corona/resources/css/sb-admin-2.min.css"
		  rel="stylesheet">
	
	<!-- Custom styles for this page -->
	<link href="/corona/resources/datatables/dataTables.bootstrap4.min.css"
		  rel="stylesheet">

</head>

<body>

	<div class="d-flex" id="wrapper">

		<jsp:include page="/WEB-INF/views/sidebar.jsp" />

		<!-- Page Content -->
		<div id="page-content-wrapper">

			<jsp:include page="/WEB-INF/views/topbar.jsp" />

			<div class="container-fluid">

				<!-- Page Heading -->
				<br />
				<h1 class="h4 m-0 font-weight-normal text-gray-600">뉴스 & 이슈</h1>
				<br />
          
				<div class="card shadow mb-4">
				  <div class="card-header bg-white py-2">
				    <p class="m-0 font-weight-bold text-primary">${ndtl.member.memberNickname}</p>
				    <p class="m-0 font-weight-normal text-gray-600">
				    	<fmt:formatDate value="${ndtl.boardRegdate}" pattern="yyyy-MM-dd HH:mm:ss" />
				    </p>
				  </div>
				  <div class="card-header bg-white py-3">
				    <p class="m-0 font-weight-normal text-gray-700">
				    	#${ndtl.boardNo}&nbsp; <button id="tag-button" type="button" class="btn btn-sm btn-info">${ndtl.boardTag}</button>
				    	<h3></h3>
				    	<h1 class="h3 mb-2 font-weight-normal text-dark">${ndtl.boardTitle}</h1>
				    </p>
				  </div>
				  <div class="card-body font-weight-light text-dark">
					${ndtl.boardContent}
				  </div>
				  <div class="card-body">
				  	<c:if test="${ loginuser.memberNo == ndtl.member.memberNo }">
					<button id="update" class="btn btn-success" type="button">수정</button>
					<button id="delete" class="btn btn-success" type="button">삭제</button>
					</c:if>
					<button id="tolist" class="btn btn-success" type="button">목록</button>
				  </div>
				</div>

			</div>
		</div>

		<!-- /#page-content-wrapper -->

	</div>
	<!-- /#wrapper -->

	<!-- Bootstrap core JavaScript -->
	<script src="/corona/resources/vendor/jquery/jquery.min.js"></script>
	<script
		src="/corona/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.4.1.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="/corona/resources/datatables/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="/corona/resources/datatables/sb-admin-2.min.js"></script>

	<!-- Page level plugins -->
	<script src="/corona/resources/datatables/jquery.dataTables.min.js"></script>
	<script src="/corona/resources/datatables/dataTables.bootstrap4.min.js"></script>

	<!-- Page level custom scripts -->
	<script src="/corona/resources/datatables/datatables-demo.js"></script>
	<script src="/corona/resources/js/common.js"></script>
	
	<!-- Menu Toggle Script -->
	<script>
		$("#menu-toggle").click(function(e) {
			e.preventDefault();
			$("#wrapper").toggleClass("toggled");
			if ($("#wrapper").hasClass("toggled")) {
				$("#menu-toggle").html("메뉴 열기");
			} else {
				$("#menu-toggle").html("메뉴 닫기");
			}
		});
	</script>
	<script type="text/javascript">
	$(function(){
		$('#update').on('click', function(){
			location.href = "update?bno=${ ndtl.boardNo }";
			});
		$('#delete').on('click', function(){
			var check = confirm("정말 삭제 하시겠습니까?")
			if(check){
				location.href = "delete?bno=${ ndtl.boardNo }";
				};
			});
		$('#tolist').on('click', function(){
			location.href = "list";
			});
		});
	</script>

</body>

</html>