<%@page import="java.util.regex.Matcher"%>
<%@page import="java.util.regex.Pattern"%>
<%@page import="org.jsoup.nodes.Element"%>
<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>
<%@ page import="org.jsoup.Jsoup" %>
<%@ page import="org.jsoup.nodes.Document" %>
<%@ page import="org.jsoup.select.Elements"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="ko">

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>코로나 119 - 신종 코로나 바이러스 종합 정보 포털</title>

	<jsp:include page="/WEB-INF/views/ccss.jsp" />

</head>

<body>

    <div class="d-flex" id="wrapper">

        <jsp:include page="/WEB-INF/views/sidebar.jsp" />

        <!-- Page Content -->
        <div id="page-content-wrapper">

            <jsp:include page="/WEB-INF/views/topbar.jsp" />

            <div class="container-fluid">
                <h4 class="mt-4">확진자 이동경로 (서울시)</h4>
                <div id="map" style="height:800px"></div>
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
    
    <!-- DAUM Map API -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=cabf55639c1474c9f288939642d439aa&libraries=services,clusterer,drawing"></script>

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
    
    <!-- Map Script -->
    <script type="text/javascript">

    	$(function() {

    		// 지도에 표시된 마커 객체를 가지고 있을 배열입니다
    		var markers = [];
    		
    		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    		    mapOption = {
    		        center: new kakao.maps.LatLng(37.5509662, 126.9886503), // 지도의 중심좌표
    		        level: 8 // 지도의 확대 레벨
    		    };

    		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

    		// 마커 이미지의 이미지 주소입니다
    		var imageSrc = "/corona/resources/img/marker_red.png"; 
    		    
   		    // 마커 이미지의 이미지 크기 입니다
   		    var imageSize = new kakao.maps.Size(35, 34); 
   		    
   		    // 마커 이미지를 생성합니다    
   		    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);

	   		var latLngs = new Array(); 
	   		<c:forEach items="${ latLngs }" var="latLng">
	   		latLngs.push("${ latLng }");
	   		</c:forEach>
	   		var moves = new Array(); 
	   		<c:forEach items="${ moves }" var="move">
	   		moves.push("${ move }");
	   		</c:forEach>

   		    for (var i = 0; i < moves.length; i++) {

   	   		    var numLatLng = latLngs[i].split("|");
   		    	
				var marker = new kakao.maps.Marker({
			        map: map, // 마커를 표시할 지도
			        position: new kakao.maps.LatLng(numLatLng[0], numLatLng[1]), // 마커를 표시할 위치
			        title : moves[i], // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
			        image : markerImage // 마커 이미지 
			    });

				marker.setMap(map);
       		    
       		}
       		
    		function replaceAll(str, searchStr, replaceStr) {
    			  return str.split(searchStr).join(replaceStr);
    		}
        	
        });
		
    </script>
    
</body>

</html>