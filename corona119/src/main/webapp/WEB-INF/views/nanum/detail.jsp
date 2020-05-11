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
						<h6 class="m-0 font-weight-bold text-primary">${nanumDetail.boardTitle}</h6>
						<h6 style="float:right;">${nanumDetail.member.memberNickname}</h6>
					</div>
					<div class="card-body">
						<fmt:parseDate var="cSetDate" value="${ nowTime }" pattern="yyyy-MM-dd"/>
						<fmt:formatDate var="endTime" value="${nanumDetail.boardRegdate}" pattern="yyyy-MM-dd" />
						<fmt:parseDate var="eSetDate" value="${ endTime }" pattern="yyyy-MM-dd"/>
						<fmt:parseNumber var="cDate" value="${ cSetDate.time/(1000*60*60*24) }" integerOnly="true" />
						<fmt:parseNumber var="eDate" value="${ eSetDate.time/(1000*60*60*24) + 3 }" integerOnly="true" />
					
						<c:if test="${ cDate <= eDate }">
						<c:if test="${loginuser.memberNo eq nanumDetail.memberNo}">
							<div id="randomselect" style="text-align:center;">
								<button class="btn btn-info" id="lotto">추첨하기</button>
							</div>
						</c:if>
						</c:if>
							
						<div>
						
							${nanumDetail.boardContent}
											
						</div>
						<hr>
						
						<c:if test="${nanumDetail.boardResult ne null || !empty nanumDetail.boardResult }">
						<div id="resultArea" style="text-align:center;">
							축하합니다! 당첨자는 ${nanumDetail.boardResult}님 입니다!
						</div>
						<hr>
						</c:if>
						
						<div style="padding-top: 10px">
							<button class='btn btn-primary' id="nanumList" type="button">목록</button>
						</div>

					</div>
				</div>

				<c:if test="${ cDate <= eDate }">
				<div class="card shadow mb-4" id="replyOne">
					<div class="my-3 p-3 bg-white rounded shadow-sm" style="margin-top:0 !important;margin-bottom:0 !important;">
						<div class="form-group">
							<form id="writeReply" name="writeReply">
                        	<label class="form-label" for="field-4" style="margin-bottom:0 !important;">한 줄 신청란</label>
                            <span class="desc">"신청 하시려면 한 줄 댓글을 남겨주세요."</span>
                            <div class="controls">
                            	<input type="text" id="field-4" name="reply" placeholder="" class="form-control" style="width:90%;float:left;">
                            	<c:choose>
                            		<c:when test="${ loginuser eq null || nanumDetail.memberNo eq loginuser.memberNo || reply ne 0 }">
                            			<input type="button" class="btn btn-info" value="신청하기" style="width:10%;" disabled>
                            		</c:when>
                            		<c:otherwise>
										<input type="button" class="btn btn-info" value="신청하기" style="width:10%;">
									</c:otherwise>
                            	</c:choose>
                            </div>
                            </form>
                        </div>
                    </div>
                </div>
                </c:if>

				<div class="card shadow mb-4">

					<div class="card-body">

						<div id="replyList">
							<jsp:include page="/WEB-INF/views/nanum/reply/reply.jsp"></jsp:include>
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
	
	<script src="/corona/resources/plugins/sweetalert.min.js"></script>

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

			if(${reply ne 0}){
				$('#replyOne').empty().remove();
			}

			$('#lotto').on('click', function(){
				$.ajax({
					"url": "/corona/nanum/lotto/${nanumDetail.boardNo}",
					"method": "POST",
					"success": function(data, status, xhr) {
						if (data == "failure"){
							swal('주의','신청자가 없습니다','warning')
						} else {
						swal('완료','추첨된 회원은 ' + data + '님 입니다','success').then(okay => {
							 if(okay) {
								 location.reload();
							 }})
						}
					},
					"error": function(xhr, status, err) {
						alert('추첨 실패');
					}
				})
			});
			
			$("#nanumList").on('click', function() {
				//location.href = "/corona/nanum";
				history.back();
			});

			$('#replyList').load("/corona/nanum/reply/${nanumDetail.boardNo}");

			$('#field-4').focus(function(){
				if(${loginuser eq null}){
					swal('주의','로그인 된 회원만 가능합니다.','warning')
				} else if (${nanumDetail.memberNo eq loginuser.memberNo}){
					swal('주의','본인 글에 신청은 불가합니다.','warning')
				}
			});

			$('input[value="신청하기"]').on('click', function(){
				if($('#field-4').val() == "") {
					swal('주의','댓글을 입력해주세요.','warning')
				} else {
					var data = $('#writeReply').serializeArray();
					$.ajax({
						"url": "/corona/nanum/reply/write/${nanumDetail.boardNo}",
						"method": "POST",
						"data": data,
					    "beforeSend" : function(xhr, opts) {
					    	if (${loginuser eq null || loginuser.memberNo eq nanumDetail.memberNo}) {
						        alert("잘못된 접근입니다.");
					            xhr.abort();
					        }
					    },
					    "success": function(data, status, xhr) {
							if(data == "success") {
								swal('완료','신청이 완료됐습니다.','success')
								$('#replyList').load("/corona/nanum/reply/${nanumDetail.boardNo}");
								
							} else {
								swal('주의','이미 신청이 완료됐습니다.','warning')
							}
						},
						"error": function(xhr, status, err) {
							alert('전송 실패');
						}
					});
					$('#replyOne').empty().remove();	
					
				}
			});
		});
	</script>

</body>

</html>