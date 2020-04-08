<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>

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

    <!-- Sidebar -->
    <div class="bg-light border-right" id="sidebar-wrapper">
      <div class="sidebar-heading"><a href="/corona"><b>코로나 119</b></a></div>
      <div class="list-group list-group-flush">
        <a href="#" class="list-group-item list-group-item-action bg-light">공지사항</a>
        <a href="#" class="list-group-item list-group-item-action bg-light">뉴스&#38;이슈</a>
        <a href="#" class="list-group-item list-group-item-action bg-light">봉사활동</a>
        <a href="#" class="list-group-item list-group-item-action bg-light">무료나눔</a>
        <a href="#" class="list-group-item list-group-item-action bg-light">자유게시판</a>
        <a href="#" class="list-group-item list-group-item-action bg-light">공적마스크 현황</a>
      </div>
    </div>
    <!-- /#sidebar-wrapper -->

    <!-- Page Content -->
    <div id="page-content-wrapper">

      <nav class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
        <button class="btn btn-primary" id="menu-toggle">메뉴 닫기</button>

        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav ml-auto mt-2 mt-lg-0">
            <li class="nav-item active">
              <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
              <button type="button" class="btn btn-link" data-toggle="modal" data-target="#registerModal">
  				회원가입
			  </button>
			  <button type="button" class="btn btn-link" data-toggle="modal" data-target="#loginModal">
  				로그인
			  </button>
            </li>
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				회원정보(임시)
              </a>
              <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
                <a class="dropdown-item" href="#">마이페이지</a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="#">쪽지함</a>
              </div>
            </li>
          </ul>
        </div>
      </nav>

      <div class="container-fluid">
        <h1 class="mt-4">test text</h1>
        <p>The starting state of the menu will appear collapsed on smaller screens, and will appear non-collapsed on larger screens. When toggled using the button below, the menu will change.</p>
        <p>Make sure to keep all page content within the <code>#page-content-wrapper</code>. The top navbar is optional, and just for demonstration. Just create an element with the <code>#menu-toggle</code> ID which will toggle the menu when clicked.</p>
      </div>
    </div>
    
    <!-- Modal 1 -->
    <div class="modal fade" id="registerModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    	<div class="modal-dialog" role="document">
    		<div class="modal-content">
    			<div class="modal-header">
        			<h5 class="modal-title" id="exampleModalLabel">회원가입</h5>
        			<button type="button" class="close" data-dismiss="modal" aria-label="Close">
          			<span aria-hidden="true">&times;</span>
        			</button>
      			</div>
    			<div class="modal-body">
				    <form>
						<div class="form-row">
							<div class="form-group col-md-6">
								<label for="inputEmail4">아이디</label> <input type="text"
									class="form-control" id="memberId">
							</div>
							<div class="form-group col-md-6">
								<label for="inputPassword4">비밀번호</label> <input type="password"
									class="form-control" id="memberPsw">
							</div>
						</div>
						<div class="form-group">
							<label for="inputAddress">이메일</label> <input type="email"
								class="form-control" id="memberEmail" placeholder="1234@abcd.com">
						</div>
						<div class="form-row">
							<div class="form-group col-md-6">
								<label for="inputEmail4">이름</label> <input type="text"
									class="form-control" id="memberName">
							</div>
							<div class="form-group col-md-6">
								<label for="inputPassword4">닉네임</label> <input type="text"
									class="form-control" id="memberNickname">
							</div>
						</div>
						<div class="form-group">
							<label for="inputAddress">Address</label> <input type="text"
								class="form-control" id="inputAddress" placeholder="1234 Main St">
						</div>
						<div class="form-group">
							<label for="inputAddress2">Address 2</label> <input type="text"
								class="form-control" id="inputAddress2"
								placeholder="Apartment, studio, or floor">
						</div>
						<div class="form-row">
							<div class="form-group col-md-6">
								<button type="button" class="btn btn-info">회원약관</button>
							</div>
							<div class="form-check">
								<input class="form-check-input" type="checkbox" id="gridCheck">
								<label class="form-check-label" for="gridCheck">동의합니다</label>
							</div>
						</div>
						<div align="right">
							<button type="submit" class="btn btn-primary">완료</button>
						</div>
					</form>
				</div>
				<div class="modal-footer">
      			</div>
			</div>
		</div>
	</div>
	
	<!-- Modal 2 -->
	<div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    	<div class="modal-dialog" role="document">
    		<div class="modal-content">
    			<div class="modal-header">
        			<h5 class="modal-title" id="exampleModalLabel">로그인</h5>
        			<button type="button" class="close" data-dismiss="modal" aria-label="Close">
          			<span aria-hidden="true">&times;</span>
        			</button>
      			</div>
    			<div class="modal-body">
				    <form>
					  <div class="form-group">
					    <label for="exampleInputEmail1">아이디</label>
					    <input type="text" class="form-control" id="id">
					  </div>
					  <div class="form-group">
					    <label for="exampleInputPassword1">비밀번호</label>
					    <input type="password" class="form-control" id="exampleInputPassword1">
					  </div>
					  <div align="right">
					  	<button type="submit" class="btn btn-primary">로그인</button>
					  </div>
					</form>
				</div>
				<div class="modal-footer">
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

  <!-- Menu Toggle Script -->
  <script>
    $("#menu-toggle").click(function(e) {
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
