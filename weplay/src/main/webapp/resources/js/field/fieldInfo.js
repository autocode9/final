/**
 * 
 */
 
$(()=>{
	var now_utc = Date.now()
	var timeOff = new Date().getTimezoneOffset()*60000;
	var today = new Date(now_utc-timeOff).toISOString().split("T")[0];
	
	$('#rentalDate').attr('min', today);
	
    $('#toRentBtn').click(()=>{
        $('#input-area').removeAttr('class', 'hidden');
        $('#btn-area').attr('class', 'hidden');
    });
    $('#rentalDate').change(()=>{
    	getRentalTime();
    	$('#rentalTime').attr('disabled', false);
    });
    $('#rentField').click(()=>{
        if($('#rentalDate').val() != '' && $('#endTime').val() != ''){
            $('.modal-body').find('h4').text($('#info-area').find('h2').text());
            const info = $('#rentalDate').val() + ' | ' 
                       + $('#rentalTime').val() + ' | 2시간 <br>'
                       + '가격 : ' + $('#price').val() + '원'; 
            $('.modal-body').find('p').html(info);
        } else{
            alert('필수 정보를 입력해주세요!');
            return false;
        }
    });
    $('#rent-submit').click(()=>{
        if(confirm('결제하시겠습니까?')){
			addRental();
			location.href = 'fieldRentals';
        }
    })
});

function getRentalTime(){
	$.ajax({
		url : 'rental/rentalTime',
		type : 'get',
		data : {
			fieldNo : $('#fieldNo').val(),
			rentalDate : $('#rentalDate').val()
		},
		success : result => {
			setTimeOption(result.data);
		}
	});
}
function setTimeOption(rentalTime){
	var options = [];
	
	const optionInfo = document.createElement('option');
	optionInfo.setAttribute('selected', true);
	optionInfo.setAttribute('disabled', true);
	optionInfo.innerText = '대여 시간 선택';
	
	options.push(optionInfo);
	let times = ['07:00~09:00', '09:00~11:00', '11:00~13:00', '13:00~15:00', '15:00~17:00', '17:00~19:00', '19:00~21:00', '21:00~23:00'];
	for(let i in times){
		const option = document.createElement('option');
		option.setAttribute("value", times[i]);
		option.innerText = times[i];
		for(let j in rentalTime){
			if(rentalTime[j] == times[i]){
				option.setAttribute('disabled', true);
			}
		}
		options.push(option);
	}
	$('#rentalTime').html('');
	for(let i in options){
    	$('#rentalTime').append(options[i]);
	}
}

function addRental(){
	$.ajax({
		url : 'rental',
		type : 'post',
		data : {
			fieldNo : $('#fieldNo').val(),
			rentalDate : $('#rentalDate').val(),
			rentalTime : $('#rentalTime').val()
		},
		success : result => {
			if(result.data == 'Y'){
				alert('예약이 완료되었습니다.');
			}
			else{
				alert('요청 실패.. 다시 시도해주세요.');
			}
		}
	})
}