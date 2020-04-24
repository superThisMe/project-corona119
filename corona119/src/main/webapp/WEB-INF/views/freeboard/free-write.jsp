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

    <!-- Custom styles for this template -->
    <link href="/corona/resources/css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="/corona/resources/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

    <link href="/corona/resources/datatables/jquery.tap.css" rel="stylesheet">

    <!-- Daum Open Editor -->
    <link href="/corona/resources/daumOpenEditor/css/editor.css" rel="stylesheet" type="text/css" charset="utf-8" />



</head>

<body>

    <div class="d-flex" id="wrapper">

        <jsp:include page="/WEB-INF/views/sidebar.jsp" />

        <!-- Page Content -->
        <div id="page-content-wrapper">

            <jsp:include page="/WEB-INF/views/topbar.jsp" />

            <div class="container-fluid">

                <!-- Page Heading -->
                <h1 class="h3 mb-2 text-gray-800">자유게시판 글쓰기</h1>

                <form name="write-form" id="write-form" action="/corona/freeboard/freeSave" method="post"
							accept-charset="utf-8">
					

                    <table>
                        <tbody>
                            <tr>
                                <td style="width:10%;">제목 : </td>
                                <td><input style="width: 95%;" name="boardTitle" id="title" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">

                                    <jsp:include page="/WEB-INF/views/freeboard/daumEditor.jsp" />

                                    <input type="button" id="save" value="저장" />
                                    <input type="button" id="cancel" value="취소" />
                                </td>
                            </tr>
                        </tbody>
                    </table>



					<input name="memberNo" type="hidden" value="${ loginuser.memberNo }">
					<input name="catNo" type="hidden" value="3">
                </form>

            </div>
        </div>

        <!-- /#page-content-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- Bootstrap core JavaScript -->
    <script src="/corona/resources/vendor/jquery/jquery.min.js"></script>
    <script src="/corona/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>


    <!-- Core plugin JavaScript-->
    <script src="/corona/resources/datatables/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="/corona/resources/datatables/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="/corona/resources/datatables/jquery.dataTables.min.js"></script>
    <script src="/corona/resources/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="/corona/resources/datatables/datatables-demo.js"></script>

    <!-- Daum Open Editor -->
    <script src="/corona/resources/daumOpenEditor/js/editor_loader.js" type="text/javascript" charset="utf-8"></script>



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

    <script type="text/javascript">
        var config = {
            txHost: '', /* 런타임 시 리소스들을 로딩할 때 필요한 부분으로, 경로가 변경되면 이 부분 수정이 필요. ex) http://xxx.xxx.com */
            txPath: '', /* 런타임 시 리소스들을 로딩할 때 필요한 부분으로, 경로가 변경되면 이 부분 수정이 필요. ex) /xxx/xxx/ */
            txService: 'sample', /* 수정필요없음. */
            txProject: 'sample', /* 수정필요없음. 프로젝트가 여러개일 경우만 수정한다. */
            initializedId: "", /* 대부분의 경우에 빈문자열 */
            wrapper: "tx_trex_container", /* 에디터를 둘러싸고 있는 레이어 이름(에디터 컨테이너) */
            form: 'write-form' + "", /* 등록하기 위한 Form 이름 */
            txIconPath: "/corona/resources/daumOpenEditor/images/icon/editor/", /*에디터에 사용되는 이미지 디렉터리, 필요에 따라 수정한다. */
            txDecoPath: "/corona/resources/daumOpenEditor/images/deco/contents/", /*본문에 사용되는 이미지 디렉터리, 서비스에서 사용할 때는 완성된 컨텐츠로 배포되기 위해 절대경로로 수정한다. */
            canvas: {
                exitEditor: {
                    /*
                    desc:'빠져 나오시려면 shift+b를 누르세요.',
                    hotKey: {
                        shiftKey:true,
                        keyCode:66
                    },
                    nextElement: document.getElementsByTagName('button')[0]
                    */
                },
                styles: {
                    color: "#123456", /* 기본 글자색 */
                    fontFamily: "굴림", /* 기본 글자체 */
                    fontSize: "10pt", /* 기본 글자크기 */
                    backgroundColor: "#fff", /*기본 배경색 */
                    lineHeight: "1.5", /*기본 줄간격 */
                    padding: "8px" /* 위지윅 영역의 여백 */
                },
                showGuideArea: false
            },
            events: {
                preventUnload: false
            },
            sidebar: {
                attachbox: {
                    show: true,
                    confirmForDeleteAll: true
                }
            }
        };

        EditorJSLoader.ready(function (Editor) {
            var editor = new Editor(config);
        });
    </script>

    <script>
        $(function (event) {
            $("#save").click(function (event) {
                Editor.save();
            });
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
            textarea.name = 'boardContent';
            textarea.value = content;
            form.createField(textarea);

            return true;
        }

    </script>

    <script type="text/javascript">
        $(function () {
            $("#cancel").click(function (event) {
                location.href = "free-list"
            });
        })

    </script>




</body>

</html>