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
                            <input type="text" class="form-control" placeholder="주소">
                        </div>
                        <div class="form-group col-md-2">
                            <button class="btn btn-primary form-control" type="button" data-toggle="collapse"
                                data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
                                주소로 검색
                            </button>
                        </div>
                    </div>
                </div>

                <div class="collapse col-md-12" id="collapseExample">
                    <div class="row">
                        <div id="map" class="col-md-6" style="height:600px;background-color:green;">
                            지도
                        </div>
                        <div class="col-md-6">
                            <table id="dataTable" class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th>상호명</th>
                                        <th>위치</th>
                                        <th>재고량</th>
                                        <th>입고시간</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>Tiger Nixon</td>
                                        <td>System Architect</td>
                                        <td>Edinburgh</td>
                                        <td>61</td>
                                    </tr>
                                    <tr>
                                        <td>Garrett Winters</td>
                                        <td>Accountant</td>
                                        <td>Tokyo</td>
                                        <td>63</td>
                                    </tr>
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
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="/corona/resources/datatables/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="/corona/resources/datatables/jquery.dataTables.min.js"></script>
    <script src="/corona/resources/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="/corona/resources/datatables/datatables-demo.js"></script>

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
		$(function() {
			$("#dataTable_wrapper").children().eq(0).remove();
		});
    </script>

</body>

</html>