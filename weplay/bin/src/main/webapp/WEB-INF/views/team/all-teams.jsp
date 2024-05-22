<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>WEPLAY:AllTeams</title>
    <!-- jQuery 라이브러리 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <!-- 부트스트랩 스타일 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- 부트스트랩 스크립트 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <style>
        #outer{
            width:80%;
            margin: auto;
            padding-bottom: 5%;
            padding-top: 2%;
            background-color: white;
        }

        #search-area, #location-area{
            width: 100%;
            text-align: center;
            margin-bottom: 2%;
        }
        #teams-area{
        	padding-left: 2%;
        	padding-right: 2%;
        }

    </style>
</head>
<body>
	
	<jsp:include page="../common/header.jsp"/>

    <div id="outer">
        <div id="search-area">
            <select id="skill">
                <option disabled selected>실력</option>
                <option value="상">상</option>
                <option value="중">중</option>
                <option value="하">하</option>
            </select>
            <select id="avgAge">
                <option disabled selected>평균 나이</option>
                <option value="상">상</option>
                <option value="중">중</option>
                <option value="하">하</option>
            </select>
            <select id="teamType">
                <option disabled selected>팀 유형</option>
                <option value="청소년">청소년</option>
                <option value="대학생">대학생</option>
                <option value="청년">청년</option>
                <option value="직장인">직장인</option>
                <option value="조기축구">조기축구</option>
                <option value="기타 모임">기타 모임</option>
            </select>
            <label for="teamName"></label>
            <input type="text" id="teamName" placeholder="팀명 검색">
            <button id="" class="btn btn-sm btn-dark">검색</button>
        </div>
        <div id="location-area">
            <b>지역 : </b>
            <label for="sido">시도:</label>
            <select id="sido">
				<option value="all" selected>전체</option>
            </select>
            <label for="sigungu">시군구:</label>
            <select id="sigungu">
                <option value="all" selected>전체</option>
            </select>
        </div>
        
        <div id="teams-area">
            <table class="table table-bordered table-hover">
                <thead>
                    <tr>
                        <th>순위</th>
                        <th>팀명</th>
                        <th>지역</th>
                        <th>실력</th>
                        <th>팀원수</th>
                        <th>평균나이</th>
                        <th>팀 유형</th>
                        <th>전적</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td colspan="9">조회된 팀이 없습니다.</td>
                    </tr>
                    <tr>
                        <td>1</td>
                        <td><img width="10%" height="10%" src="https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjq9LJak45k1eZi_TyWyOSy5nU3KetpbfDluj9aty3-1WptLYlvwfZTZIOiaJtf1LPxx0WEsO-XXzOCDlPpY4ymL1Rm8tgdZ1yUOnQbsgUT8Ri1CEA12UGV7lNISQ66dAWvB7QWj0kRlOBa/s1600/3034007-slide-s-3-whats-the-difference-between-a-logo-and-a-symbol.jpg"><span>리메이크 FC</span></td>
                        <td>서울 종로구</td>
                        <td>중</td>
                        <td>15명</td>
                        <td>20대</td>
                        <td>청년</td>
                        <td>2승 0무 1패</td>
                        <td>
                            <button class="btn btn-sm btn-success">경기신청</button>
                            <button class="btn btn-sm btn-primary">가입신청</button>
                        </td>
                    </tr>

                </tbody>
            </table>
            <ul class="pagination justify-content-center">
                <li class="page-item"><a class="page-link" href="#">Previous</a></li>
                <li class="page-item active"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">4</a></li>
                <li class="page-item"><a class="page-link" href="#">5</a></li>
                <li class="page-item"><a class="page-link" href="#">6</a></li>
                <li class="page-item"><a class="page-link" href="#">7</a></li>
                <li class="page-item"><a class="page-link" href="#">8</a></li>
                <li class="page-item"><a class="page-link" href="#">9</a></li>
                <li class="page-item"><a class="page-link" href="#">10</a></li>
                <li class="page-item"><a class="page-link" href="#">Next</a></li>
            </ul>

        </div> <!-- #teams-area -->

    </div> <!-- #outer -->
    
    <script>
    	const optionAll = '<option value="all" selected>전체</option>';
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
    			selectTeams();
    		});
    		
    	});
    	
    	
    	
    	function selectCities(){ // 시도 셀렉트 옵션 조회
    		$.ajax({
    			url : 'city',
    			type : 'get',
    			success : city => {
    				let options = optionAll;
    				for(let i in city){
    					options += '<option value="' + city[i].sido + '">' + city[i].sido + '</option>';
    				}
    				$('#sido').html(options);
    			}
    		});
    	} // selectLocation() End
    	
    	function selectDistricts(){ //시군구 셀렉트 옵션 조회
    		$.ajax({
    			url : 'city/' + $('#sido').val(),
    			type : 'get',
    			success : district => {
    				let options = optionAll;
    				for(let i in district){
    					options += '<option value"' + district[i].sigungu + '">' + district[i].sigungu + '</option>';
    				}
    				$('#sigungu').html(options);
    			}
    			
    		});
    	}
    	
    	function selectTeams(page){ // 팀 목록 조회
    		$.ajax({
    			url : 'teams/' + page,
    			type : 'get',
    			data : {
    				sido : $('#sido').val(),
    				sigungu : $('#sigungu').val()
    			},
    			success : teams => {
    				console.log(teams);
    			}
    		});
    		
    	}
    
    
    </script>
    
</body>
</html>