<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>WEPLAY:MatchApps</title>
    <style>
        #outer{
            width: 80%;
            background-color: white;
            margin: auto;
        }
        .table{text-align: center;}
        .table a{color: black;}
        .more-btn-area{
            width: 100%;
            text-align: center;
        }
        .status-y{color: forestgreen;}
        .status-n{color: #dc3545;}
        .status-a{color: #007bff;}
        .status-r{color: black; }
    </style>
</head>
<body>
	
	<jsp:include page="../common/header.jsp"/>
    
    <div id="outer">
    	<input type="hidden" id="teamNo" value="${ loginUser.teamNo }">
        <div id="recieved-area">
            <h2>받은 경기 신청 내역</h2>
            <table class="table table-bordered table-hover">
                <thead>
                    <tr>
                        <th>상대팀</th>
                        <th>경기장</th>
                        <th>경기일시</th>
                        <th>경기시간</th>
                        <th>신청자 정보</th>
                        <th>신청메세지</th>
                        <th>신청일</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    
                </tbody>
            </table>
            <div class="more-btn-area">
                <button class="btn btn-primary more-recieved-btn">더보기</button>
            </div>
        </div>
        <div id="sent-area">
            <h2>보낸 경기 신청 내역</h2>
            <table class="table table-bordered table-hover">
                <thead>
                    <tr>
                        <th>상대팀</th>
                        <th>경기장</th>
                        <th>경기일시</th>
                        <th>경기시간</th>
                        <th>신청자 정보</th>
                        <th>신청메세지</th>
                        <th>신청일</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    
                </tbody>
            </table>
            <div class="more-btn-area">
                <button class="btn btn-primary more-sent-btn">더보기</button>
            </div>
        </div>
    </div>
	
	<script>
		var recievedLimit = 5;
		var sentLimit = 5;
		$(() => {
			getMatchApplications();
			$('.more-recieved-btn').click(()=>{
				recievedLimit += 5;
				getMatchApplications();
			})
			$('.more-sent-btn').click(()=>{
				sentLimit += 5;
				getMatchApplications();
			})
		});
		function getMatchApplications(boardLimit){
			$.ajax({
				url : 'matchApp/getMatchApplications',
				type : 'get',
				data : {
					teamNo : $('#teamNo').val(),
					recievedLimit : recievedLimit,
					sentLimit : sentLimit
				},
				success : result => {
					console.log(result);
					const recievedList = result.recievedList;
					const sentList = result.sentList;
					
					$('#recieved-area tbody').html('');
					$('#sent-area tbody').html('');
					
					if(recievedList.length == 0){
						$('#recieved-area tbody').html('<tr><td colspan="6">받은 신청 내역이 없습니다.</td></tr>');
					}
					else{
						for(let i in recievedList){
							const recievedTr = createRecievedTr(recievedList[i]);
							$('#recieved-area tbody').append(recievedTr);
						}
					}
					if(sentList.length == 0){
						$('#sent-area tbody').html('<tr><td colspan="6">보낸 신청 내역이 없습니다.</td></tr>');
					}
					else{
						for(let i in sentList){
							const sentTr = createSentTr(result.sentList[i]);
							$('#sent-area tbody').append(sentTr);
						}
					}
					/*
					if(recievedLimit > 5 && recievedLimit < 11){
						const button = document.createElement('button');
						button.setAttribute('class', 'btn btn-secondary close-recieved-btn');
						button.innerText = '닫기';

					}
					if(sentLimit > 5 && recievedLimit < 11){
						const button = document.createElement('button');
						button.setAttribute('class', 'btn btn-secondary close-sent-btn');
						button.innerText = '닫기';
					}
					*/
				}
			});
		};
		
		function createRecievedTr(props){
			
			const tr = document.createElement('tr');
			
			const tds = [];
			
			for(let i = 0; i < 8; i++){
				tds.push(document.createElement('td'));
			}
			
			tds[0].innerHTML = '<input type="hidden" class="applyNo" value="' + props.applyNo + '">'
        				 	 + '<input type="hidden" class="homeTeamNo" value="' + props.homeTeam + '">'
        				  	 + '<a href="">' + props.opponentName + '</a>';

			tds[1].innerHTML = '<input type="hidden" class="fieldNo" value="' + props.fieldNo + '">'
	        			  	 + '<a href="">' + props.fieldName + '</a>';  
			
			tds[2].innerHTML = props.matchDate;

			tds[3].innerHTML = props.matchTime;

			tds[4].innerText = props.applyInfo;
			
			tds[5].innerHTML = props.applyContent;

			tds[6].innerHTML = props.applyDate;

			tds[7].innerHTML = '<button class="btn btn-sm btn-success accept">승낙</button>'
            			  	 + '<button class="btn btn-sm btn-danger decline">거절</button>';
			
			for(let i in tds){
				tr.appendChild(tds[i]);
			}
			
			return tr;
		}
		
		function createSentTr(props){

			const tr = document.createElement('tr');
			
			const tds = [];
			
			for(let i = 0; i < 8; i++){
				tds.push(document.createElement('td'));
			}
			
			tds[0].innerHTML = '<input type="hidden" class="applyNo" value="' + props.applyNo + '">'
        				  	 + '<a href="">' + props.opponentName + '</a>';

			tds[1].innerHTML = '<input type="hidden" class="fieldNo" value="' + props.fieldNo + '">'
	        			  	 + '<a href="">' + props.fieldName + '</a>';  
			
			tds[2].innerHTML = props.matchDate;

			tds[3].innerHTML = props.matchTime;

			tds[4].innerText = props.applyInfo;
			
			tds[5].innerHTML = props.applyContent;

			tds[6].innerHTML = props.applyDate;
			
			const status = props.status.toLowerCase();
			let statusStr = '';
			switch(status){
			case 'y' : statusStr = '신청중'; break;
			case 'n' : statusStr = '신청 취소'; break;
			case 'a' : statusStr = '승낙'; break;
			case 'r' : statusStr = '거절'; break;
			}
			
			tds[7].innerHTML = '<label class="status-' + status + '">' + statusStr + '</label>';
			
			if(status == 'y'){
				tds[7].innerHTML += '<button class="btn btn-sm btn-outline-danger cancelApply">신청 취소</button>';
			}
			
			for(let i in tds){
				tr.appendChild(tds[i]);
			}
			
			return tr;
		}
		
	</script>
	
	
</body>
</html>