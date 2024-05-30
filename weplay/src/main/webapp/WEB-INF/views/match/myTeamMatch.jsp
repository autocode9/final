<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>My팀 경기</title>

    <style>
        #outer{
            width:80%;
            margin: auto;
            padding: 2%;
            background-color: white;
        }
        #team-area{
            text-align: center;
            height: 20%;
            > div{
                display: inline-table;
                width: 30%;
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
        .logo{
            width: 10%;
        }
        .logo > img{
            width: 100%;
        }
    </style>
</head>
<body>
    
    <jsp:include page="../common/header.jsp"/>
    
    <div id="outer">
        <div id="team-area">
            <div id="team-logo">
                <img src="${ team.teamLogo }"/>
            </div>
            <div id="team-info">
            	<input type="hidden" id="teamNo" value="${ team.teamNo }">
                <h1>${ team.teamName }</h1>
                <h3>${ team.teamRecord }</h3>
            </div>
        </div>
        <div id="match-area">
            <div id="upcoming-area">
                <h2>예정된 경기</h2>
                <table class="table table-bordered match-table">
                    <tr>
                        <td>리메이크 FC</td>
                        <td class="logo"><img src=""/></td>
                        <td>VS</td>
                        <td class="logo"><img src=""/></td>
                        <td>경실련 FC</td>
                        <td>90분</td>
                        <td>종로구 한강다목적운동장</td>
                        <td>2024.06.07<br>오전 10시</td>
                        <td><button class="btn btn-sm btn-outline-danger">경기 취소</button></td>
                    </tr>
                </table>
            </div>
            <div id="history-area">
                <h2>지난 경기</h2>
                <table class="table table-bordered match-table">
                    <tr>
                        <td>리메이크 FC</td>
                        <td class="logo"><img src=""/></td>
                        <td>2 : 0</td>
                        <td class="logo"><img src=""/></td>
                        <td>경실련 FC</td>
                        <td>90분</td>
                        <td>종로구 한강다목적운동장</td>
                        <td>2024.05.05<br>오전 10시</td>
                        <td>경기 종료</td>
                    </tr>

                </table>
            </div>
        </div>


    </div>

	<script>
		$(() => {
			getUpcomingMatch();
			getPreviousMatch();
		});
		
		var upcomingMatchLimit = 5;
		var previousMatchLimit = 5;
		
		function getUpcomingMatch(){
			$.ajax({
				url : 'match/upcomingMatch',
				type : 'get',
				data : {
					teamNo : $('#teamNo').val(),
					matchLimit : upcomingMatchLimit
				},
				success : result => {
					console.log(result);
					console.log(result.data.matchList);
					const matchList = result.data.matchList;
					
					for(let i in matchList){
						const match = matchList[i];
						createUpcomingMatch(match);
						
					}
					
					
				}
			})
		}
		
		function getPreviousMatch(){
			$.ajax({
				url : 'match/previousMatch',
				type : 'get',
				data : {
					teamNo : $('#teamNo').val(),
					matchLimit : previousMatchLimit
				},
				success : result => {
					console.log(result);
					console.log(result.data.matchList);
				}
			})
		}
	
		function createUpcomingMatch(match){
			
			const tr = document.createElement('tr');
			
		}
	</script>

</body>
</html>