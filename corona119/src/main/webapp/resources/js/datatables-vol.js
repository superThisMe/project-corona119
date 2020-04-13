$(function() {
	$('#dataTableVol').DataTable({
		"stateSave" : true,
		"pagingType" : "first_last_numbers",
		"language" : {
			"zeroRecords" : "등록된 글이 없습니다",
			"info" : "",
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