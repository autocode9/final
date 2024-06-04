/**
 * 
 */

const page = 1;
$(() => {
	selectFields(page);
	$('#searchField').click(() => {
		selectFields(page);
	});
	
});
function selectFields(page){
	$.ajax({
		url : 'fields/' + page,
		type : 'get',
		data : {
			category : $('#category').val(),
			query : $('#query').val()
		},
		success : result => {
			const pageInfo = result.data.pageInfo;
			const fields = result.data.fields;
			
			$('#field-result-area').html(createFieldResult(pageInfo.listCount));
			
			if(fields.length == 0){
				const fieldTrEmpty = '<tr><td colspan="6">조회된 경기장이 없습니다.</td></tr>';
				$('#fields-area tbody').html(fieldTrEmpty);
				$('#field-page-area').html('');
			}
			else{
				$('#fields-area tbody').html('');
				for(let i in fields){
					const fieldTr = createFieldTr(fields[i]);
					$('#fields-area tbody').append(fieldTr);
				}
				const pageUl = fieldPagination(pageInfo);
				
				$('#field-page-area').html(pageUl);
				
			}
			
		}
		
	});
}

function createFieldResult(listCount){
	const $query= $('#query').val();
	const $category = $('#category').val();
	
	let result = '';
	if($query != ''){
		result = '<b>' + $query + '</b>';
		switch($category){
		case 'all' : result += ' 전체 검색 결과 : '; break;
		case 'fieldName' : result += ' 경기장명 검색 결과 : '; break;
		case 'location' : result += ' 지역 검색 결과 : '; break;
		}
	}
	else{
		result = '조회 결과 : ';
	}
	result += listCount + '건';
	return result;
}

function createFieldTr(field){ // 팀 테이블 행 생성 메소드
	const fieldTr = document.createElement('tr');
	fieldTr.setAttribute("class", "field-tr");
	
	const keys = Object.keys(field);
		
	for (let i in keys) {
		const key = keys[i] // 각각의 키
		const value = field[key] // 각각의 키에 해당하는 각각의 값
		
		if(i == 0){ // teamNo => input:hidden
			const fieldNo = document.createElement("input");
			fieldNo.setAttribute("class", "fieldNo");
			fieldNo.setAttribute("type", "hidden");
			fieldNo.setAttribute("value", value);
			fieldTr.appendChild(fieldNo);
		}
		else{
			const td = document.createElement('td');
			td.innerText = value;
			fieldTr.appendChild(td);
		}
	}
	const td = document.createElement('td');
	td.innerHTML = '<a href="field?fieldNo=' + field.fieldNo + '" class="btn btn-sm btn-success">대여 및 상세 정보</a>';
	fieldTr.appendChild(td);
	
	return fieldTr;
}

function fieldPagination(pageInfo){ // 페이징 처리
	
    const pageUl = document.createElement('ul');
    pageUl.setAttribute("class", "pagination justify-content-center");
    		
    const moveLi = document.createElement('li');
    moveLi.setAttribute("class", "page-item");
    
    if(pageInfo.currentPage != 1){
    	moveLi.innerHTML = '<a class="page-link" onclick="selectFields(' + (pageInfo.currentPage - 1) + ');">이전</a>';
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
  		pageLi.innerHTML = '<a class="page-link" onclick="selectFields(' + i + ');">' + i + '</a>';
  		pageUl.appendChild(pageLi);
    }
    
    if(pageInfo.maxPage > pageInfo.currentPage){
    	moveLi.innerHTML = '<a class="page-link" onclick="selectFields(' + (pageInfo.currentPage + 1) + ');">다음</a>';
  		pageUl.appendChild(moveLi);
    }
    
    return pageUl;
}