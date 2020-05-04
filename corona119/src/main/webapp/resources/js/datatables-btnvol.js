$(function() {
	$('#dataTableVol').DataTable({
		"stateSave" : true,
		"pagingType" : "first_last_numbers",
		"language" : {
			"search" : "검색어 ",
			"lengthMenu" : "페이지 당 게시글 수 _MENU_ ",
			"zeroRecords" : "등록된 글이 없습니다",
			"info" : "<a href='/corona/volunteer/write' class='btn btn-primary'>글쓰기</a>",
			"infoEmpty" : "<a href='/corona/volunteer/write' class='btn btn-primary'>글쓰기</a>",
			"infoFiltered" : "",
			"paginate" : {
				"first" : '처음',
				"last" : '마지막',
				"previous" : '&lt',
				"next" : '&gt'
			}
		},
		"columns": [
		    { "width": "55px" },
		    null,
		    { "width": "110px" },
		    { "width": "50px" },
		    { "width": "70px" }
		]
	});
	$("#dataTableVol_info").css({"padding" : "0" , "margin" : "2px 0"});
});