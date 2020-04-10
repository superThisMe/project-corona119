// Call the dataTables jQuery plugin
$(document).ready(function() {
//	$('#dataTable').DataTable();
	$('#dataTable').DataTable({
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
});
