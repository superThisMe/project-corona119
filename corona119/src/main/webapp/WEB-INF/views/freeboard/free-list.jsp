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
                                        
                    <ul class="tabs" id="tabs">
						<li class="tab-link current" data-tab="tab-1">전체</li>
						<li class="tab-link" data-tab="tab-2">일반</li>
						<li class="tab-link" data-tab="tab-3">시사</li>
						<c:if test="${sessionScope.loginuser != null }" >
							<a href="/corona/freeboard/free-write" class="btn btn-success btn-sm" style="float:right; margin:8px;"> 
		              			<span class="text">글 쓰기</span>
		              		</a>
              			</c:if>
              	
					</ul>
					
				
				
				<div id="tab-1" class="tab-content current">
                    
                    <jsp:include page="/WEB-INF/views/freeboard/tap/tap1.jsp" />
                                    
                </div>
                
                <div id="tab-2" class="tab-content">
                
					<jsp:include page="/WEB-INF/views/freeboard/tap/tap2.jsp" />
					
				</div>
				
				<div id="tab-3" class="tab-content">
				
					<jsp:include page="/WEB-INF/views/freeboard/tap/tap3.jsp" />
					
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

  <!--   <!-- Page level custom scripts -->
    <script src="/corona/resources/datatables/datatables-demo.js"></script> -->

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

	$(document).ready(function(){
		
		$('ul.tabs li').click(function(){
			var tab_id = $(this).attr('data-tab');

			$('ul.tabs li').removeClass('current');
			$('.tab-content').removeClass('current');

			$(this).addClass('current');
			$("#"+tab_id).addClass('current');
		})
		
		var test = $('table').DataTable({
			"order":  [[0, 'desc']]
		});


	})
		
	</script>
	
	
	 

	

</body>

</html>