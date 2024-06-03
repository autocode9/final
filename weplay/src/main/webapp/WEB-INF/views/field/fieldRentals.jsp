<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>WEPLAY:FieldRentals</title>
    <style>
        #outer{
            width:80%;
            margin: auto;
            padding-bottom: 4%;
            padding-top: 2%;
            background-color: white;
        }
        .rental-body{
            padding-top: 2%;
            padding-left: 6%;
            padding-right: 6%;
            > table{
                text-align: center;
                width: 100%;
            }
        }
        #rental-area{
            border-bottom: 2px solid lightgray;
        }
        .btn-area{
            margin: 1%;
            text-align: center;
        }
        .rentalEnd{color:forestgreen}
        .canceled{color:darkgray}
    </style>
</head>
<body>

	<jsp:include page="../common/header.jsp"/>
	
    <div id="outer">
        <div id="rental-area" class="rental-body">
            <h2>경기장 대여 내역</h2>
            <table class="table-sm table-bordered table-hover">
                <thead>
                    <tr>
                        <th>지역</th>
                        <th>경기장</th>
                        <th>대여일시</th>
                        <th>대여한날</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>서울 강북구</td>
                        <td>강북구민운동장</td>
                        <td>2024.05.25<br>09:00~11:00</td>
                        <td>2024.05.05</td>
                        <td><button class="btn btn-sm btn-outline-danger">취소</button></td>
                    </tr>
                </tbody>
            </table>
            <div class="btn-area">
                <button class="btn btn-sm btn-secondary">더보기</button>
            </div>
        </div>
        <div id="rental-history" class="rental-body">
            <h2>지난 대여 내역</h2>
            <table class="table-sm table-bordered table-hover">
                <thead>
                    <tr>
                        <th>지역</th>
                        <th>경기장</th>
                        <th>대여일시</th>
                        <th>대여한날</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>서울 강북구</td>
                        <td>강북구민운동장</td>
                        <td>2024.05.25<br>09:00~11:00</td>
                        <td>2024.05.05</td>
                        <td><label class="canceled">취소함</label></td>
                    </tr>
                    <tr>
                        <td>서울 강북구</td>
                        <td>강북구민운동장</td>
                        <td>2024.05.25<br>09:00~11:00</td>
                        <td>2024.05.05</td>
                        <td><label class="rentalEnd">대여종료</label></td>
                    </tr>
                </tbody>
            </table>
            <div class="btn-area">
                <button class="btn btn-sm btn-secondary">더보기</button>
            </div>
        </div>

    </div>
    
    <script>
     	var upcomingLimit = 5;
     	var previousLimit = 5;
     	
    	$(()=>{
    		getUpcomingRentals();
    		getPreviousRentals();
    	});
    	
    	function getUpcomingRentals(){
    		const requestData = { status : 'Y', limit : upcomingLimit};
    		const data = getRentals(requestData);
    		console.log(data);
    	}
    	function getPreviousRentals(){
    		const requestData = { status : 'NY', limit : previousLimit};
    		const data = getRentals(requestData);
    		console.log(data);
    	}
    	
    	function getRentals(requestData){
    		let rentals = [];
    		$.ajax({
    			url : 'rental',
    			type : 'get',
    			async: false,
    			data : requestData,
    			success : result => {
    				console.log(result);
    				rentals = result.data;
    			}
    		})
    		return rentals;
    	}
    </script>
    
</body>
</html>