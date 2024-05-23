/**
 * 
 */
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
			const recievedList = result.data.recievedList;
			const sentList = result.data.sentList;
			console.log(sentList[0]);
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
			controllButtons();
			
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

function controllButtons(){
	const moreRecievedBtn = document.createElement('button');
	moreRecievedBtn.setAttribute('class', 'btn btn-primary more-recieved-btn');
	moreRecievedBtn.innerText = '더보기';
	
	const moreSentBtn = document.createElement('button');
	moreSentBtn.setAttribute('class', 'btn btn-primary more-sent-btn');
	moreSentBtn.innerText = '더보기';
	
	const closeRecievedBtn = document.createElement('button');
	closeRecievedBtn.setAttribute('class', 'btn btn-secondary close-recieved-btn');
	closeRecievedBtn.innerText = '닫기';
	
	const closeSentBtn = document.createElement('button');
	closeSentBtn.setAttribute('class', 'btn btn-secondary close-sent-btn');
	closeSentBtn.innerText = '닫기';
	
	if(recievedList.length < 6){
		$('#recieved-btn-area').html('');
		$('#recieved-btn-area').append(moreRecievedBtn);
	}
	else{
		$('#recieved-btn-area').html('');
		$('#recieved-btn-area').append(moreRecievedBtn);
		$('#recieved-btn-area').append(closeRecievedBtn);
		
	}
	
	if(sentList.length < 6){
		$('#sent-btn-area').html('');
		$('#sent-btn-area').append(moreSentBtn);
	}
	else{
		$('#sent-btn-area').html('');
		$('#sent-btn-area').append(moreSentBtn);
		$('#sent-btn-area').append(closeSentBtn);
	}
}