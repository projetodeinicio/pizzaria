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
	<section id="sessao-pizzas" >
		<%@ include file="tabela-pizzas.jsp"%>
	</section>
	<%@ include file="modal-pizzas.jsp"%>
	</div>
</body>
<%@ include file="../../templates/footer.jsp"%>
<script src="${path}/static/js/pizzas.js"></script>
</html>