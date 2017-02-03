<div class="modal fade" id="modal-ingrediente" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
		<form id="form-ingrediente" method="POST" >
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">Informacoes do Ingrediente</h4>
			</div>
			<div class="modal-body">
			<label for="nome">Nome: </label>
			<input id="nome" name="nome" class="form-control">
			
			<label for="categoria">Categoria: </label>
			<select id="categoria" name="categoria" class="form-control">
			<option value="">---selecione---</option>
			<option value="FRIOS">FRIOS</option>
			<option value="SALADA">SALADA</option>
			<option value="CARNE">CARNE</option>
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