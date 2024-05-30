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
                padding-left: 4%;
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
            width: 8%;
        }
        .logo > img{
            width: 100%;
            height:100%;
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
                <table class="table table-bordered table-hover match-table">

                </table>
            </div>
            <div id="previous-area">
                <h2>지난 경기</h2>
                <table class="table table-bordered table-hover match-table">

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

					const matchList = result.data.matchList;
					const listCount = result.data.listCount;
					
					$('#upcoming-area table').html('');
					
					if(matchList.length == 0){
						$('#upcoming-area table').html('<tr><td colspan="9">예정된 경기가 없습니다.</td></tr>');
					}
					for(let i in matchList){
						const match = matchList[i];
						const tr = createUpcomingMatch(match);
						$('#upcoming-area table').append(tr);
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
					
					const matchList = result.data.matchList;
					const listCount = result.data.listCount;

					$('#previous-area table').html('');
					
					if(matchList.length == 0){
						$('#previous-area table').html('<tr><td colspan="9">지난 경기가 없습니다.</td></tr>');
					}
					for(let i in matchList){
						const match = matchList[i];
						const tr = createPreviousMatch(match);
						$('#previous-area table').append(tr);
					}
				}
			})
		}
	
		function createUpcomingMatch(match){
			
			const tr = document.createElement('tr');
			
			const tds = [];
			
			for(let i = 0; i < 9; i++){
				tds.push(document.createElement('td'));
			}
			
			tds[0].innerHTML = '<a href="teamInfo?teamNo=' + match.homeTeam + '">' + match.homeTeamName + '</a>';
			tds[1].setAttribute('class', 'logo');
			tds[1].innerHTML = '<img src="' + match.homeTeamLogo + '" />';
			tds[2].innerHTML = 'VS';
			tds[3].setAttribute('class', 'logo');
			tds[3].innerHTML = '<img src="' + match.awayTeamLogo + '" />';
			tds[4].innerHTML = '<a href="teamInfo?teamNo=' + match.awayTeam + '">' + match.awayTeamName + '</a>';
			tds[5].innerHTML = match.matchTime;
			tds[6].innerHTML = '<a href="">' + match.fieldName + '</a>';
			tds[7].innerHTML = match.matchDate;
			tds[8].innerHTML = '<a href="" class="btn btn-sm btn-outline-success">상세 보기</a><br>'
				             + '<button class="btn btn-sm btn-outline-danger cancel-match">경기 취소</button>';
			
			for(let i in tds){
				tr.appendChild(tds[i]);
			}
			
			return tr;
		}
		
		function createPreviousMatch(match){
			
			const tr = document.createElement('tr');
			
			const tds = [];
			
			for(let i = 0; i < 9; i++){
				tds.push(document.createElement('td'));
			}
			
			tds[0].innerHTML = '<a href="teamInfo?teamNo=' + match.homeTeam + '">' + match.homeTeamName + '</a>';
			tds[1].setAttribute('class', 'logo');
			tds[1].innerHTML = '<img src="' + match.homeTeamLogo + '" />';
			tds[2].innerHTML = match.score;
			tds[3].setAttribute('class', 'logo');
			tds[3].innerHTML = '<img src="' + match.awayTeamLogo + '" />';
			tds[4].innerHTML = '<a href="teamInfo?teamNo=' + match.awayTeam + '">' + match.awayTeamName + '</a>';
			tds[5].innerHTML = match.matchTime;
			tds[6].innerHTML = '<a href="">' + match.fieldName + '</a>';
			tds[7].innerHTML = match.matchDate;
			
			if(match.status == 'R'){
				tds[8].innerHTML = '<a href="" class="btn btn-sm btn-outline-primary">경기 기록하기</a><br>';
			}
			else{
				tds[8].innerHTML = '<a href="" class="btn btn-sm btn-outline-success">상세 보기</a><br>';
			}
			
			for(let i in tds){
				tr.appendChild(tds[i]);
			}
			
			return tr;
		}
		
	</script>

</body>
</html>