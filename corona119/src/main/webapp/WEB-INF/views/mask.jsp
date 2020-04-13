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
                                data-target="#collapseExample" aria-expanded=false aria-controls="collapseExample">
                                주소로 검색
                            </button>
                        </div>
                    </div>
                </div>

                <div class="collapse col-md-12" id="collapseExample">
                    <div class="row">
                        <div id="map" class="col-md-6" style="height:650px;">
                        </div>
                        <div class="col-md-6">
                            <table id="dataTable" class="table table-borderless" style="font-size:8pt;">
                                <thead class="thead-light">
                                    <tr>
                                        <th>상호명</th>
                                        <th>위치</th>
                                        <th>재고량</th>
                                        <th>입고시간</th>
                                    </tr>
                                </thead>
                                <tbody>
                                
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

	<!-- DAUM Map API -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=cabf55639c1474c9f288939642d439aa&libraries=clusterer"></script>

    <script type="text/javascript">
		$(function() {

			var options = null;
			
			var Markers = [];

			var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스

			var iwContent = null;
            var iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다
			
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
						options = { //지도를 생성할 때 필요한 기본 옵션
							center: new kakao.maps.LatLng(stores[0].lat, stores[0].lng), //지도의 중심좌표.
							level: 3 //지도의 레벨(확대, 축소 정도)
						};
						var imageSrc = null, // 마커이미지의 주소입니다    
					    	imageSize = new kakao.maps.Size(35, 34); // 마커이미지의 크기입니다

					    var markerImage = null;

						var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
					    // 마커 클러스터러를 생성합니다 
					    var clusterer = new kakao.maps.MarkerClusterer({
					        map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
					        averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
					        minLevel: 3 // 클러스터 할 최소 지도 레벨 
					    });
						
						$.each(stores, function(i, data) {	
							
							// 마커를 클릭했을 때 마커 위에 표시할 인포윈도우를 생성합니다
				            iwContent = '<div class="card" style="width: 18rem;">'
			            	iwContent += '<div class="card-body">'
			            	iwContent += '<h5 class="card-title">' + data.name + '</h5>'
			            	iwContent += '<p class="card-text">' + data.addr + '</p>'
			            	iwContent += '<a href="#" class="btn btn-primary">번호표</a>'
			            	iwContent += '</div>'
			            	iwContent += '</div>'; // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
													
							var remain_stat = null;
							var body = null;
				            if (data.remain_stat === "plenty") {	// 재고 많음
					            
					            remain_stat = "많음";
					            body = "<tr class='table-success'>";
					            
					            imageSrc = "/corona/resources/img/marker_green.png";
					            markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
					            
					            var plentyMarker = new kakao.maps.Marker({
					                    position : new kakao.maps.LatLng(data.lat, data.lng),
			                    		image : markerImage,	// 마커이미지 연결
			                    		clickable: true // 마커를 클릭했을 때 지도의 클릭 이벤트가 발생하지 않도록 설정합니다
					                });

								clusterer.addMarker(plentyMarker);
								
								// 인포윈도우를 생성합니다
								var infowindow = new kakao.maps.InfoWindow({
								    content : iwContent,
								    removable : iwRemoveable
								});

								kakao.maps.event.addListener(plentyMarker, 'click', function() {
								      // 마커 위에 인포윈도우를 표시합니다
								      infowindow.open(map, plentyMarker);
								      $('.card-title').html(data.name + "(많음)").attr('style', "color:green");
								});
				                
					        } else if (data.remain_stat === "some") {	// 재고 보통
						        
					        	remain_stat = "보통";
					        	body = "<tr class='table-warning'>";
					            imageSrc = "/corona/resources/img/marker_yellow.png"
					            markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize)
					            var someMarker = new kakao.maps.Marker({
					                    position : new kakao.maps.LatLng(data.lat, data.lng),
			                    		image : markerImage,	// 마커이미지 연결
			                    		clickable: true // 마커를 클릭했을 때 지도의 클릭 이벤트가 발생하지 않도록 설정합니다
					                });

								clusterer.addMarker(someMarker);
								
								// 인포윈도우를 생성합니다
								var infowindow = new kakao.maps.InfoWindow({
								    content : iwContent,
								    removable : iwRemoveable
								});

								kakao.maps.event.addListener(someMarker, 'click', function() {
								      // 마커 위에 인포윈도우를 표시합니다
								      infowindow.open(map, someMarker);
								      $('.card-title').html(data.name + "(보통)").attr('style', "color:orange");
								});
								
						    } else if (data.remain_stat === "few") {	// 재고 적음
							    
						    	remain_stat = "적음";
						    	body = "<tr class='table-danger'>";
					            imageSrc = "/corona/resources/img/marker_red.png"
						            markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize)
						            var fewMarker = new kakao.maps.Marker({
						                    position : new kakao.maps.LatLng(data.lat, data.lng),
				                    		image : markerImage,	// 마커이미지 연결
				                    		clickable: true // 마커를 클릭했을 때 지도의 클릭 이벤트가 발생하지 않도록 설정합니다
						                });

								clusterer.addMarker(fewMarker);
								
								// 인포윈도우를 생성합니다
								var infowindow = new kakao.maps.InfoWindow({
								    content : iwContent,
								    removable : iwRemoveable
								});

								kakao.maps.event.addListener(fewMarker, 'click', function() {
								      // 마커 위에 인포윈도우를 표시합니다
								      infowindow.open(map, fewMarker);
								      $('.card-title').html(data.name + "(적음)").attr('style', "color:red");
								});
								
						    } else if (data.remain_stat === "empty") {	// 재고 없음
							    
						    	remain_stat = "없음";
						    	body = "<tr class='table-dark'>";
					            imageSrc = "/corona/resources/img/marker_grey.png"
						            markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize)
						            var emptyMarker = new kakao.maps.Marker({
						                    position : new kakao.maps.LatLng(data.lat, data.lng),
				                    		image : markerImage,	// 마커이미지 연결
				                    		clickable: true // 마커를 클릭했을 때 지도의 클릭 이벤트가 발생하지 않도록 설정합니다
						                });

								clusterer.addMarker(emptyMarker);
								
								// 인포윈도우를 생성합니다
								var infowindow = new kakao.maps.InfoWindow({
								    content : iwContent,
								    removable : iwRemoveable
								});

								kakao.maps.event.addListener(emptyMarker, 'click', function() {
								      // 마커 위에 인포윈도우를 표시합니다
								      infowindow.open(map, emptyMarker);
								      $('.card-title').html(data.name + "(없음)").attr('style', "color:grey");
								      
								});
								
						    } else if (data.remain_stat === "break") {	// 판매중지
							    
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

						$("#collapseExample").on("shown.bs.collapse", function() {

							$("#collapseExample").on("hide.bs.collapse", function() {
								location.reload();
							});

							$.each(Markers, function(i, marker) {
							});
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

			
			
		});
    </script>

</body>

</html>