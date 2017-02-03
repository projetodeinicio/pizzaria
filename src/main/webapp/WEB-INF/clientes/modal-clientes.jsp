<div class="modal fade" id="modal-cliente" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
		<form id="form-cliente" method="POST" >
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">Informacoes da Cliente</h4>
			</div>
			<div class="modal-body">
			<label for="nome">Nome: </label>
			<input id="nome" name="nome" class="form-control" required>
			
			<label for="endereco">Endereço: </label>
			<input id="preco" name="preco" class="form-control" required>
			
			<label for="dataCompra">data Compra: </label>
			<input id="dataCompra" name="dataCompra" class="form-control" required>
			
			<label for="email">email: </label>
			<input id="email" name="email" class="form-control" required>
			
			<label for="telefone">telefone: </label>
			<input id="telefone" name="telefone" class="form-control" required>
			
			<label for="telefone2">Celular: </label>
			<input id="telefone2" name="telefone2" class="form-control" required>
			
			<label for="preco">preco: </label>
			<input id="preco" name="preco" class="form-control" required>
			
			<label for="pizzas">Pizzas: </label>
			<select id="pizzas" name="pizzas" class="form-control" multiple="multiple" required="required">
			<option value="">---selecione---</option>
				<c:forEach items="${pizzas}" var="pizza">
				<option value="${pizza.id}">${pizza.nome}</option>
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