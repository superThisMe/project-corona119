var container = document.getElementById('volMap'); // 지도를 담을 영역의 DOM 레퍼런스
var options = { // 지도를 생성할 때 필요한 기본 옵션
	center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표.
	level : 3
// 지도의 레벨(확대, 축소 정도)
};

var map = new kakao.maps.Map(container, options); // 지도 생성 및 객체 리턴
var geocoder = new kakao.maps.services.Geocoder(); // 주소-좌표 변환 객체를 생성합니다

// 주소로 좌표를 검색합니다
var detailAddr = document.getElementById('detailAddr').value;
geocoder.addressSearch(detailAddr, function(result, status){
	// 정상적으로 검색이 완료됐으면
	if (status === kakao.maps.services.Status.OK) {
		var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

		// 결과값으로 받은 위치를 마커로 표시합니다
		var marker = new kakao.maps.Marker({
			map : map,
			position : coords
		});
		//document.getElementById('search_lat').value = result[0].y;
		//document.getElementById('search_lng').value = result[0].x;
	
		// 인포윈도우로 장소에 대한 설명을 표시합니다
//		var infowindow = new kakao.maps.InfoWindow({
//			content : '<div style="width:100px;text-align:center;padding:2px 0;">위치</div>'
//		});
//		infowindow.open(map, marker);
		
		var roadviewContainer = document.getElementById('roadview'); //로드뷰를 표시할 div
		var roadview = new kakao.maps.Roadview(roadviewContainer); //로드뷰 객체
		var roadviewClient = new kakao.maps.RoadviewClient(); //좌표로부터 로드뷰 파노ID를 가져올 로드뷰 helper객체

		var position = new kakao.maps.LatLng(result[0].y, result[0].x);

		// 특정 위치의 좌표와 가까운 로드뷰의 panoId를 추출하여 로드뷰를 띄운다.
		roadviewClient.getNearestPanoId(position, 50, function(panoId) {
		    roadview.setPanoId(panoId, position); //panoId와 중심좌표를 통해 로드뷰 실행
		});

		// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		map.setCenter(coords);
	}
});