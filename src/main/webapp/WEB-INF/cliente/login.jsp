<%@ include file="../../templates/head.jsp"%>
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
<%@ include file="../../templates/footer.jsp"%>
</html>