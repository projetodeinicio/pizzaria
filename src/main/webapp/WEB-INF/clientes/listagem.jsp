<%@ include file="../../templates/head.jsp"%>
<body>
	<div class="container">
	<jsp:include page="/templates/menu-pizzaria.jsp"></jsp:include>
	<c:if test="${not empty mensagemError}">
		<div>
			<div class="alert alert-danger">${mensagemError}</div>
		</div>
	</c:if>
	<c:if test="${not empty mensagemSucesso}">
		<div>
			<div class="alert alert-success">${mensagemSucesso}</div>
		</div>
	</c:if>
	<section id="sessao-clientes" >
		<%@ include file="tabela-clientes.jsp"%>
	</section>
	<%@ include file="modal-clientes.jsp"%>
	</div>
</body>
<%@ include file="../../templates/footer.jsp"%>
<script src="${path}/static/js/clientes.js"></script>
</html>