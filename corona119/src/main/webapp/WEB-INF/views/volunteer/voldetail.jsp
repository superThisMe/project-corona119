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
<link
	href="/corona/resources/vendor/fontawesome-free-5.13.0-web/css/all.css"
	rel="stylesheet">
<!--load all styles -->

<!-- Custom styles for this template -->
<link href="/corona/resources/css/sb-admin-2.min.css" rel="stylesheet">

<!-- Custom styles for this page -->
<link href="/corona/resources/datatables/dataTables.bootstrap4.min.css"
	rel="stylesheet">

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
					<c:choose>
					<c:when test="${!vDetail.volunteers.volConfirm}">
					<div class="card-header py-3" style="background-color:#f6c23e">
					</c:when>
					<c:otherwise>
					<div class="card-header py-3" style="background-color:#1cc88a">
					</c:otherwise>
					</c:choose>
						<h6 class="m-0 font-weight-bold text-primary">${vDetail.boardTitle}</h6>
					</div>
					<div class="card-body">
						<fmt:parseDate var="sSetDate" value="${ nowTime }" pattern="yyyy-MM-dd"/>
						<fmt:formatDate var="endTime" value="${vDetail.volunteers.volDuedate}" pattern="yyyy-MM-dd" />
						<fmt:parseDate var="eSetDate" value="${ endTime }" pattern="yyyy-MM-dd"/>
						<fmt:parseNumber var="sDate" value="${ sSetDate.time/(1000*60*60*24) }" integerOnly="true" />
						<fmt:parseNumber var="eDate" value="${ eSetDate.time/(1000*60*60*24) }" integerOnly="true" />
						<div id="applyArea">
						<c:choose>
							<c:when	test="${nowTime <= endTime && loginuser ne null && loginuser.memberNo ne vDetail.memberNo}">
								<button id="apply" type="button" data-toggle="modal" data-target="#applyModal">
							</c:when>
							<c:otherwise>
								<button id="alogin" type="button" disabled>
							</c:otherwise>
						</c:choose>
 
	           			<c:choose>
	           				<c:when test="${ (eDate - sDate) lt 0 }">
	           					<td>모집종료</td>		
	           				</c:when>
	           				<c:when test="${ (eDate - sDate) eq 0 }">
	           					<td>신청하기 <span style="color:red">오늘마감</span></td>		
	           				</c:when>
	           				<c:otherwise>
	           					<td>신청하기 마감 ${ eDate - sDate}일 전</td>
	           				</c:otherwise>
	           			</c:choose>
	           				</button>
						</div>
													
						<input type="hidden" id="detailAddr"
							value="${vDetail.volunteers.volLocation2}">
						<div>
						
							<div class="board_data type2" style="height:150px">
								<div class="group">
									<dl>
										<dt>활동시작일</dt>
										<dd><fmt:formatDate value="${vDetail.volunteers.volWdate1}"	pattern="yyyy.MM.dd" /></dd>
									</dl>
									<dl>
										<dt>활동종료일</dt>
										<dd><fmt:formatDate value="${vDetail.volunteers.volWdate2}"	pattern="yyyy.MM.dd" /></dd>
									</dl>
								</div>
								<div class="group">
									<dl>
										<dt>작성자</dt>
										<dd>${vDetail.member.memberNickname}</dd>
									</dl>
									<dl>
										<dt>신청인원</dt>
										<dd>${applyCount}명</dd>
									</dl>
								</div>
								<div class="group">
									<dl>
										<dt>활동지역</dt>
										<dd id="address">${vDetail.volunteers.volLocation}</dd>
									</dl>
								</div>
							</div>

							${vDetail.boardContent}
							<hr>
							<div id="mapLayout">
								<div id="toggleMap">
									<button id="topBtn">일반</button>
									<button id="roadBtn">로드뷰</button>
								</div>
								<div id="volMap" style="width: 100%; height: 600px;">
									<div id="mapBack" style="width:100%; height:600px; background:#eee"></div>
									<div id="roadview" style="width: 100%; height: 600px;"></div>
								</div>
								
							</div>
						</div>
						<hr>
						<div style="padding-top: 10px">
							<c:if test="${ loginuser.memberNo eq vDetail.memberNo }">
								<a href='/corona/volunteer/update/${vDetail.boardNo}' class='btn btn-success' id="volUpdate" type="button">수정</a>
								<a href="/corona/volunteer/delete/${vDetail.boardNo}" class='btn btn-danger' id="volDelete" type="button">삭제</a>
							</c:if>
							<button class='btn btn-primary' id="volList" type="button">목록</button>
						</div>

					</div>
				</div>
				
				<div class="card shadow mb-4">
					<div class="card-body">
						<div id="applyList">
							<jsp:include page="/WEB-INF/views/volunteer/apply/apply.jsp"></jsp:include>
						</div>
					</div>
				</div>

			</div>
		</div>

		<!-- /#page-content-wrapper -->

		<!-- Modal 1 -->
		<div class="modal fade" id="applyModal" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">봉사활동 지원하기</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<form id="apply">
		                    <div class="form-row">
		                        <div class="form-group col-md-6">
		                            <label for="volName">실명</label> <input type="text" class="form-control" id="volName"
		                                name="volName" placeholder="홍길동">
		                        </div>
		                        <div class="form-group col-md-6">
		                            <label for="volBirth">출생년도</label>
		                            <div class="form-control">
										<select name="volBirth" id="volBirth">
											<option value="1900" selected="selected">1900</option>
										</select>
									</div>
		                        </div>
		                    </div>
		                    
		                    <div class="form-group">
								<label for="volPhone">연락처</label>
								<input type="text" class="form-control" id="volPhone" name="volPhone" placeholder="010-0000-0000">
							</div>

							<div align="right">
								<button type="button" id="modalApply" class="btn btn-primary">신청하기</button>
							</div>
						</form>
					</div>
					<div class="modal-footer"></div>
				</div>
			</div>
		</div>

	</div>
	<!-- /#wrapper -->
	<fmt:formatDate var="year" value="${now}" pattern="yyyy" />
	<!-- Bootstrap core JavaScript -->
	<script src="/corona/resources/vendor/jquery/jquery.min.js"></script>
	<!-- <script src="https://code.jquery.com/jquery-3.5.0.min.js"></script> -->
	
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
	<script src="/corona/resources/datatables/datatables-demo.js"></script>
	<script src="/corona/resources/js/common.js"></script>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6013e82693c4074b861da547ceb13186&libraries=services"></script>
	<script type="text/javascript" src="/corona/resources/js/volmap.js"></script>
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

			$("#volList").on('click', function() {
				location.href = "/corona/volunteer";
			});

			$("#volDelete").on('click', function() {
				var check = confirm("게시글을 삭제하시겠습니까?");
				if (!check) {
					event.preventDefault();
				}
			})
			
			for(var i = 1901; i <= ${year}; i++){
				$("<option>").attr("value", i).text(i).appendTo("select#volBirth");
			}

			$("#topBtn").on('click', function(){
				$("#mapBack").css("display","block");
				$("#roadview").css("z-index", "1");
			});
			$("#roadBtn").on('click', function(){
				$("#mapBack").css("display","none");
				$("#roadview").css("z-index", "98");
			});
			
			$("#modalApply").on('click', function(){
				if ($('#volPhone').val().length == 0) {
					alert("휴대폰 번호를 입력하세요.")
				} else if ($('#volName').val().length == 0) {
					alert("실명을 입력하세요.")
				} else {
					var check = confirm("신청하시겠습니까?");
					if (!check){
						event.preventDefault();
					} else {
						var applyPhone = $('#volPhone').val();
						var applyBirth = $('select#volBirth').val();
						var applyId = $('#volName').val();
						$.ajax({
							"url": "/corona/volunteer/apply/write/${vDetail.boardNo}",
							"method": "post",
							"data": {"applyPhone":applyPhone, "applyBirth":applyBirth, "applyId":applyId},
						    "beforeSend" : function(xhr, opts) {
						        $('#applyModal').modal('hide');
						    	if (${loginuser eq null || loginuser.memberNo eq vDetail.memberNo}) {
							        alert("잘못된 접근입니다.");
						            xhr.abort();
						        }
						    },
						    "success": function(data, status, xhr) {
								$('#applyModal').modal('hide');
								if(data == "success") {
									alert("신청이 완료됐습니다.");
									$('#applyList').load("/corona/volunteer/apply/${vDetail.boardNo}");
								} else {
									alert("이미 신청이 완료됐습니다.");
								}
							},
							"error": function(xhr, status, err) {
								alert('전송 실패');
							}
						});	
					}
				}
			})
			$('#applyList').load("/corona/volunteer/apply/${vDetail.boardNo}");
			$(document).on('click', '#applyCancel', function(){
				var check = confirm("신청을 취소하시겠습니까?");
				if (!check) {
					event.preventDefault();
				} else {
				$.ajax({
					"url": "/corona/volunteer/apply/cancel/${vDetail.boardNo}",
					"method": "post",
					"data": {"memberNo": ${vDetail.memberNo}},
				    "beforeSend" : function(xhr, opts) {
						if (${ (eDate - sDate) lt 0 }) {
							alert("모집이 종료된 글입니다.");
							xhr.abort();
						} else if (${loginuser eq null || loginuser.memberNo eq vDetail.memberNo}) {
					        alert("잘못된 접근입니다.");
				            xhr.abort();
				        }
				    },
					"success": function(data, status, xhr) {
						if(data == "success") {
							$('#applyList').load("/corona/volunteer/apply/${vDetail.boardNo}");
							alert("신청이 취소되었습니다.");
						} else {
							alert("모집이 종료된 글입니다.");
						}
					},
					"error": function(xhr, status, err) {
						alert('전송 실패');
					}
				})}
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