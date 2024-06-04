<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="resources/css/match/matchInfo.css">

</head>
<body>	
	<jsp:include page="../common/header.jsp"/>
    
    <div id="outer">
        <div id="match-header">
            <h3 style="color:rgb(52, 152, 219);">HOME</h3>
            <h2>경기 예정</h2>
            <h3 style="color:rgb(231, 76, 60);">AWAY</h3>
        </div>
        <div id="title-area">
            <div class="team-area">
                <h2><a href="">리메이크 FC</a></h2>
                <h4>2승 1무 1패</h4>
            </div>
            <div class="logo">
                <img src="resources/images/team/noLogo.jpg">
            </div>
            <div id="score-area">
                <h3>VS</h3>
            </div>
            <div class="logo">
                <img src="resources/images/team/noLogo.jpg">
            </div>
            <div class="team-area">
                <h2><a href="">경실련 FC</a></h2>
                <h4>2승 1무 1패</h4>
            </div>
        </div>
        <div id="info-area">
            <div class="team-info">
                <label>지역 : </label>&nbsp;<b>서울 종로구</b> <br>
                <label>팀 유형 : </label>&nbsp;<b>청년</b> <br>
                <label>실력 : </label>&nbsp;<b>상</b> <br>
                <label>인원 : </label>&nbsp;<b>15명</b> <br>
                <label>평균 나이 : </label>&nbsp;<b>20대</b> <br>
                <label>유니폼 : </label>&nbsp;<b>블루</b>
            </div>
            <!-- 
            
            -->
            <div id="match-info">
                <label>경기일시 : </label>&nbsp;<b>2024.05.05 09:00</b> <br>
                <label>경기시간 : </label>&nbsp;<b>60분</b> <br>
                <label>경기장 : </label>&nbsp;<a href=""><b>종로구 한강다목적운동장</b></a> <br>
                <label>위치 : </label>&nbsp;<b>서울 종로구</b> <br>
                <label>정보 : </label>&nbsp;<b>천연 잔디 | 90m X 62m</b> <br>
            </div>
            <div class="team-info">
                <label>지역 : </label>&nbsp;<b>서울 종로구</b> <br>
                <label>팀 유형 : </label>&nbsp;<b>청년</b> <br>
                <label>실력 : </label>&nbsp;<b>상</b> <br>
                <label>인원 : </label>&nbsp;<b>15명</b> <br>
                <label>평균 나이 : </label>&nbsp;<b>20대</b> <br>
                <label>유니폼 : </label>&nbsp;<b>블루</b>
            </div>
            <!-- 
            
            -->
        </div>
        <div id="match-footer">
            <button onclick="history.back()" class="btn btn-sm btn-secondary">뒤로가기</button>
        </div>
    </div>

</body>
</html>