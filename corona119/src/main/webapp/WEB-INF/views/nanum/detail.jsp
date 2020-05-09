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

<!-- Bootstrap core CSS -->
<link href="/corona/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="/corona/resources/css/simple-sidebar.css" rel="stylesheet">

<!-- Custom fonts for this template-->

<!--load all styles -->

<!-- Custom styles for this template -->
<link href="/corona/resources/css/sb-admin-2.min.css" rel="stylesheet">

<!-- Custom styles for this page -->
<link href="/corona/resources/datatables/dataTables.bootstrap4.min.css"
	rel="stylesheet">

<link href="/corona/resources/css/common.css" rel="stylesheet">

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
						<h6 class="m-0 font-weight-bold text-primary">${nanumDetail.boardTitle}</h6>
						<h6 style="float:right;">${nanumDetail.member.memberNickname}</h6>
					</div>
					<div class="card-body">
													
						<div>
						
							${nanumDetail.boardContent}
											
						</div>
						<hr>
						<div style="padding-top: 10px">
							<button class='btn btn-primary' id="nanumList" type="button">목록</button>
						</div>

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

	<!-- Core plugin JavaScript-->
	<script src="/corona/resources/datatables/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="/corona/resources/datatables/sb-admin-2.min.js"></script>

	<!-- Page level plugins -->
	<script src="/corona/resources/datatables/jquery.dataTables.min.js"></script>
	<script src="/corona/resources/datatables/dataTables.bootstrap4.min.js"></script>

	<!-- Page level custom scripts -->
	<script src="/corona/resources/js/common.js"></script>

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

			$("#nanumList").on('click', function() {
				location.href = "/corona/nanum";
			});

		});
	</script>

</body>

</html>