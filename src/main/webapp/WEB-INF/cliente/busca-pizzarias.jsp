<%@ include file="../../templates/head.jsp"%>
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
<%@ include file="../../templates/footer.jsp"%>
<script src="${path}/static/js/pizzarias.js"></script>
</html>