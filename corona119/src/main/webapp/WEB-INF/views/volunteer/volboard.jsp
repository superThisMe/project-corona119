<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    <link href="/corona/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/corona/resources/css/simple-sidebar.css" rel="stylesheet">

	<!-- Custom fonts for this template-->
	<link href="/corona/resources/vendor/fontawesome-free-5.13.0-web/css/all.css" rel="stylesheet"> <!--load all styles -->

 	<!-- Custom styles for this template -->
    <link href="/corona/resources/css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="/corona/resources/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
    
    

</head>

<body>

    <div class="d-flex" id="wrapper">

        <jsp:include page="/WEB-INF/views/sidebar.jsp" />

        <!-- Page Content -->
        <div id="page-content-wrapper">

            <jsp:include page="/WEB-INF/views/topbar.jsp" />

            <div class="container-fluid">

                <!-- Page Heading -->
                <h1 class="h3 mb-2 text-gray-800"><!-- 제목 --></h1>

                <!-- DataTales Example -->
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">봉사활동 게시판</h6>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered" id="dataTableVol" width="100%" cellspacing="0">
                                <thead>
                                    <tr>
                                        <th>승인</th>
                                        <th>제목</th>
                                        <th>작성자</th>
                                        <th>지역</th>
                                        <th>마감일</th>
                                    </tr>
                                </thead>
                                <tbody>
                               	<c:forEach items="${volboardList}" var="vList">
                               		<tr>
<%-- 
                               			<td>${vList.boardNo}</td>
                               			<td onClick="location.href='/corona/volunteer/board/detail'" style="cursor:pointer;">${vList.boardTitle}</td>
                               			<td>${vList.memberNo}</td>
                               			<td>${vList.volunteers.volLocation}</td>
                               			<td><fmt:formatDate value="${vList.volunteers.volDuedate}" pattern="yyyy.MM.dd"/></td>
                               			<td><c:choose><c:when test="${!vList.volunteers.volConfirm}"><i class="fas fa-exclamation-circle fa-2x" style="color:#f6c23e"></i></c:when><c:otherwise><i class="fas fa-check-circle fa-2x" style="color:#1cc88a"></i></c:otherwise></c:choose></td>
 --%>
										<td><c:choose><c:when test="${!vList.volunteers.volConfirm}"><i class="fas fa-exclamation-circle fa-2x" style="color:#f6c23e"></i></c:when><c:otherwise><i class="fas fa-check-circle fa-2x" style="color:#1cc88a"></i></c:otherwise></c:choose></td>
                               			<td onClick="location.href='/corona/volunteer/detail/${vList.boardNo}'" style="cursor:pointer;">${vList.boardTitle}</td>
                               			<td>${vList.memberNo}</td>
                               			<td>${vList.volunteers.volLocation}</td>
                               			<td><fmt:formatDate value="${vList.volunteers.volDuedate}" pattern="yyyy.MM.dd"/></td>
                               			 
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
    <!-- <script src="https://code.jquery.com/jquery-3.4.1.js"></script> -->

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

	<c:choose>
		<c:when test="${ not empty loginuser }">
		<script src="/corona/resources/js/datatables-btnvol.js"></script>
		</c:when>
		<c:otherwise>
		<script src="/corona/resources/js/datatables-vol.js"></script>
		</c:otherwise>
	</c:choose>
	
	
    <!-- Menu Toggle Script -->
    <script>
    $(function(){
        $("#menu-toggle").click(function (e) {
            e.preventDefault();
            $("#wrapper").toggleClass("toggled");
            if ($("#wrapper").hasClass("toggled")) {
                $("#menu-toggle").html("메뉴 열기");
            } else {
                $("#menu-toggle").html("메뉴 닫기");
            }
        });

        /* 
        //$("#dataTable_wrapper > div.row:last-child > div:first-child").empty().remove();
        $("#dataTable_info").text("").css("padding-top", "0");
        $("<button class='btn btn-primary'>").text("글쓰기").appendTo("#dataTable_info");
        $("<div class='col-sm-12 col-md-5'>").attr({"id" : "btnArea"}).appendTo("#dataTable_wrapper > div.row:last-child");
        //$("<button>").text("글쓰기").appendTo("#btnArea");
 */        
    });
	//$.fn.DataTable.ext.pager.numbers_length = 9;
    </script>

</body>

</html>