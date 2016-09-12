<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${titulo}</title>

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
	<section>
		<div id="consulta-pizzarias" class="well">
		<div class="row">
			<div class="col-sm-4">
				<label for="pizza_pesquisa">Que pizza voce vai querer comer hoje ?</label>
					<select id="pizza_pesquisa" class="form-control" >
						<c:forEach items="${pizzas}" var="pizza">
							<option value="${pizza.nome}">${pizza.nome}</option>				
						</c:forEach>
					</select>
			</div>
			<div class="col-sm-4">
				<button id="btn-buscar" class="btn btn-primary">Buscar pizzarias</button>
			</div>
		</div>	
	</div>
		
		<div id="secao-pizzarias"></div>
	</section>
	</div>
</body>
<script src="${path}/static/js/jquery.js"></script>
<script src="${path}/static/js/jquery-2.1.4.min.js"></script>
<script src="${path}/static/js/jquery-validate.min.js"></script>
<script src="${path}/static/js/jquery-validate.js"></script>
<script src="${path}/static/js/jquery-ui.js"></script>
<script src="${path}/static/js/jquery-ui.min.js"></script>
<script src="${path}/static/bootstrap/js/bootstrap.min.js"></script>
<script src="${path}/static/js/pizzarias.js"></script>
</html>