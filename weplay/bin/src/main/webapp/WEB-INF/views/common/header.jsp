<%@ page language="java" contentType="text/html; charset=EUC-KR"
     pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>WEPLAY</title>
    <!-- jQuery 라이브러리 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <!-- 부트스트랩 스타일 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- 부트스트랩 스크립트 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <style>
        body{ background-color: black; }
        #header{
            width:80%;
            height: 20%;
            padding-top:20px;
            margin:auto;
            >h1{
                text-align: center;
                color: rgb(52, 152, 219);
                font-size: 50px;
                font-weight: 700;
                margin-bottom: 40px;
                > a{text-decoration:none;}
            }
        }
        #header-btn-area {
            display: inline-block;
            padding-left: 80%;
            > a{
                text-decoration:none; color:white; 
            }
        }
        #header-navibar>ul {width:100%; height:100%; list-style-type:none; margin:auto; padding:0;}
        .navi-top {float:left; width:16.66%; height:100%; line-height:55px; text-align:center;}
        .navi-top > a {color:white; font-size:22px; font-weight:900; display: block; width: 100%; height: 100%; transform: scale(1);}
        #header-navibar {height:60px; border-bottom:1px solid lightgray; border: 1px solid lightgrey;}
        .navi-in{ list-style-type:none; margin:auto; display: none;}
        .navi-in a{ text-decoration:none; color:white; font-size:18px; font-weight:900; }
        .navi-top > a:hover, .navi-in a:hover{ color: rgb(52, 152, 219); }
        .navi-top > a:hover + .navi-in{ display: block; }
        .navi-in:hover{ display: block; }
    </style>
</head>
<body>
    
    <div id="header">
        <div id="header-btn-area">
         <a href="loginForm.member">로그인</a>| <a href="enrollForm.member">회원가입</a>
            <!--<a href="">마이페이지</a> | <a href="">경기장 대여 내역</a>-->
            
        </div>

        <h1><a href="">WEPLAY</a></h1>

        <div id="header-navibar">
            <ul>
                <li class="navi-top"><a href="allTeams">팀</a></li>
                <li class="navi-top"><a href="">선수</a></li>
                <li class="navi-top"><a href="">My팀</a></li>
                <li class="navi-top">
                    <a href="">경기</a>
                    <ul class="navi-in">
                        <li><a href="#">전체 경기</a></li>
                        <li><a href="#">My팀 경기</a></li>
                        <li><a href="#">경기 신청</a></li>
                        <li><a href="#">경기 신청 내역</a></li>
                        <li><a href="#">경기 기록(팀)</a></li>
                        <li><a href="#">경기 기록(개인)</a></li>
                    </ul>
                </li>
                <li class="navi-top">
                    <a href="">커뮤니티</a>
                    <ul class="navi-in">
                        <li><a href="#">자유 게시판</a></li>
                        <li><a href="#">경기 게시판</a></li>
                        <li><a href="#">팀원 모집</a></li>
                        <li><a href="#">팀 구함</a></li>
                    </ul>
                </li class="navi-top">
                <li class="navi-top"><a href="">경기장 예약</a></li>
            </ul>
        </div>

    </div>

</body>
</html>