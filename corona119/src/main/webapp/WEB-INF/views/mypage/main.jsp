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

</head>

<body>

    <div class="d-flex" id="wrapper">

        <jsp:include page="/WEB-INF/views/sidebar.jsp" />

        <!-- Page Content -->
        <div id="page-content-wrapper">

            <jsp:include page="/WEB-INF/views/topbar.jsp" />

            <div class="container-fluid">
            
            	<br>
            
            	<table width="100%" border="1" align="center" cellpadding="0"cellspacing="1">
            		<tbody>
                	<tr>
	                	<td width="120" align="center" bgcolor="eeeeee" height="30">회원 가입일</td>
	                	<td>&nbsp&nbsp</td>
	                	<td width="120" align="center" bgcolor="eeeeee" height="30">보유 포인트</td>
	                	<td>&nbsp&nbsp</td>
                	</tr>
                	<tr>
	                	<td width="120" align="center" bgcolor="eeeeee" height="30">회원 정보 수정</td>
	                	<td>&nbsp&nbsp<a href=#>회원 정보 수정하기</a></td>
	                	<td width="120" align="center" bgcolor="eeeeee" height="30">회원 탈퇴</td>
	                	<td>&nbsp&nbsp<a href=#>회원탈퇴하기</a></td>
                	</tr>
                	</tbody>
                </table>
                
				<br>
			
				<table width="100%" border="0" align="center" cellpadding="0"cellspacing="1">
					<tbody>
					<tr>
					<td width="50%" valign="top" align="left">
						<table width="100%" border="1" align="center" cellpadding="0"cellspacing="0">
							<tbody>
								<tr>
									<td style="position:relative;" bgcolor="eeeeee">
									<div>내가 작성한 게시물 목록</div>
									<span style="position:absolute; right:10px; top:1px;">
										<a href=#>더보기</a>
									</span>
									</td>
								</tr>
								<tr>
									<td>
										<table width="100%">
											<tbody>
												<tr>
													<td><a href=#>이것이야 말로 최고!!</a></td>
													<td>2020-04-08</td>
												</tr>
												<tr>
													<td><a href=#>믿을 만한 정보!!</a></td>
													<td>2020-04-08</td>
												</tr>
												<tr>
													<td><a href=#>믿을 만한 정보!!</a></td>
													<td>2020-04-08</td>
												</tr>
												<tr>
													<td><a href=#>믿을 만한 정보!!</a></td>
													<td>2020-04-08</td>
												</tr>
												<tr>
													<td><a href=#>믿을 만한 정보!!</a></td>
													<td>2020-04-08</td>
												</tr>
												<tr>
													<td><a href=#>믿을 만한 정보!!</a></td>
													<td>2020-04-08</td>
												</tr>
												<tr>
													<td><a href=#>믿을 만한 정보!!</a></td>
													<td>2020-04-08</td>
												</tr>
											</tbody>
										
										</table>

									</td>
								</tr>
							</tbody>
						</table>
					</td>
					<td width="10"></td>
					<td valign="top">
						<table width="100%" border="1" align="center" cellpadding="0"cellspacing="0" >
							<tbody>
								<tr>
									<td style="position:relative;" bgcolor="eeeeee">
									<div>내가 작성한 댓글 목록</div>
									<span style="position:absolute; right:10px; top:1px;">
										<a href=#>더보기</a>
									</span>
									</td>
								</tr>
								<tr>
									<td>작성된 글이 없습니다.
									</td>
								</tr>
							</tbody>
						</table>
					</td>
					</tr>
					
					<tr height="10px"></tr>
					
					<tr>
					<td valign="top" align="left">
						<table width="100%" border="1" align="center" cellpadding="0"cellspacing="0">
							<tbody>
								<tr>
									<td style="position:relative;" bgcolor="eeeeee">
									<div>내가 스크랩 한 목록</div>
									<span style="position:absolute; right:10px; top:1px;">
										<a href=#>더보기</a>
									</span>
									</td>
								</tr>
								<tr>
									<td>작성된 글이 없습니다.
									</td>
								</tr>
							</tbody>
						</table>
					</td>
					<td width="10"></td>
					<td valign="top">
						<table width="100%" border="1" align="center" cellpadding="0"cellspacing="0">
							<tbody>
								<tr>
									<td style="position:relative;" bgcolor="eeeeee">
									<div>내가 보낸 쪽지 목록</div>
									<span style="position:absolute; right:10px; top:1px;">
										<a href=#>더보기</a>
									</span>
									</td>
								</tr>
								<tr>
									<td>작성된 글이 없습니다.
									</td>
								</tr>
							</tbody>
						</table>
					</td>
					</tr>
					</tbody>
				</table>
				
              
            </div>
        </div>
		
		
		
		
        <!-- /#page-content-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- Bootstrap core JavaScript -->
    <script src="/corona/resources/vendor/jquery/jquery.min.js"></script>
    <script src="/corona/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="/corona/resources/datatables/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="/corona/resources/datatables/jquery.dataTables.min.js"></script>
    <script src="/corona/resources/datatables/dataTables.bootstrap4.min.js"></script>
    
    <!-- Page level custom scripts -->
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

</body>

</html>