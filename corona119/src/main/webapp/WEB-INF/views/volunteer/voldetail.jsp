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
    
    <link href="/corona/resources/css/common.css" rel="stylesheet">    

</head>

<body>
	<jsp:useBean id="now" class="java.util.Date" scope="page" />
	<fmt:formatDate var="nowTime" value="${now}" pattern="yyyyMMdd" />
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
                        <h6 class="m-0 font-weight-bold text-primary">${vDetail.boardTitle}</h6>
                    </div>
                    <div class="card-body">
						<div>글번호 : ${vDetail.boardNo}</div>
      					<div>작성자 : ${vDetail.memberNo}</div>
      					<div>조회수 : ${vDetail.boardCount}</div>
      					<div>승인상태 : ${vDetail.volunteers.volConfirm}</div>
      					<div>활동지역 : ${vDetail.volunteers.volLocation}</div>
      					<div>모집마감일 : <fmt:formatDate value="${vDetail.volunteers.volDuedate}" pattern="yyyy.MM.dd"/></div>
      					<div>시작일 : <fmt:formatDate value="${vDetail.volunteers.volWdate1}" pattern="yyyy.MM.dd"/></div>
      					<div>종료일 : <fmt:formatDate value="${vDetail.volunteers.volWdate2}" pattern="yyyy.MM.dd"/></div>
      					
						<fmt:formatDate var="eDate" value="${vDetail.volunteers.volDuedate}" pattern="yyyyMMdd" />
						
      					<c:if test="${eDate - nowTime ge 0}">
      						<div><button id="apply" type="submit">신청하기</button></div>
      					</c:if>
      					
      					
      					<div>${vDetail.boardContent}</div>
						<div>
							<c:if test="${ loginuser.memberNo eq vDetail.memberNo }">
								<button class='btn btn-primary' id="volUpdate" type="button">수정</button>
								<a href="/corona/volunteer/delete/${vDetail.boardNo}" type="button" class='btn btn-danger' id="volDelete" type="button">삭제</a>
							</c:if>
							<button class='btn btn-primary' id="volList" type="button">목록</button>
						</div>

                    </div>
                </div>
              
      			<div id="applyList">
      				<%-- <jsp:include page="/WEB-INF/views/volunteer/apply/apply.jsp"></jsp:include> --%>
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

    	$("#volList").on('click', function(){
    		location.href="/corona/volunteer";
    	})
    	
    	$("#volDelete").on('click', function(){
        	var check = confirm("게시글을 삭제하시겠습니까?");
        	if (!check){
        		event.preventDefault();
        	}
    	})
    	
    	$("#apply").on('click', function(){
    		var check = confirm("신청하시겠습니까?");
        	if (!check){
        		event.preventDefault();
        	}
        })
      
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