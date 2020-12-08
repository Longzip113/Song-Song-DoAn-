<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thành viên nhóm 14</title>

    <!-- Bootstrap core CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <style>

             #wrapper {
                overflow-x: hidden;
             }

            #sidebar-wrapper {
              min-height: 100vh;
              margin-left: -15rem;
              -webkit-transition: margin .25s ease-out;
              -moz-transition: margin .25s ease-out;
              -o-transition: margin .25s ease-out;
              transition: margin .25s ease-out;
            }

            #sidebar-wrapper .sidebar-heading {
              padding: 0.875rem 1.25rem;
              font-size: 1.2rem;
            }

            #sidebar-wrapper .list-group {
              width: 15rem;
            }

            #page-content-wrapper {
              min-width: 100vw;
            }

            #wrapper.toggled #sidebar-wrapper {
              margin-left: 0;
            }

            @media (min-width: 768px) {
              #sidebar-wrapper {
                margin-left: 0;
              }

              #page-content-wrapper {
                min-width: 0;
                width: 100%;
              }

              #wrapper.toggled #sidebar-wrapper {
                margin-left: -15rem;
              }
            }

            /* bonus for nav */
            .grad {
              background-image:radial-gradient(circle,violet,pink,orange);
            }
            /* bonus for content */
            .content-background{
              background-image: url("../img/background.jpg");
              background-size: 50%;
            }

        body{
            margin-top:20px;
            background:#f3f3f3;
        }

        .card.user-card {
            border-top: none;
            -webkit-box-shadow: 0 0 1px 2px rgba(0,0,0,0.05), 0 -2px 1px -2px rgba(0,0,0,0.04), 0 0 0 -1px rgba(0,0,0,0.05);
            box-shadow: 0 0 1px 2px rgba(0,0,0,0.05), 0 -2px 1px -2px rgba(0,0,0,0.04), 0 0 0 -1px rgba(0,0,0,0.05);
            -webkit-transition: all 150ms linear;
            transition: all 150ms linear;
        }

        .card {
            border-radius: 5px;
            -webkit-box-shadow: 0 1px 2.94px 0.06px rgba(4,26,55,0.16);
            box-shadow: 0 1px 2.94px 0.06px rgba(4,26,55,0.16);
            border: none;
            margin-bottom: 30px;
            -webkit-transition: all 0.3s ease-in-out;
            transition: all 0.3s ease-in-out;
        }

        .card .card-header {
            background-color: transparent;
            border-bottom: none;
            padding: 25px;
        }

        .card .card-header h5 {
            margin-bottom: 0;
            color: #222;
            font-size: 14px;
            font-weight: 600;
            display: inline-block;
            margin-right: 10px;
            line-height: 1.4;
        }

        .card .card-header+.card-block, .card .card-header+.card-block-big {
            padding-top: 0;
        }

        .user-card .card-block {
            text-align: center;
        }

        .card .card-block {
            padding: 25px;
        }

        .user-card .card-block .user-image {
            position: relative;
            margin: 0 auto;
            display: inline-block;
            padding: 5px;
            width: 110px;
            height: 110px;
        }

        .user-card .card-block .user-image img {
            z-index: 20;
            position: absolute;
            top: 5px;
            left: 5px;
                width: 100px;
            height: 100px;
        }

        .img-radius {
            border-radius: 50%;
        }

        .f-w-600 {
            font-weight: 600;
        }

        .m-b-10 {
            margin-bottom: 10px;
        }

        .m-t-25 {
            margin-top: 25px;
        }

        .m-t-15 {
            margin-top: 15px;
        }

        .card .card-block p {
            line-height: 1.4;
        }

        .text-muted {
            color: #919aa3!important;
        }

        .user-card .card-block .activity-leval li.active {
            background-color: #2ed8b6;
        }

        .user-card .card-block .activity-leval li {
            display: inline-block;
            width: 15%;
            height: 4px;
            margin: 0 3px;
            background-color: #ccc;
        }

        .user-card .card-block .counter-block {
            color: #fff;
        }

        .bg-c-blue {
            background: linear-gradient(45deg,#4099ff,#73b4ff);
        }

        .bg-c-green {
            background: linear-gradient(45deg,#2ed8b6,#59e0c5);
        }

        .bg-c-yellow {
            background: linear-gradient(45deg,#FFB64D,#ffcb80);
        }

        .bg-c-pink {
            background: linear-gradient(45deg,#FF5370,#ff869a);
        }

        .m-t-10 {
            margin-top: 10px;
        }

        .p-20 {
            padding: 20px;
        }

        .user-card .card-block .user-social-link i {
            font-size: 30px;
        }

        .text-facebook {
            color: #3B5997;
        }

        .text-twitter {
            color: #42C0FB;
        }

        .text-dribbble {
            color: #EC4A89;
        }

        .user-card .card-block .user-image:before {
            bottom: 0;
            border-bottom-left-radius: 50px;
            border-bottom-right-radius: 50px;
        }

        .user-card .card-block .user-image:after, .user-card .card-block .user-image:before {
            content: "";
            width: 100%;
            height: 48%;
            border: 2px solid #4099ff;
            position: absolute;
            left: 0;
            z-index: 10;
        }

        .user-card .card-block .user-image:after {
            top: 0;
            border-top-left-radius: 50px;
            border-top-right-radius: 50px;
        }

        .user-card .card-block .user-image:after, .user-card .card-block .user-image:before {
            content: "";
            width: 100%;
            height: 48%;
            border: 2px solid #4099ff;
            position: absolute;
            left: 0;
            z-index: 10;
        }
        .content-member-background{
            background-image: url("../img/background2.jpg");
            background-size: 100%;
          }
      </style>
</head>
<body>
<div class="d-flex" id="wrapper">

        <!-- Sidebar -->
        <div class="bg-info text-white border-right" id="sidebar-wrapper">
            <div class="sidebar-heading">Trang chủ</div>
            <div class="list-group list-group-flush">
                <a href="./web-home?action=load" class="list-group-item list-group-item-action bg-info text-white">Chạy thuật toán</a>
                <a href="./web-member" class="list-group-item list-group-item-action bg-info text-white">Thành viên</a>
            </div>
        </div>
        <!-- /#sidebar-wrapper -->

        <!-- Page Content -->
        <div id="page-content-wrapper" class="content-member-background">

            <nav class="navbar navbar-expand-lg navbar-light bg-light border-bottom grad">
                <button class="btn btn-primary" id="menu-toggle">Menu</button>

                <button class="navbar-toggler" type="button" data-toggle="collapse"
                    data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                    aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
            </nav>
            <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
            <div class="container">
                <div class="text-center">
                    <h1 class="text-danger">Thành viên nhóm 14</h1>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <div class="card user-card">
                            <div class="card-header">
                                <h5>Profile</h5>
                            </div>
                            <div class="card-block">
                                <div class="user-image">
                                    <img src="https://i.pinimg.com/236x/11/a9/8c/11a98c1024f4a84ddcb8049c6628776b--áo-thun-dragon.jpg" class="img-radius"
                                        alt="User-Profile-Image">
                                </div>
                                <h6 class="f-w-600 m-t-25 m-b-10">Nguyễn Thành Long</h6>
                                <p class="text-muted">MSSV: 2001181201</p>
                                <hr>
                                <p class="text-muted m-t-15">Tiến độ: 100%</p>
                                <ul class="list-unstyled activity-leval">
                                    <li class="active"></li>
                                    <li class="active"></li>
                                    <li class="active"></li>
                                    <li class="active"></li>
                                    <li class="active"></li>
                                </ul>
                                <div class="bg-c-blue counter-block m-t-10 p-20">
                                    <div class="row">
                                        <div class="col-4">
                                            <i class="fa fa-comment"></i>

                                        </div>
                                        <div class="col-4">
                                            <i class="fa fa-user"></i>

                                        </div>
                                        <div class="col-4">
                                            <i class="fa fa-suitcase"></i>

                                        </div>
                                    </div>
                                </div>
                                <p class="m-t-15 text-muted">Code là 1 nghệ thuật, người fix bug là 1 nghệ sĩ</p>
                                <hr>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="card user-card">
                            <div class="card-header">
                                <h5>Profile</h5>
                            </div>
                            <div class="card-block">
                                <div class="user-image">
                                    <img src="https://thuthuatnhanh.com/wp-content/uploads/2019/09/hinh-anime-chibi-boy-lanh-lung.jpg" class="img-radius"
                                        alt="User-Profile-Image">
                                </div>
                                <h6 class="f-w-600 m-t-25 m-b-10">Võ Trung Nam</h6>
                                <p class="text-muted">MSSV: 2001181219</p>
                                <hr>
                                <p class="text-muted m-t-15">Tiến độ: 100%</p>
                                <ul class="list-unstyled activity-leval">
                                    <li class="active"></li>
                                    <li class="active"></li>
                                    <li class="active"></li>
                                    <li class="active"></li>
                                    <li class="active"></li>
                                </ul>
                                <div class="bg-c-green counter-block m-t-10 p-20">
                                    <div class="row">
                                        <div class="col-4">
                                            <i class="fa fa-comment"></i>

                                        </div>
                                        <div class="col-4">
                                            <i class="fa fa-user"></i>

                                        </div>
                                        <div class="col-4">
                                            <i class="fa fa-suitcase"></i>
                                        </div>
                                    </div>
                                </div>
                                <p class="m-t-15 text-muted">Chiếu mới mua</p>
                                <hr>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /#page-content-wrapper -->

        </div>
        <!-- /#wrapper -->

        <!-- Bootstrap core JavaScript -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>

        <!-- Menu Toggle Script -->
        <script>
            $("#menu-toggle").click(function (e) {
                e.preventDefault();
                $("#wrapper").toggleClass("toggled");
            });
        </script>
</body>
</html>