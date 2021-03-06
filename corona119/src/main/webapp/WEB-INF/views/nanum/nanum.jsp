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
	
	<jsp:include page="/WEB-INF/views/ccss.jsp" />
	
	<!-- Custom styles for this template -->
	<!-- <link href="/corona/resources/css/sb-admin-2.min.css" rel="stylesheet"> -->
	
	<!-- Custom styles for this page -->
	<link href="/corona/resources/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
		
	<link href="/corona/resources/css/common.css" rel="stylesheet">

</head>

<body>
	<jsp:useBean id="now" class="java.util.Date" scope="page" />
 	<fmt:formatDate var="nowTime" value="${now}" pattern="yyyy-MM-dd" /> 
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
						<h6 class="m-0 font-weight-bold text-primary">나눔게시판</h6>
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<table class="table table-bordered" id="dataTableNanum" width="100%" cellspacing="0">
								<thead>
									<tr>
										<th class="no-content"></th>
										<th>제목</th>
										<th>작성자</th>
										<th>조회수</th>
										<th>기한</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${nanum}" var="na">
										<fmt:parseDate var="cSetDate" value="${ nowTime }" pattern="yyyy-MM-dd"/>
										<fmt:formatDate var="endTime" value="${na.boardRegdate}" pattern="yyyy-MM-dd" />
										<fmt:parseDate var="eSetDate" value="${ endTime }" pattern="yyyy-MM-dd"/>
										<fmt:parseNumber var="cDate" value="${ cSetDate.time/(1000*60*60*24) }" integerOnly="true" />
										<fmt:parseNumber var="eDate" value="${ eSetDate.time/(1000*60*60*24) + 3 }" integerOnly="true" />
									
										<tr>
											<td><img src="${na.image[0].imagesPath}" class="thumbnail" data-path="${na.image[0].imagePath}"></td>
											<td onclick="location.href='/corona/nanum/detail/${ na.boardNo }'" style="cursor:pointer">${na.boardTitle}</td>
											<td>${na.member.memberNickname}</td>
											<td>${na.boardCount}</td>
											<td>
												<c:choose>
													<c:when test="${eDate - cDate gt 0}">
														${eDate - cDate}일
													</c:when>
													<c:when test="${eDate - cDate eq 0}"><span style='color:red'>임박</span></c:when>
													<c:otherwise>
														종료
													</c:otherwise>
												</c:choose>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
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
	<script src="/corona/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="/corona/resources/datatables/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="/corona/resources/datatables/sb-admin-2.min.js"></script>

	<!-- Page level plugins -->
	<script src="/corona/resources/datatables/jquery.dataTables.min.js"></script>
	<script src="/corona/resources/datatables/dataTables.bootstrap4.min.js"></script>

	<!-- Page level custom scripts -->
    <script src="/corona/resources/js/common.js"></script>

	<c:choose>
		<c:when test="${ not empty loginuser }">
		<script src="/corona/resources/js/datatables-btnnanum.js"></script>
		</c:when>
		<c:otherwise>
		<script src="/corona/resources/js/datatables-nanum.js"></script>
		</c:otherwise>
	</c:choose>


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

		var xOffset = 100;
        var yOffset = 30;
        $(document).on("mouseover",".thumbnail",function(e){ //마우스 오버시
			
			$("body").append("<p id='preview'><img src='"+ $(this).attr("data-path") +"' width='400px' /></p>"); //보여줄 이미지를 선언						 
			$("#preview")
				.css("top",(e.pageY - xOffset) + "px")
				.css("left",(e.pageX + yOffset) + "px")
				.fadeIn("fast"); //미리보기 화면 설정 셋팅
		});
		$(document).on("mousemove",".thumbnail",function(e){ //마우스 이동시
			$("#preview")
				.css("top",(e.pageY - xOffset) + "px")
				.css("left",(e.pageX + yOffset) + "px");
		});
		$(document).on("mouseout",".thumbnail",function(){ //마우스 아웃시
			$("#preview").remove();
		});

	});
	</script>
	
</body>

</html>