<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

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
    
    <link href="/corona/resources/css/switches.css" rel="stylesheet">
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
                    	<div id="searchArea">
                    		<div id="viewAllArea">
								<button type="button" id="viewAllAreaBtn">모든지역</button>
							</div>
							<input type="hidden" id="areaSearch" value="">
							<input type="hidden" id="confirmExtSearch" value="">
							<input type="hidden" id="exceptSearch" value="">
							<div id="seoul" style="position:relative;">
								<img src="/corona/resources/img/map/img_map_s16.gif" alt="" usemap="#seoulMap" id="seoul-map-image">
							</div>
							<div>
								<map name="seoulMap" id="seoulMap">
									<area shape="poly" coords="115,266,124,263,139,256,161,259,167,274,177,275,184,283,186,292,164,312,145,316,132,294,126,294,126,286" alt="관악구">
									<area shape="poly" coords="94,263,106,273,117,273,124,286,125,295,132,296,136,304,124,319,116,318,110,302,104,300,104,293,93,271" alt="금천구">
									<area shape="poly" coords="116,265,109,258,108,247,98,237,92,247,86,247,76,241,62,249,57,244,52,245,44,257,49,261,46,277,50,275,60,276,67,279,72,271,83,267,90,261,105,273,114,273" alt="구로구">
									<area shape="poly" coords="98,237,98,227,106,222,106,216,98,202,93,205,86,200,83,206,86,218,84,223,67,227,62,221,60,207,55,205,51,210,52,218,56,223,52,235,52,245,58,245,62,250,72,244,86,245,96,243" alt="양천구">
									<area shape="poly" coords="295,211,289,209,293,200,295,186,304,180,318,179,329,172,336,170,338,177,346,192,342,195,345,203,342,205,328,206,322,212,322,218,313,235,292,225" alt="강동구">
									<area shape="poly" coords="295,285,285,263,251,247,250,231,264,231,278,225,287,209,293,213,291,224,311,235,309,247,319,248,325,253,324,261,318,267" alt="송파구">
									<area shape="poly" coords="207,227,223,217,240,229,249,233,251,246,285,264,293,285,291,294,285,291,271,292,268,289,269,285,261,277,248,284,236,284,229,267,221,265,215,239" alt="강남구">
									<area shape="poly" coords="178,245,195,239,205,228,215,242,219,265,227,270,235,284,251,285,261,280,266,288,273,297,265,309,255,313,255,322,247,324,239,325,228,316,226,298,221,289,208,300,195,285,191,291,189,293,181,275,183,252" alt="서초구">
									<area shape="poly" coords="155,231,137,237,129,255,119,264,141,256,161,259,169,273,177,275,182,255,177,245" alt="동작구">
									<area shape="poly" coords="98,193,97,201,107,219,101,228,99,239,110,246,112,260,119,267,127,257,136,235,153,230,145,215,123,215" alt="영등포구">
									<area shape="poly" coords="37,146,48,159,65,169,95,196,97,203,93,205,87,200,83,204,85,217,71,226,62,219,62,209,55,205,50,211,37,208,31,214,25,206,11,203,5,195,13,192,13,185,22,173,29,173,33,160,31,151" alt="강서구">
									<area shape="poly" coords="154,217,163,206,164,199,173,197,181,196,187,203,198,202,209,215,192,235,175,239,159,230" alt="용산구">
									<area shape="poly" coords="152,215,162,205,164,194,151,197,140,196,136,190,98,161,92,174,81,175,98,189,124,209,139,207" alt="마포구">
									<area shape="poly" coords="239,222,254,191,265,180,270,182,278,177,279,183,277,190,278,193,289,194,283,207,273,223,260,229" alt="광진구">
									<area shape="poly" coords="204,206,216,188,214,180,224,182,230,179,245,188,252,190,239,219,225,211,211,214" alt="성동구">
									<area shape="poly" coords="166,193,169,191,169,185,178,182,189,184,199,182,207,180,213,181,214,187,203,204,198,200,190,202,182,196,166,198" alt="중구">
									<area shape="poly" coords="117,173,120,168,126,164,129,168,136,164,138,157,146,153,148,147,156,142,158,150,162,155,162,166,158,171,167,184,167,191,152,196,141,196,134,186" alt="서대문구">
									<area shape="poly" coords="254,189,259,177,252,160,254,143,253,134,261,130,264,130,267,132,274,132,281,128,284,130,288,130,290,140,289,147,290,155,287,156,278,176,270,181,265,180" alt="중랑구">
									<area shape="poly" coords="213,174,221,161,234,153,234,149,243,149,246,143,253,140,254,147,251,155,251,161,258,176,253,188,242,185,232,177,224,180,214,179" alt="동대문구">
									<area shape="poly" coords="174,118,166,106,165,100,152,89,148,89,142,98,127,105,120,101,120,105,123,111,118,120,121,125,113,139,115,146,114,161,106,162,103,155,98,159,116,173,121,166,126,163,129,166,135,162,136,158,145,154,146,148,154,140,153,130,161,122" alt="은평구">
									<area shape="poly" coords="174,120,162,124,155,131,156,140,159,148,163,154,163,168,160,172,169,182,177,181,187,183,204,180,212,179,212,173,207,169,199,169,197,161,193,159,185,160,177,151,183,145,183,130" alt="종로구">
									<area shape="poly" coords="175,118,182,127,185,144,181,153,185,159,194,159,199,163,200,168,208,168,214,172,219,162,231,153,234,149,242,147,246,141,251,140,251,134,245,134,236,125,220,141,216,138,208,137,194,122,183,113" alt="성북구">
									<area shape="poly" coords="236,124,231,117,236,106,239,107,239,98,236,91,235,60,245,54,256,54,261,51,266,60,272,60,272,66,269,70,275,76,273,85,269,92,273,105,280,104,285,107,285,119,278,128,269,132,263,127,253,132,245,132" alt="노원구">
									<area shape="poly" coords="212,80,203,68,202,63,205,60,206,50,215,47,222,57,229,53,237,57,234,61,235,91,239,99,238,104,233,108,230,117,221,108,214,100,207,98,206,87" alt="도봉구">
									<area shape="poly" coords="183,112,183,102,178,95,179,90,189,86,191,81,190,71,193,65,201,63,202,69,209,78,205,85,205,97,213,101,233,124,220,140,217,137,209,136" alt="강북구">
								</map>
							</div>

							<div>
								<textarea style="width:50%;height:300px">뭔가 들어갈 공간
근데 뭐 넣지
								</textarea>
								
							</div>

						</div>
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

										<td>
											<c:choose>
												<c:when test="${!vList.volunteers.volConfirm}">
													<i class='fas fa-exclamation-circle fa-2x' style='color:#f6c23e'>
														<span style='vertical-align: middle;font-size: 0.7em;'> 대기</span>
													</i>
												</c:when>
											<c:otherwise>
												<i class='fas fa-check-circle fa-2x' style='color:#1cc88a'>
													<span style='vertical-align: middle;font-size: 0.7em;'> 승인</span>
												</i></c:otherwise>
											</c:choose>
										</td>
                               			<td onClick="location.href='/corona/volunteer/detail/${vList.boardNo}'" style="cursor:pointer;">
                               				<span style="font-size:1.1em;/* font-weight:500; */">
                               					<c:choose>
                        							<c:when test="${fn:length(vList.boardTitle) > 19}">
                        								${ fn:substring(vList.boardTitle,0,19) }...
                        							</c:when>
                        							<c:otherwise>${ vList.boardTitle }</c:otherwise>
                       							</c:choose>
                       						</span>
                               			</td>
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

    <!-- Core plugin JavaScript-->
    <script src="/corona/resources/datatables/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="/corona/resources/datatables/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="/corona/resources/datatables/jquery.dataTables.min.js"></script>
    <script src="/corona/resources/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
   	<script src="/corona/resources/js/seoulmap.js"></script>
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

		$('<label>').addClass('switch s-icons s-outline s-outline-info').attr('id', 'confirm-labelext').prependTo("#dataTableVol_filter");
		$('<input>').attr({"type":"checkbox", "id":"confirmExt"}).css("margin", "0 5px 0 0").appendTo("#dataTableVol_filter #confirm-labelext");
		$('<span>').addClass('slider round').appendTo("#dataTableVol_filter #confirm-labelext");
		$('<label>').attr("id","confirm-label").text("모집종료 제외").css('padding-right', '5px').prependTo("#dataTableVol_filter");

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