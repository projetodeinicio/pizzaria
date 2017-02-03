<div class="modal fade" id="modal-pizzarias" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
		<form id="form-pizzarias" method="POST" >
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">Informacoes dos Administradores</h4>
			</div>
			<div class="modal-body">
			
			<label for="dataCadastro">Data de cadastro: </label>
			<input id="dataCadastro" name="dataCadastro" class="form-control">
			
			<label for="endereco">Endereço: </label>
			<input id="endereco" name="endereco" class="form-control">
			
			<label for="login">Login: </label>
			<input id="login" name="login" class="form-control">
			
			<label for="nome">Nome: </label>
			<input id="nome" name="nome" class="form-control">
			
			<label for="senha">Senha: </label>
			<input type="password" id="senha" name="senha" class="form-control">
			
			<label for="permissoes">permissoes: </label>
			<select id="permissoes" name="permissoes" class="form-control">
			<option value="">---selecione---</option>
				<c:forEach items="${permissoes}" var="permissoe">
				<option value="${permissoe.id}">${permissoe.nome}</option>
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