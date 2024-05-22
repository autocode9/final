<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
   #enroll-form{
		background-color: cyan;
		 padding-top: 10px;
		 top: 40%;
		 width:80%;
		 margin:auto;
		 margin-top : 20%;
	}
</style>
<body>
	<jsp:include page="../common/header.jsp" />


	<form id="enroll-form" method="post" action="enrollForm.member">
		<table align="center">
			<tr>
				<td>* 아이디</td>
				<td><input type="text" maxlength="12" required name="userId"></td>
			<tr>
				<td>* 비밀번호</td>
				<td><input type="password" maxlength="15" required
					name="userPwd"></td>
				<td></td>
			</tr>
			<tr>
				<td>* 비밀번호확인</td>
				<td><input type="password" maxlength="15" required></td>
				<td></td>
			</tr>
			<tr>
				<td>* 닉네임</td>
				<td><input type="text" maxlength="5" required name="nickName"></td>
				<td></td>
			</tr>
		</table>

		<div align="center">
			<button type="reset" class="btn btn-sm btn-secondary">취소</button>
			<button type="submit" class="btn btn-sm btn-primary" disabled>회원가입</button>
		</div>

	</form>
	<br>
	<br>
	<br>
	<br>
	<br>
</body>
</html>