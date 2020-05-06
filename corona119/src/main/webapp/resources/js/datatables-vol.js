$(function() {
	var table = $('#dataTableVol').DataTable({
		"stateSave" : true,
		"pagingType" : "first_last_numbers",
		"language" : {
			"search" : "검색어 ",
			"lengthMenu" : "페이지 당 게시글 수 _MENU_ ",
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
	
	$('#seoulMap area').each(function(index, item){
		$(item).on('mouseover', function(){
			$('#seoul-map-image').attr('src', '/corona/resources/img/map/img_map_s' + (index + 1) + '.gif');	
		});
		$(item).on('click', function(){
			$('#areaSearch').val($(this).attr('alt'));
			filterColumn(3);
		});
	});
	
	$('#viewAllAreaBtn').on('click', function(){
		$('#areaSearch').val("");
		filterColumn(3);
	});
	
	function filterColumn ( i ) {
	    $('#dataTableVol').DataTable().column( i ).search(
	        $('#areaSearch').val()
	    ).draw();
	}

	$(document).on('change', '#confirmExt', function() {
		
		$.fn.dataTable.ext.search.push (
			function( settings, data, dataIndex ) {
				var exc = $('#confirmExtSearch').val();

				if (exc != null) {
					var vfw = data[4];
					var ref = new RegExp(exc, 'g');
				
					if (vfw.match(ref)){	
						return false;
					}
					return true;
				}
			}
		);
		
		if($("#confirmExt").is(":checked")) {
			$('#confirmExtSearch').val("종료");
		} else {
			$('#confirmExtSearch').val("dummyFinalProject");
		}
		table.draw();
	});
	

});