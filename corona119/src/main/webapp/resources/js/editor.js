var config = {
	txHost : '', /* 런타임 시 리소스들을 로딩할 때 필요한 부분으로, 경로가 변경되면 이 부분 수정이 필요. ex) http://xxx.xxx.com */
	txPath : '', /* 런타임 시 리소스들을 로딩할 때 필요한 부분으로, 경로가 변경되면 이 부분 수정이 필요. ex) /xxx/xxx/ */
	txService : 'sample', /* 수정필요없음. */
	txProject : 'sample', /* 수정필요없음. 프로젝트가 여러개일 경우만 수정한다. */
	initializedId : "", /* 대부분의 경우에 빈문자열 */
	wrapper : "tx_trex_container", /* 에디터를 둘러싸고 있는 레이어 이름(에디터 컨테이너) */
	form : 'tx_editor_form' + "", /* 등록하기 위한 Form 이름 */
	txIconPath : "/corona/resources/daumOpenEditor/images/icon/editor/", /* 에디터에 사용되는 이미지 디렉터리, 필요에 따라 수정한다. */
	txDecoPath : "/corona/resources/daumOpenEditor/images/deco/contents/", /* 본문에 사용되는 이미지 디렉터리, 서비스에서 사용할 때는 완성된 컨텐츠로 배포되기 위해 절대경로로 수정한다. */
	canvas : {
		exitEditor : { /* desc:'빠져 나오시려면 shift+b를 누르세요.', hotKey: { shiftKey:true, keyCode:66 }, nextElement: document.getElementsByTagName('button')[0] */},
		styles : {
			color : "#123456", /* 기본 글자색 */
			fontFamily : "굴림", /* 기본 글자체 */
			fontSize : "10pt", /* 기본 글자크기 */
			backgroundColor : "#fff", /*기본 배경색 */
			lineHeight : "1.5", /*기본 줄간격 */
			padding : "8px" /* 위지윅 영역의 여백 */
		},
		showGuideArea : false
	},
	events : {
		preventUnload : false
	},
	sidebar : {
		attachbox : {
			show : true,
			confirmForDeleteAll : true
		},
		// 이미지첨부 관련 추가 config 
		attacher : { 
			image : { 
				features : { left : 250, top : 65, width : 400, height : 190, scrollbars : 0 }, //팝업창 사이즈 
				popPageUrl : '/corona/daumOpenEditor/imagePopup' //팝업창 주소 
			},
			file:{ 
				features : { left : 250, top : 65, width : 400, height : 190, scrollbars : 0 }, // 팝업창 사이즈 
				popPageUrl:'/corona/daumOpenEditor/filePopup' // 팝업창 주소 
			}
		},
		capacity : { 
			maximum : 5*1024*1024 // 최대 첨부 용량 (5MB) 
		}
	},
	size : {
		contentWidth : 700
	/* 지정된 본문영역의 넓이가 있을 경우에 설정 */}
};
EditorJSLoader.ready(function(Editor) {
	var editor = new Editor(config);
});
function validForm(editor) {
	var validator = new Trex.Validator();
	var content = editor.getContent();
	if (!validator.exists(content)) {
		alert('내용을 입력하세요');
		return false;
	}
	return true;
}
function setForm(editor) {
	var i, input;
	var form = editor.getForm();
	var content = editor.getContent();

	// 본문 내용을 필드를 생성하여 값을 할당하는 부분
	var textarea = document.createElement('textarea');
	textarea.name = 'boardContent'; //name값 수정
	textarea.value = content;
	form.createField(textarea);

	/* 아래의 코드는 첨부된 데이터를 필드를 생성하여 값을 할당하는 부분으로 상황에 맞게 수정하여 사용한다.
	첨부된 데이터 중에 주어진 종류(image,file..)에 해당하는 것만 배열로 넘겨준다. */
	var images = editor.getAttachments('image');
	for (i = 0; i < images.length; i++) {
       // existStage는 현재 본문에 존재하는지 여부
		if (images[i].existStage) {
       // data는 팝업에서 execAttach 등을 통해 넘긴 데이터
//			alert('attachment information - image[' + i + '] \r\n' + JSON.stringify(images[i].data));
		//originalname	filesize
			inputurl = document.createElement('input');
			inputurl.type = 'hidden';
			//inputurl.name = 'attach_image';
			inputurl.name = 'imagePath';
			inputurl.value = images[i].data.imageurl;  // 예에서는 이미지경로만 받아서 사용
			form.createField(inputurl);
			
			inputreal = document.createElement('input');
			inputreal.type = 'hidden';
			inputreal.name = 'imageReal';
			inputreal.value = images[i].data.filename;  // 예에서는 이미지경로만 받아서 사용
			form.createField(inputreal);
			
			inputsize = document.createElement('input');
			inputsize.type = 'hidden';
			inputsize.name = 'imageSize';
			inputsize.value = images[i].data.filesize;  // 예에서는 이미지경로만 받아서 사용
			form.createField(inputsize);
		}
	}
	
	var files = editor.getAttachments('file');
	for (i = 0; i < files.length; i++) {
		input = document.createElement('input');
		input.type = 'hidden';
		input.name = 'attach_file';
		input.value = files[i].data.attachurl;
		form.createField(input);
   	}
	return true;
}