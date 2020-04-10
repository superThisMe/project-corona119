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
                <h4 class="mt-4">공적마스크 검색</h4>
                <br />
                <div id="content" class="col-md-12">
                    <div class="form-row">
                        <div class="form-group col-md-8">
                            <input type="text" id="address" class="form-control" placeholder="ex(서울특별시 구로구 or 경기도 수원시 팔달구)">
                        </div>
                        <div class="form-group col-md-2">
                            <button id="search-btn" class="btn btn-primary form-control" type="button" data-toggle="collapse"
                                data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
                                주소로 검색
                            </button>
                        </div>
                    </div>
                </div>

                <div class="collapse col-md-12" id="collapseExample">
                    <div class="row">
                        <div id="map" class="col-md-6" style="height:650px;background-color:green;">
                            지도
                        </div>
                        <div class="col-md-6">
                            <table id="dataTable" class="table table-bordered" style="font-size:10pt;">
                                <thead class="thead-light">
                                    <tr>
                                        <th>상호명</th>
                                        <th>위치</th>
                                        <th>재고량</th>
                                        <th>입고시간</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <%-- <c:forEach var="i" begin="1" end="50" step="1">
                                    <tr>
                                        <td>석창약국</td>
                                        <td>경기도 안양시</td>
                                        <td>보통</td>
                                        <td>2020-04-08 08:58</td>
                                    </tr>
                                    <tr>
                                        <td>정일약국</td>
                                        <td>서울시 영등포구</td>
                                        <td>많음</td>
                                        <td>2020-04-08 14:11</td>
                                    </tr>
                                </c:forEach> --%>
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

    <!-- Custom scripts for all pages-->
    <script src="/corona/resources/datatables/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="/corona/resources/datatables/jquery.dataTables.min.js"></script>
    <script src="/corona/resources/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <!-- <script src="/corona/resources/datatables/datatables-demo.js"></script> -->
    <script src="/corona/resources/js/common.js"></script>

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

	<!-- Daum Map API -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=cabf55639c1474c9f288939642d439aa"></script>
	
	<script type="text/javascript">
		var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
		var options = { //지도를 생성할 때 필요한 기본 옵션
			center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
			level: 3 //지도의 레벨(확대, 축소 정도)
		};
	
		var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴	
	</script>

    <script type="text/javascript">
		$(function() {
			
			$("#collapseExample").on("show.bs.collapse", function() {
				$("#address").attr('disabled', true);
				$("#search-btn").html("다시 검색");

				var addr = $("#address").val().replace(/ /gi, "%20");
				var rAddr = "https://8oi9s0nnth.apigw.ntruss.com/corona19-masks/v1/storesByAddr/json?address=" + addr;
				console.log(addr);
				console.log(rAddr);
				
				$.ajax({
					"url": rAddr,
					"method": "get",
					"async": true,
					"success": function(data, status, xhr) {

						var stores = data.stores;
						console.log(stores);
						$.each(stores, function(i, data) {
							var remain_stat = null;
							var body = null;
				            if (data.remain_stat === "plenty") {
					            remain_stat = "많음";
					            body = "<tr class='table-success'>";
					        } else if (data.remain_stat === "some") {
					        	remain_stat = "보통";
					        	body = "<tr class='table-warning'>";
						    } else if (data.remain_stat === "few") {
						    	remain_stat = "적음";
						    	body = "<tr class='table-danger'>";
						    } else if (data.remain_stat === "empty") {
						    	remain_stat = "없음";
						    	body = "<tr class='table-dark'>";
						    } else if (data.remain_stat === "break") {
						    	remain_stat = "중지";
						    	body = "<tr>";
						    }
				            body    += "<td>" + data.name + "</td>";
				            body    += "<td>" + data.addr + "</td>";
				            if (data.remain_stat != null) {
					            body += "<td>" + remain_stat + "</td>";
					        } else {
					        	body += "<td>없음</td>";
						    }
				            if (data.stock_at != null) {
					            body += "<td>" + data.stock_at + "</td>";
					        } else {
					        	body += "<td>없음</td>";
						    }
				            body    += "</tr>";
				            $( "tbody" ).append(body);
				        });
				        
						$('#dataTable').DataTable();
						
						$("#dataTable_wrapper").children().eq(0).remove();
						$("#dataTable_wrapper").children().eq(1).children().eq(0).remove();
					},
					"error": function(xhr, status, err) {
						alert("error: " + err.message);
					}
				});
			});

			$("#collapseExample").on("hide.bs.collapse", function() {
				location.reload();
			});
			
		});
    </script>

</body>

</html>