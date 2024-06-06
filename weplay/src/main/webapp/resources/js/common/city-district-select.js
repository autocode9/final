/**
 * 
 */
const optionAll = '<option value="all" selected>전체</option>';

// 시도 목록 조회 => 옵션 추가
// select#sido 필요
function selectCities(){ 
	$.ajax({
		url : 'city',
		type : 'get',
		success : result => {
			const city = result.data;
			let options = optionAll;
			for(let i in city){
				options += '<option value="' + city[i].sido + '">' + city[i].sido + '</option>';
			}
			$('#sido').html(options);
		}
	});
}

// 시군구 목록 조회 => 옵션 추가
// select#sigungu 필요
function selectDistricts(){ 
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