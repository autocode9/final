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
	
	<script src="resources/js/match/matchApplications.js"></script>
    
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
            <div id="recieved-btn-area" class="more-btn-area">

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
            <div id="sent-btn-area" class="more-btn-area">
            
            </div>
        </div>
    </div>
	
	<script>
		var recievedLimit = 5;
		var sentLimit = 5;
		$(() => {
			getMatchApplications();
			$('#recieved-btn-area').on('click', '.more-recieved-btn', ()=>{
				recievedLimit += 5;
				getMatchApplications();
			})
			$('#sent-btn-area').on('click', '.more-sent-btn', ()=>{
				sentLimit += 5;
				getMatchApplications();
			});
			$('#recieved-btn-area').on('click', '.close-recieved-btn', ()=>{
				recievedLimit -= 5;
				getMatchApplications();
			})
			$('#sent-btn-area').on('click', '.close-sent-btn', ()=>{
				sentLimit -= 5;
				getMatchApplications();
			});
			$('#recieved-area tbody').on('click', '.accept', e => {
				const applyNo = $(e.target).parent().parent().find('.applyNo').val();
				updateApplication(applyNo, 'A');
			});
			$('#recieved-area tbody').on('click', '.decline', () => {
				const applyNo = $(e.target).parent().parent().find('.applyNo').val();
				updateApplication(applyNo, 'R');
			});
			$('#sent-area tbody').on('click', '.cancelApply', () => {
				const applyNo = $(e.target).parent().parent().find('.applyNo').val();
				updateApplication(applyNo, 'N');
			});
			
		});
		
		function updateApplication(applyNo, status){
			console.log(applyNo + ' ' + status);
			$.ajax({
				url : 'matchApp/updateMatchApplication',
				type : 'post',
				data : {
					applyNo : applyNo,
					status : status
				},
				success : result => {
					console.log(result);
				}
				
			});
		}
		
		function acceptMatch(){
			
		}
		function declineMatch(){
			
		}
		function cancelApply(){
			
		}
	</script>
	
	
</body>
</html>