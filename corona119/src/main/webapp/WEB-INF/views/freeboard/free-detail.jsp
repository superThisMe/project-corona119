<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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

    <!-- Custom styles for this template -->
    <link href="/corona/resources/css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="/corona/resources/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
    
    <link href="/corona/resources/datatables/jquery.tap.css" rel="stylesheet">
    
    <style>
    .show {display: block}
    </style>

</head>

<body>

    <div class="d-flex" id="wrapper">

        <jsp:include page="/WEB-INF/views/sidebar.jsp" />

        <!-- Page Content -->
        <div id="page-content-wrapper">

            <jsp:include page="/WEB-INF/views/topbar.jsp" />

            <div class="container-fluid">

                <!-- Page Heading -->
                <h1 class="h3 mb-2 text-gray-800">자유게시판</h1>
				
							
                <!-- DataTales Example -->
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">${ board.boardTitle }</h6>
                    </div>
                    <div class="card-body">
                    	
						<div>
							${ board.boardContent }
							
							<div id="reco" align="center">
								<jsp:include page="/WEB-INF/views/freeboard/reco.jsp"></jsp:include>
							</div>
							
						</div>
						<br>
						
							<c:if test="${ loginuser.memberNo == board.memberNo }">							
								<button class='btn btn-primary' id="update" type="button">수정</button>
								<button class='btn btn-primary' id="delete" type="button">삭제</button>
							</c:if>
								<button class='btn btn-primary' id="list" type="button">목록</button>
								
						<div>
						
						</div>

                    </div>
                </div>
                
                
                <div class="reply">

				<c:if test="${sessionScope.loginuser != null }">
				
			    <div class="my-3 p-3 bg-white rounded shadow-sm" style="padding-top: 10px">
			        <form id="saveReply" name="saveReply" method="post">
			            <div class="card_body" width="100%" margin-left="5px">
			                <table width="100%">
			                    <tr>
			                        <td colspan="2">
			                            <p>도배, 내용반복, 무의미, 내용에 관계 없는 댓글시 일괄 삭제 처리 </p>
			                        </td>
			                    </tr>
			                    <tr>
			                        <td style="width: 100px ">
			                            <textarea id="reply" name="reply" rows="3" style="width: 100%"
			                                placeholder="여기에 댓글을 작성해주세요."></textarea>
			                        </td>
			                        <td width="5%" align="center">
			                            <a id="saveReplyBttn" href="#" class="btn btn-success btn-circle btn-lg">
			                                <i class="fas fa-check" style="font-size: x-small;">작성</i>
			                            </a>
			
			                        </td>
			                    </tr>
			
			                </table>
			                <input type="hidden" name="boardNo" value="${ board.boardNo }">
			                <input type="hidden" name="memberNo" value="${ loginuser.memberNo }">
			                <input type="hidden" name="action" value='reply'>	
			            </div>
			        </form>
			
			    </div>
			    
			    </c:if>
			
			    <div class="my-3 p-3 bg-white rounded shadow-sm" style="padding-top: 10px">
			
			        <h6 class="border-bottom pb-2 mb-0">Reply list</h6>
			       
			
					<div id="listReply">
					
			 	 		<jsp:include page="/WEB-INF/views/freeboard/reply.jsp" />
			 	 			    
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
        $("#menu-toggle").click(function (e) {
            e.preventDefault();
            $("#wrapper").toggleClass("toggled");
            if ($("#wrapper").hasClass("toggled")) {
                $("#menu-toggle").html("메뉴 열기");
            } else {
                $("#menu-toggle").html("메뉴 닫기");
            }
        });
    </script>
    <script type="text/javascript">
    $(function(){
		$('#update').on('click', function(){
			location.href = "freeUpdate?boardNo=${ board.boardNo }";
			});
		$('#delete').on('click', function(){
			var check = confirm("정말 삭제 하시겠습니까?")
			if(check){
				location.href = "freeDel?boardNo=${ board.boardNo }";
					};
			});
		$('#list').on('click', function(){	
			location.href = "free-list";
			});

		
    });
    </script>
    
   	<script type="text/javascript">
    $(function(){

		$('#saveReplyBttn').on('click', function() {
	
			if ($('#reply').val().length == 0) {
				alert("댓글 내용을 입력하세요")
				$("#reply").focus();
				return;
			}

			var values = $('#saveReply').serializeArray();
			
			$.ajax({
				"url": "/corona/reply/saveReply",
				"method": "post",
				"data": values,
				"success": function(data, status, xhr) {

					document.getElementById("reply").value='';
					
					$('#listReply').load("/corona/reply/listReply/${ board.boardNo }");
						
				},
				"error": function(xhr, status, err) {
					alert('댓글 쓰기 실패');
				}
			});			
		});

    });

    </script>    
    
    <script>
    $(function(){
	   
	    $(document).on('click', '.reply-delete' , function() {
		    var rno = $(this).attr('data-rno');
			var check = confirm("댓글을  삭제 하시겠습니까?");
			if (!check) return;
			
		
					$.ajax({
						"url" : "/corona/reply/delReply/" + rno ,
						"method" : "delete",
						"success" : function(data, status, xhr) {
	
							$('#listReply').load("/corona/reply/listReply/${ board.boardNo }");
	
							},
						"error" : function(xhr, status, err) {
	
						}
					
					
					}); 	
	    });
		
		
	
		$(document).on('click', '.reply-update', function(event){
			var rno = $(this).attr('data-rno');

			$('#rid_' + rno).css("display","block");
			$("#updateReplyForm_"+ rno +" input[name=upReply]").focus();
			
			});

		$(document).on('click', '.updateK', function(event){
			var rno = $(this).attr('data-rno');
			
			var data = 	{"rno": rno, "reply": $("#updateReplyForm_"+ rno +" input[name=upReply]").val() };
			
			$.ajax({
				"url" : "/corona/reply/updateReply",
				"method" : "put",
				"data" : JSON.stringify(data),
				"contentType": "application/json",
				"success" : function(data, status, xhr) {

					$('#listReply').load("/corona/reply/listReply/${ board.boardNo }");

					},
				"error" : function(xhr, status, err) {

				}
			});
		});
		
		$(document).on('click', '.updateC', function(event){
			var rno = $(this).attr('data-rno');
				
			$('#rid_' + rno).css("display","none");
			
		});

		
	    
	})
    </script>
    
    
    <script>
		$(document).ready(function(){
			$('#listReply').load("/corona/reply/listReply/${ board.boardNo }");

			$('#reco').load("/corona/freeboard/recoCount/${ board.boardNo }");
			});

		
    </script>
    
    <script>
		$(function(){

			$(document).on('click', '.recoBtn, .nrecoBtn, .singoBtn' , function() {
				var btnId = $(this).attr('id');
				$.ajax({
					"url": "/corona/freeboard/reco/${board.boardNo}",
					"method": "POST",
					"data": {"btnId": btnId, "memberNo": "${loginuser.memberNo}"},
					"success": function(data, status, xhr) {
						switch(data){
						case 'reco':
							alert('${board.boardNo}번 글을 추천하였습니다');
							$('#reco').load("/corona/freeboard/recoCount/${ board.boardNo }");
							break;
						case 'nreco':
							alert('${board.boardNo}번 글을 비추천하였습니다');
							$('#reco').load("/corona/freeboard/recoCount/${ board.boardNo }");
							break;
						case 'singo':
							alert('신고가 완료되었습니다');
							$('#reco').load("/corona/freeboard/recoCount/${ board.boardNo }");
							break;
						case 'complete':
							alert('이미 완료되었습니다');
							break;
						default:
							alert('로그인 된 회원만 가능합니다');
							break;
						}
					},
					"error": function(xhr, status, err) {
						alert('전송 실패');
					}
				})
			})


			})
    </script>
	

</body>

</html>