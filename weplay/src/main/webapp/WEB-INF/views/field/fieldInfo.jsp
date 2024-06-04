<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>WEPLAY:FieldInfo</title>
    
    <style>
        #outer{
            width:80%;
            margin: auto;
            padding-bottom: 4%;
            padding-top: 2%;
            background-color: white;
        }
        #map{
            padding-right: 2%;
            padding-left: 5%;
        }
        #field-body{
            display: flex;
        }
        #map{
            width: 50%;
            height: 400px;
            margin-left: 4%;
            margin-bottom:1%;
            border: 4px solid black;
        }
        #content-area{
            width: 50%;
            padding-left: 2%;
            padding-top: 2%;
        }
        #rentalTime{
            width: 40%;
            text-align: center;
        }
        #price{
            text-align: right;
            width: 26%;
        }
        .rent-btn{
            margin-left: 65%;
        }
        #field-footer{
            text-align: center;
            margin: 1%;
        }
        .hidden{
            display: none;
        }
        .modal-body{
            p{
                font-size: 120%;
                line-height: 200%;
                margin: auto;
            }
        }
    </style>
</head>
<body>
	
	<jsp:include page="../common/header.jsp"/>
	
    <script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
	
    <div id="outer">
        <div id="field-body">
            <div id="map">
                
            </div>
            <div id="content-area">
                <div id="info-area">
                	<input type="hidden" id="fieldNo" value="${ field.fieldNo }"/>
                    <h2 id="fieldName">${ field.fieldName }</h2>
                    <p>
                        <label>상세 주소 : </label> &nbsp; <b id="address"></b> <br>
                        <label>번호 : </label> &nbsp; <b id="phone"></b> <br>
                        <label>크기 : </label> &nbsp; <b>${ field.size }</b> <br>
                        <label>바닥 재료 : </label> &nbsp; <b>${ field.ground }</b> <br>
                        <label>준공연도 : </label> &nbsp; <b>${ field.builtYear }</b>
                    </p>
                </div>
                
                <c:if test="${ field.builtYear ne '정보 없음' and fn:substring(field.builtYear, 0, 1) eq 2 }">
	                <c:set var="price" value="${ (fn:substring(field.builtYear, 2, 4)) * 1000 + 50000 }"/>
                </c:if>
                
                <div id="input-area" class="hidden">
                    <div>
                        <label>대여일 : </label> <input type="date" id="rentalDate"> <br>
                        <label>대여시간 : </label> 
                        <select id="rentalTime" class="timepicker" disabled>
                        	<option selected disabled>대여 시간 선택<option>
                        </select> <br>
                        <label>가격 : </label> <input type="number" id="price" value="<c:out value="${ price }" default="50000"/>" readonly>원
                    </div>
                    <div>
                        <button id="rentField" class="btn btn-primary rent-btn" data-toggle="modal" data-target="#rentModal">대여</button>
                    </div>
                </div>
                
                <div id="btn-area">
                	<c:if test="${not empty sessionScope.loginUser }">
                    	<button type="button" id="toRentBtn" class="btn btn-outline-primary rent-btn">대여하기</button>
                	</c:if>
                </div>
            </div>
        </div>
        <div id="field-footer">
            <button onclick="history.back();" class="btn btn-secondary">뒤로가기</button>
        </div>
    </div>

    <!-- Modal -->
    <div class="modal" id="rentModal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">대여 정보</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <div class="modal-body">
                    <h4></h4>
                    <p>
                        
                    </p>
                </div>
                <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                <button type="button" id="rent-submit" class="btn btn-danger" data-dismiss="modal">결제</button>    
            </div>
                
            </div>
        </div>
    </div> 
    
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=06c5b1c8b461e0e35807203cefbc0738&libraries=services"></script>
    
	<script type="text/javascript" src="resources/js/field/kakaoMap.js"></script>
	
    <script type="text/javascript" src="resources/js/field/fieldInfo.js"></script>
    
</body>
</html>