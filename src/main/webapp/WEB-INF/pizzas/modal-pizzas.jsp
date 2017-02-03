<div class="modal fade" id="modal-pizza" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
		<form id="form-pizza" method="POST" >
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">Informacoes da Pizza</h4>
			</div>
			<div class="modal-body">
			<label for="nome">Nome: </label>
			<input id="nome" name="nome" class="form-control">
			
			<label for="preco">Preço: </label>
			<input id="preco" name="preco" class="form-control">
			
			<label for="categoria">Categoria: </label>
			<select id="categoria" name="categoria" class="form-control">
			<option value="">---selecione---</option>
				<c:forEach items="${categorias}" var="categoria">
				<option value="${categoria}">${categoria}</option>
				</c:forEach>
			</select>
			
			<label for="ingredientes">Ingredientes: </label>
			<select id="ingredientes" name="ingredientes" class="form-control" multiple="multiple">
			<option value="">---selecione---</option>
				<c:forEach items="${ingredientes}" var="ingrediente">
				<option value="${ingrediente.id}">${ingrediente.nome}</option>
				</c:forEach>
			</select>
			
			<input id="id" name="id" type="hidden">
			<input type="hidden" id="_csrf" name="_csrf" value="${_csrf.token}">
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
				<button id="btn-salvar" type="button" class="btn btn-primary" >Salvar Informacoes</button>
			</div>
		  </form>
		</div>
	</div>
</div>