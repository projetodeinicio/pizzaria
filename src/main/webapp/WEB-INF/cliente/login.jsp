<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Pizzaria - Login</title>

<c:set var="path" value="${pageContext.request.contextPath}" scope="request"/>

	<style type="text/css">
		@IMPORT url("${path}/static/bootstrap/css/bootstrap.min.css");
		@IMPORT url("${path}/static/bootstrap/css/bootstrap-theme.min.css");
		@IMPORT url("${path}/static/css/estilo.css");
	</style>
</head>
<body>
	<div class="container">
	<jsp:include page="/templates/menu-cliente.jsp"></jsp:include>
	<section id="loginn" class="panel panel-primary">
		
		<c:if test='${not empty param["semacesso"]}'>
			<div class="alert alert-danger">
			Usuario e/ou senha incorretos!
			</div>
		</c:if>
	
		<c:if test='${not empty param["saiu"]}'>
			<div class="alert alert-info">
			Você agora estar fora do sistema!
			</div>
		</c:if>
	
		<form action="${path}/autenticar" method="post">
			<div class="panel-heading">
				Pizzaria - Login
			</div>
			<div class="panel-body">
			<label for="usuario">Usuario:</label>
			<input id="usuario" name="usuario" class="form-control" required>
			
			<label for="senha">Senha:</label>
			<input type="password" id="senha" name="senha" class="form-control" required>
			</div>
			
			<div class="panel-footer">
			<button id="btn-login" class="btn btn-primary">Entrar</button>
			</div>
			
			<input type="hidden" id="_csrf" name="_csrf" value="${_csrf.token}">
		</form>
	</section>
	</div>
</body>
<script src="${path}/static/js/jquery.js"></script>
<script src="${path}/static/bootstrap/js/bootstrap.min.js"></script>
</html>