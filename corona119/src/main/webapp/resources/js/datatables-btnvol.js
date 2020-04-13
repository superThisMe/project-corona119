$(function() {
	$('#dataTableVol').DataTable({
		"stateSave" : true,
		"pagingType" : "first_last_numbers",
		"language" : {
			"zeroRecords" : "등록된 글이 없습니다",
//			"info" : "<button class='btn btn-primary' id='volWrite' type='button'>글쓰기</button>",
			"info" : "<a href='/corona/volunteer/board/write' class='btn btn-primary'>글쓰기</a>",
			"infoEmpty" : "",
			"infoFiltered" : "",
			"paginate" : {
				"first" : '처음',
				"last" : '마지막',
				"previous" : '&lt',
				"next" : '&gt'
			}
		}
	});
	$("#dataTableVol_info").css({"padding" : "0" , "margin" : "2px 0"});
});