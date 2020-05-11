<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="ko">

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>코로나 119 - 신종 코로나 바이러스 종합 정보 포털</title>

	<jsp:include page="/WEB-INF/views/ccss.jsp" />

<!-- Custom fonts for this template-->
<!--load all styles -->

<!-- Custom styles for this template -->
<!-- <link href="/corona/resources/css/sb-admin-2.min.css" rel="stylesheet"> -->

<!-- Custom styles for this page -->
<link href="/corona/resources/datatables/dataTables.bootstrap4.min.css"
	rel="stylesheet">

<link rel="stylesheet"
	href="/corona/resources/daumOpenEditor/css/editor.css" type="text/css"
	charset="utf-8" />
	
<link href="/corona/resources/css/common.css"
	rel="stylesheet">

<!-- <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"> -->
<link href="/corona/resources/css/jquery-ui.css" rel="stylesheet">

</head>

<body>

	<div class="d-flex" id="wrapper">

		<jsp:include page="/WEB-INF/views/sidebar.jsp" />

		<!-- Page Content -->
		<div id="page-content-wrapper">

			<jsp:include page="/WEB-INF/views/topbar.jsp" />

			<div class="container-fluid">

				<!-- Page Heading -->
				<h1 class="h3 mb-2 text-gray-800"></h1>

				<!-- DataTales Example -->
				<div class="card shadow mb-4">
					<div class="card-header py-3">
						<h6 class="m-0 font-weight-bold text-primary">나눔 글쓰기</h6>
					</div>
					<div class="card-body">
						<form name="tx_editor_form" id="tx_editor_form"
							action="/corona/nanum/write" method="post"
							accept-charset="utf-8">
							
							<div class="natitle">
								<p>제목</p>
								<input type="text" id="boardTitle" class="topInput" name="boardTitle" />
							</div>
							<div class="nanickname">
								<p>작성자</p>
								<input type="text" class="topInput" value="${loginuser.memberNickname}" autocomplete="off" disabled/>
							</div>
							<div class="nadate">
								<p>마감</p>
								<!-- <input type="text" id="boardRegdate" class="topInput" name="boardRegdate" placeholder="2020-01-01" autocomplete="off"/> -->
							</div>
							<jsp:include page="/WEB-INF/views/daumOpenEditor/editor_frame.jsp"></jsp:include>

							<div>
								<input id="submitBtn" class="btn btn-success" type="button" value="등록">
								<input id="cancelBtn" class="btn btn-secondary" type="button" value="취소">
							</div>
							
							<!-- End: Saving Contents -->
							
							<input type="hidden" id="memberNo" name="${loginuser.memberNo}"/>
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
	<!-- <script src="https://code.jquery.com/jquery-3.4.1.js"></script> -->

	<!-- Core plugin JavaScript-->
	<script src="/corona/resources/datatables/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="/corona/resources/datatables/sb-admin-2.min.js"></script>

	<!-- Page level plugins -->
	<script src="/corona/resources/datatables/jquery.dataTables.min.js"></script>
	<script src="/corona/resources/datatables/dataTables.bootstrap4.min.js"></script>

	<!-- Page level custom scripts -->
	<script src="/corona/resources/js/common.js"></script>
	<script src="/corona/resources/js/common-vol.js"></script>

	<script src="/corona/resources/daumOpenEditor/js/editor_loader.js"
		type="text/javascript" charset="utf-8"></script>
	
	<!-- <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> -->
	<script src="/corona/resources/js/jquery-ui.js"></script>
	<script src="/corona/resources/js/datepicker.js"></script>
	<script src="/corona/resources/js/editor.js"></script>

	<!-- Menu Toggle Script -->
	<script>
	$(function() {
			$("#menu-toggle").click(function(e) {
				e.preventDefault();
				$("#wrapper").toggleClass("toggled");
				if ($("#wrapper").hasClass("toggled")) {
					$("#menu-toggle").html("메뉴 열기");
				} else {
					$("#menu-toggle").html("메뉴 닫기");
				}
			});

			$(".voldate input").datepicker();

			$(".voldate input").focus(function(){
				$("#ui-datepicker-div").css("z-index", "100");
			})

			/* 
			//$("#dataTable_wrapper > div.row:last-child > div:first-child").empty().remove();
			$("#dataTable_info").text("").css("padding-top", "0");
			$("<button class='btn btn-primary'>").text("글쓰기").appendTo("#dataTable_info");
			$("<div class='col-sm-12 col-md-5'>").attr({"id" : "btnArea"}).appendTo("#dataTable_wrapper > div.row:last-child");
			//$("<button>").text("글쓰기").appendTo("#btnArea");
			 */

			$("#submitBtn").on('click', function(){

				if($("#boardTitle").val() == ""){
					alert('제목을 입력해주세요.');
					return false;
				}
				
				Editor.save();
			})

			$("#cancelBtn").on('click', function(){
				var check = confirm("작성을 취소 하시겠습니까?");
				if (!check) {
					return false;
				} else {
					history.back();
					//location.href="/corona/volunteer";
				}
			})

			$("#tx_canvas_wysiwyg").contents().find("#tx-content-container").css({"margin-left":"0"});

		});

	</script>


</body>

</html>