<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <title>CORONA119 관리자 페이지</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description" />
        <meta content="Coderthemes" name="author" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <!-- App favicon -->
        <link rel="shortcut icon" href="/corona/resources/assets/images/favicon.ico">

        <!-- App css -->
        <link href="/corona/resources/assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="/corona/resources/assets/css/icons.min.css" rel="stylesheet" type="text/css" />
        <link href="/corona/resources/assets/css/app.min.css" rel="stylesheet" type="text/css" />

    </head>


    <body class="authentication-bg" style="background:linear-gradient(180deg, black, gray) !important;">

        <div class="home-btn d-none d-sm-block">
            <a href="/corona/"><i class="fas fa-home h2 text-dark"></i></a>
        </div>

        <div class="account-pages mt-5 mb-5">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-8 col-lg-6 col-xl-5">
                        <div class="text-center">
                            <a href="/corona/">
                                <span><img src="/corona/resources/assets/images/logo-light.png" alt="" height="22"></span>
                            </a>
                            <p class="text-muted mt-2 mb-4"></p>
                        </div>
                        <div class="card">

                            <div class="card-body p-4">
                                
                                <div class="text-center mb-4">
                                    <h4 class="text-uppercase mt-0 mb-4">코로나119 관리자</h4>
                                    <img src="/corona/resources/assets/images/users/user-1.jpg" width="88" alt="user-image" class="rounded-circle img-thumbnail">
                                    <p class="text-muted my-4">관리자 비밀번호를 입력해주십시오.</p>

                                </div>

                                <form action="/corona/login" method="POST">
									<input type="hidden" name="memberId" value="admin">
                                    <div class="form-group mb-3">
                                        <label for="password">Password</label>
                                        <input class="form-control" type="password" required="" id="password" name="memberPsw" placeholder="Enter your password">
                                    </div>

                                    <div class="form-group mb-0 text-center">
                                        <button id="adminLoginBtn" class="btn btn-primary btn-block" type="submit"> Log In </button>
                                    </div>

                                </form>
    
                            </div> <!-- end card-body -->
                        </div>
                        <!-- end card -->

                        <div class="row mt-3">
                            <div class="col-12 text-center">
                                <!-- <p class="text-muted">Not you? return <a href="pages-login.html" class="text-dark ml-1"><b>Sign In</b></a></p> -->
                            </div> <!-- end col -->
                        </div>
                        <!-- end row -->

                    </div> <!-- end col -->
                </div>
                <!-- end row -->
            </div>
            <!-- end container -->
        </div>
        <!-- end page -->
    

        <!-- Vendor js -->
        <script src="/corona/resources/assets/js/vendor.min.js"></script>

        <!-- App js -->
        <script src="/corona/resources/assets/js/app.min.js"></script>
        
        <script type="text/javascript">
        
        </script>
        
    </body>
</html>