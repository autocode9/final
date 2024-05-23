<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>My팀 경기</title>

    <style>
        #outer{
            width:80%;
            margin: auto;
            padding-bottom: 5%;
            padding-top: 2%;
        }
        #team-area{
            text-align: center;
            height: 20%;
            > div{
                display: inline-table;
                width: 20%;
                height: 100%;
            }
        }
        #match-area{
            h2{
                padding-left: 10%;
                margin-top: 2%;
                margin-bottom: 2%;
            }
        }
        #team-logo > img{
            width: 80%;
            height: 80%;
        }
        .match-table{
            width: 80%;
            margin: auto;
            text-align: center;
        }
    </style>
</head>
<body>
    
    <jsp:include page="../common/header.jsp"/>
    
    <div id="outer">
        <div id="team-area">
            <div id="team-logo">
                <img src="https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjq9LJak45k1eZi_TyWyOSy5nU3KetpbfDluj9aty3-1WptLYlvwfZTZIOiaJtf1LPxx0WEsO-XXzOCDlPpY4ymL1Rm8tgdZ1yUOnQbsgUT8Ri1CEA12UGV7lNISQ66dAWvB7QWj0kRlOBa/s1600/3034007-slide-s-3-whats-the-difference-between-a-logo-and-a-symbol.jpg"/>
            </div>
            <div id="team-info">
                <h1>리메이크 FC</h1>
                <h3>2승 1무 1패</h3>
            </div>
        </div>
        <div id="match-area">
            <div>
                <h2>예정된 경기</h2>
                <table class="table table-bordered match-table">
                    <tr>
                        <td>리메이크 FC</td>
                        <td><img src=""/></td>
                        <td>VS</td>
                        <td><img src=""/></td>
                        <td>경실련 FC</td>
                        <td>90분</td>
                        <td>종로구 한강다목적운동장</td>
                        <td>2024.06.07<br>오전 10시</td>
                    </tr>
                    <tr>
                        <td>리메이크 FC</td>
                        <td><img src=""/></td>
                        <td>VS</td>
                        <td><img src=""/></td>
                        <td>경실련 FC</td>
                        <td>60분</td>
                        <td>종로구 한강다목적운동장</td>
                        <td>2024.06.14<br>오전 10시</td>
                    </tr>
                    <tr>
                        <td>리메이크 FC</td>
                        <td><img src=""/></td>
                        <td>VS</td>
                        <td><img src=""/></td>
                        <td>경실련 FC</td>
                        <td>60분</td>
                        <td>종로구 한강다목적운동장</td>
                        <td>2024.06.14<br>오전 10시</td>
                    </tr>
                    <tr>
                        <td>리메이크 FC</td>
                        <td><img src=""/></td>
                        <td>VS</td>
                        <td><img src=""/></td>
                        <td>경실련 FC</td>
                        <td>60분</td>
                        <td>종로구 한강다목적운동장</td>
                        <td>2024.06.14<br>오전 10시</td>
                    </tr>
                    <tr>
                        <td>리메이크 FC</td>
                        <td><img src=""/></td>
                        <td>VS</td>
                        <td><img src=""/></td>
                        <td>경실련 FC</td>
                        <td>60분</td>
                        <td>종로구 한강다목적운동장</td>
                        <td>2024.06.14<br>오전 10시</td>
                    </tr>
    
    
                </table>
            </div>
            <div>
                <h2>지난 경기</h2>
                <table class="table table-bordered match-table">
                    <tr>
                        <td>리메이크 FC</td>
                        <td><img src=""/></td>
                        <td>2 : 0</td>
                        <td><img src=""/></td>
                        <td>경실련 FC</td>
                        <td>90분</td>
                        <td>종로구 한강다목적운동장</td>
                        <td>2024.05.05<br>오전 10시</td>
                        <td>경기 종료</td>
                    </tr>
                    <tr>
                        <td>리메이크 FC</td>
                        <td><img src=""/></td>
                        <td>2 : 0</td>
                        <td><img src=""/></td>
                        <td>경실련 FC</td>
                        <td>90분</td>
                        <td>종로구 한강다목적운동장</td>
                        <td>2024.05.05<br>오전 10시</td>
                        <td><a href="">경기 기록하기</a></td>
                    </tr>
                </table>
            </div>
        </div>


    </div>


</body>
</html>