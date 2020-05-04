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
	<fmt:formatDate var="nowTime" value="${now}" pattern="yyyy-MM-dd" /> 
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
                                        <th>지역구</th>
                                        <th>마감일</th>
                                    </tr>
                                </thead>
                                <tbody>
                              
                               	<c:forEach items="${volboardList}" var="vList">
									<fmt:parseDate var="sSetDate" value="${ nowTime }" pattern="yyyy-MM-dd"/>
									<fmt:formatDate var="endTime" value="${vList.volunteers.volDuedate}" pattern="yyyy-MM-dd" />
									<fmt:parseDate var="eSetDate" value="${ endTime }" pattern="yyyy-MM-dd"/>
									<fmt:parseNumber var="sDate" value="${ sSetDate.time/(1000*60*60*24) }" integerOnly="true" />
									<fmt:parseNumber var="eDate" value="${ eSetDate.time/(1000*60*60*24) }" integerOnly="true" />                               	
                               		<tr>

										<td><c:choose><c:when test="${!vList.volunteers.volConfirm}"><i class='fas fa-exclamation-circle fa-2x' style='color:#f6c23e'><span style='vertical-align: middle;font-size: 0.7em;'> 대기</span></i></c:when><c:otherwise><i class='fas fa-check-circle fa-2x' style='color:#1cc88a'><span style='vertical-align: middle;font-size: 0.7em;'> 승인</span></i></c:otherwise></c:choose></td>
                               			<td onClick="location.href='/corona/volunteer/detail/${vList.boardNo}'" style="cursor:pointer;"><span style="font-size:1.1em;/* font-weight:500; */">${vList.boardTitle}</span></td>
                               			<%-- <td>${vList.memberNo}</td> --%>
                               			<td>${vList.member.memberNickname}</td>
                               			<td>${vList.volunteers.volLocshort}</td>
                               			<c:choose>
                               				<c:when test="${ (eDate - sDate) lt 0 }">
                               					<td>모집종료</td>		
                               				</c:when>
                               				<c:when test="${ (eDate - sDate) eq 0 }">
                               					<td><span style='color:red'>오늘마감</span></td>		
                               				</c:when>
                               				<c:otherwise>
                               					<td>마감 ${ eDate - sDate}일 전</td>
                               				</c:otherwise>
                               			</c:choose>
                               			 
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
    <!-- <script src="https://code.jquery.com/jquery-3.3.1.js"></script> -->
    <!-- <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script> -->

    <!-- Core plugin JavaScript-->
    <script src="/corona/resources/datatables/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="/corona/resources/datatables/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="/corona/resources/datatables/jquery.dataTables.min.js"></script>
    <!-- <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script> -->
    <script src="/corona/resources/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <!-- <script src="/corona/resources/datatables/datatables-demo.js"></script> -->
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
        $("#dataTableVol thead th").eq(0).removeClass();
        $("#dataTableVol thead th").click(function(){
        	$("#dataTableVol thead th").eq(0).removeClass();
        });
*/
/* 
        $('<label>').attr("id","confirm-label").text("승인글").prependTo("#dataTableVol_filter");
        $('<input>').attr({"type":"checkbox", "id":"confirmChk", "value":"false"}).css("margin","0 5px 0 0").appendTo("#dataTableVol_filter #confirm-label");
        $('input:checkbox[id="confirmChk"]').on('change', function(){
        	if($(this).is(":checked")){
                $(this).val("true");
            } else{
            	$(this).val("false");
            }
            var confirmChk = $(this).val();
        	$.ajax({
				"url": "/corona/volunteer/confirmChk",
				"method": "post",
				"data": {"confirmChk":confirmChk},
				"success": function(data, status, xhr) {
				//	$('#applyList').load("/corona/volunteer/apply/${vDetail.boardNo}");
				},
				"error": function(xhr, status, err) {
					alert('신청 실패');
				}
			});	
        })
 */        
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