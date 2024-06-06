/**
 * 
 */
let page = 1;
$(() => {
	selectCities();
	selectTeams(page);
	
	// 시도 선택시 시도에 맞는 시군구를 가져옴
	$('#sido').change(() => { 
		if($('#sido').val() != 'all' && $('#sido').val() != '세종'){
			selectDistricts();
		}
		else{
			$('#sigungu').html(optionAll);
		}
		selectTeams(page);
	});
	$('#sigungu').change(() => { 
		selectTeams(page);
	});
	
	$('#searchByKeyword').click(() => {
		selectTeams(page);
	});
	
	$('#teams-area tbody').on('click', '.team-tr', function() {
		location.href = 'teamInfo?teamNo=' + $(this).find('.teamNo').val();
	})
	
});

function selectTeams(page){ // 팀 목록 조회	
	$.ajax({
		url : 'teams/' + page,
		type : 'get',
		data : {
			sido : $('#sido').val(),
			sigungu : $('#sigungu').val(),
			keyword : $('#keyword').val()
		},
		success : result => {
			const pageInfo = result.data.pageInfo;
			const teams = result.data.teams;
			
			$('#result-area').html(createResultStr(pageInfo.listCount));

			if(teams.length == 0){
				const teamTrEmpty = '<tr><td colspan="9">조회된 팀이 없습니다.</td></tr>';
				$('#teams-area tbody').html(teamTrEmpty);
				$('#page-area').html('');
			}
			else{
				$('#teams-area tbody').html('');
				for(let i in teams){
					const teamTr = createTeamTr(teams[i]);
					$('#teams-area tbody').append(teamTr);
				}
				const pageUl = pagination(pageInfo);
				
				$('#page-area').html(pageUl);
				
			}
		}
	});
}

function createResultStr(listCount){
	const $keyword = $('#keyword').val();
	const $sido = $('#sido').val();
	const $sigungu = $('#sigungu').val();
	
	let result = '';
	if($keyword == ''){
		result = '조회 결과 : ';
	}
	else{
		result = '<b>' + $keyword + '</b> 검색 결과 : ';
	}
	result += '<b>' + listCount + '</b>팀';

	if($sido != 'all' && $sigungu == 'all'){
		result += '(' + $sido + ')';
	}
	else if($sigungu != 'all' && $sigungu != 'all'){
		result += '(' + $sido + ' ' + $sigungu + ')';
	}
	return result;
}

function createTeamTr(team){ // 팀 테이블 행 생성 메소드
	const teamTr = document.createElement('tr');
	teamTr.setAttribute("class", "team-tr");

	const keys = Object.keys(team);
		
	for (let i in keys) {
		const key = keys[i] // 각각의 키
		const value = team[key] // 각각의 키에 해당하는 각각의 값
		
		if(i == 0){ // teamNo => input:hidden
			const teamNo = document.createElement("input");
			teamNo.setAttribute("class", "teamNo");
			teamNo.setAttribute("type", "hidden");
			teamNo.setAttribute("value", value);
			teamTr.appendChild(teamNo);
		}
		else{
			const td = document.createElement('td');
			td.innerText = value;
			teamTr.appendChild(td);
		}
	}
	const td = document.createElement('td');
	td.innerHTML = '<button class="btn btn-sm btn-success apply-match">경기신청</button>'
				 + '<button class="btn btn-sm btn-primary apply-join" data-toggle="modal" data-target="#ApplyJoinModal">가입신청</button>';
	teamTr.appendChild(td);
	
	return teamTr;
}

function pagination(pageInfo){ // 페이징 처리
    		
    const pageUl = document.createElement('ul');
    pageUl.setAttribute("class", "pagination justify-content-center");
    		
    const moveLi = document.createElement('li');
    moveLi.setAttribute("class", "page-item");
    
    if(pageInfo.currentPage != 1){
    	moveLi.innerHTML = '<a class="page-link" onclick="selectTeams(' + (pageInfo.currentPage - 1) + ');">이전</a>';
  		pageUl.appendChild(moveLi);
    }
    
    for(let i = pageInfo.startPage; i <= pageInfo.endPage; i++){
  		
  	const pageLi = document.createElement('li');
    	if(i == pageInfo.currentPage){
  			pageLi.setAttribute("class", "page-item active");
    	}
    	else{
    		pageLi.setAttribute("class", "page-item");
    	}
  		pageLi.innerHTML = '<a class="page-link" onclick="selectTeams(' + i + ');">' + i + '</a>';
  		pageUl.appendChild(pageLi);
    }
    
    if(pageInfo.maxPage > pageInfo.currentPage){
    	moveLi.innerHTML = '<a class="page-link" onclick="selectTeams(' + (pageInfo.currentPage + 1) + ');">다음</a>';
  		pageUl.appendChild(moveLi);
    }
    
    return pageUl;
}