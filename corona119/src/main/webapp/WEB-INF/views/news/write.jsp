<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>코로나 119 - 신종 코로나 바이러스 종합 정보 포털</title>

<!-- Bootstrap core CSS -->
<link href="/corona/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="/corona/resources/css/simple-sidebar.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="/corona/resources/css/sb-admin-2.min.css" rel="stylesheet">

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
				<h1 class="h3 mb-2 text-gray-800">뉴스 & 이슈</h1>
				<br />
          
				<div class="card shadow mb-4">
				  <div class="card-header py-3">
				    <span class="m-0 font-weight-bold text-primary">글 쓰기</span>
				  </div>
				  <div class="card-body">
				     <form id="write-form" role="form" action="/corona/news/write" method="post" accept-charset="utf-8">
				     <!-- enctype="multipart/form-data" -->
					  <div class="form-group">
					    <label>제목</label> 
					    <input class="form-control" id='boardTitle' name='boardTitle'>
					  </div>
					  
					  <div class="form-group">
					    <label>태그</label> 
					    <input class="form-control" id='boardTag' name='boardTag'>
					  </div>
					
					  <div class="form-group">
					    <label>내용</label>
					    <textarea class="form-control" id='newsContent' name='boardContent' rows="10" cols="100"></textarea>
					  </div>
					  
						<input name="memberNo" type="hidden" value="${ loginuser.memberNo }">
						<input name="catNo" type="hidden" value="0">
					  
					  <button id="cancel-button" type="button" class="btn btn-success">취소</button>
					  <button id="write-button" class="btn btn-success">등록</button>
					</form>
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
	
	
	<!-- Smart Editor -->
	<script type="text/javascript" src="/corona/resources/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>

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

		$(function() {

			var oEditors = [];
			
			nhn.husky.EZCreator.createInIFrame({
				
				oAppRef: oEditors,
				elPlaceHolder: "newsContent",
				sSkinURI: "/corona/resources/smarteditor/SmartEditor2Skin.html",
				htParams : {
				          // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
				          bUseToolbar : true,             
				          // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
				          bUseVerticalResizer : true,     
				          // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
				          bUseModeChanger : true, 
				          }
			});
			
			$('#cancel-button').on('click', function(event) {
				location.href = "/corona/news/list";
			});

			$('#write-button').on('click', function(event) {
				//1. 유효성 검사
				if ($('#boardTitle').val() == '') {
					alert('제목을 입력하세요');
					$('#boardTitle').focus();
					return;
				}
				
				oEditors.getById["newsContent"].exec("UPDATE_CONTENTS_FIELD", []);
		        
				/* if ($('#newsContent').val() == '') {
					alert('내용을 입력하세요');
					$('#newsContent').focus();
					return;
				} */

				//2. 오류가 없다면 서버로 전송
				$('#write-form').submit();
			});
		});
		
	</script>

</body>

</html>