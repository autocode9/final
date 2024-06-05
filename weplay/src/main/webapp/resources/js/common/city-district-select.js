/**
 * 
 */
 
const optionAll = '<option value="all" selected>전체</option>';
		
function selectCities(){ // 시도 셀렉트 옵션 조회
	$.ajax({
		url : 'city',
		type : 'get',
		success : result => {
			console.log(result);
			const city = result.data;
			let options = optionAll;
			for(let i in city){
				options += '<option value="' + city[i].sido + '">' + city[i].sido + '</option>';
			}
			$('#sido').html(options);
		}
	});
}

function selectDistricts(){ //시군구 셀렉트 옵션 조회
	$.ajax({
		url : 'city/' + $('#sido').val(),
		type : 'get',
		success : result => {
			const district = result.data;
			let options = optionAll;
			for(let i in district){
				options += '<option value"' + district[i].sigungu + '">' + district[i].sigungu + '</option>';
			}
			$('#sigungu').html(options);
		}
		
	});
}