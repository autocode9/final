<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>WEPLAY:Fields</title>
    <style>
        #outer{
            width:80%;
            margin: auto;
            padding-bottom: 4%;
            padding-top: 2%;
            background-color: white;
        }
        #search-area{
            width: 100%;
            text-align: center;
            margin-top: 2%;
            margin-bottom: 2%;
        }
        #result-area{
        	width: 100%;
            text-align: right;
            margin-bottom: 2%;
            padding-right: 2%;
        }
        #fields-area{
        	padding-left: 4%;
        	padding-right: 4%;
        }
        #field-page-area li:hover{
        	cursor: pointer;
        }
    </style>
</head>
<body>
	
	<jsp:include page="../common/header.jsp"/>
	
	<script src="resources/js/field/fields.js"></script>
	
    <div id="outer">
        <div id="search-area">
            <label for="category">카테고리:</label>
			<select id="category">
			    <option value="all" selected>전체</option>
			    <option value="fieldName">경기장명</option>
			    <option value="location">지역</option>
			</select>
			<input type="text" id="query" placeholder="검색어 입력"/>
			<button id="searchField" class="btn btn-sm btn-dark">검색</button>
        </div>
        <div id="result-area">
            <p></p>
        </div>
        <div id="fields-area">
            <table class="table table-bordered table-hover">
                <thead>
                    <tr>
                        <th>경기장</th>
			        	<th>지역</th>
			        	<th>바닥 재료</th>
			        	<th>크기</th>
			        	<th>준공연도</th>
			        	<th></th>
                    </tr>
                </thead>
                <tbody>
                    
                </tbody>
            </table>
            <div id="field-page-area">
            	
            </div>
        </div>
    </div>

</body>
</html>