<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

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

    <!-- Custom styles for this page -->
    <link href="/corona/resources/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
    
    <link href="/corona/resources/datatables/jquery.tap.css" rel="stylesheet">

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
				<!-- <a href="/corona/news/write">글쓰기</a> -->

				<!-- DataTales Example -->
				<div class="card shadow mb-4">
					<div class="card-header py-3">
						<h6 class="m-0 font-weight-bold text-primary">내 댓글</h6>
					</div>
						<div class="card-body">
	                        <div class="table-responsive">
	                            <table class="table table-bordered" id="dataTable1" width="100%" cellspacing="0">
	                                <thead>
	                                    <tr>
	                                        <th style="width:45px">분류</th>
	                                        <th>게시글 제목</th>
	                                        <th>댓글</th>
	                                        <th>이름</th>
	                                        <th style="width:55px">날짜</th>
	                                    </tr>
	                                </thead>
	                                <tbody>
	                                
	                                <c:forEach items="${ myReplyAll }" var="myReplyAll">
	                                
	                                    <tr>
	                                        <td>${ myReplyAll.board.category.category }</td>
	                                        <td><a href="/corona/freeboard/freeDetail?boardNo=${ myReplyAll.boardNo }&">${ myReplyAll.board.boardTitle }</a></td>
	                                         <td>${ myReplyAll.reply }</td>
	                                         <td>${ myReplyAll.board.member.memberNickname }</td>
	                                        <td><fmt:formatDate value="${ myReplyAll.replyDate }" pattern="yyyy.MM.dd"/></td>
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
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="/corona/resources/datatables/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="/corona/resources/datatables/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="/corona/resources/datatables/jquery.dataTables.min.js"></script>
    <script src="/corona/resources/datatables/dataTables.bootstrap4.min.js"></script>

  <!--   <!-- Page level custom scripts -->
    <script src="/corona/resources/datatables/datatables-demo.js"></script>

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
		var test = $('table').DataTable({
			"order":  [[4, 'desc']]
		});
	});
	</script>
 


</body>

</html>