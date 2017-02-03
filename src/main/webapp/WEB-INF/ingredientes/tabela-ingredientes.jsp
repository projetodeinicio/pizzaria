<%@ include file="../../templates/head.jsp"%>
<table class="table table-hover table-condensed table-striped table-bordered">
	<thead>
		<tr id="cabecalho">
			<td>#</td>
			<td>Nome</td>
			<td>Categoria</td>
			<td>Ações</td>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${ingredientes}" var="ingrediente">
			<tr data-id="${ingrediente.id}">
			
				<td>${ingrediente.id}</td>
				<td>${ingrediente.nome}</td>
				<td>${ingrediente.categoria}</td>
				<td><button type="button" class="btn btn-warning btn-editar">Editar</button>
					<button type="button" class="btn btn-danger btn-deletar">Apagar</button>
				</td>
			</tr>
		</c:forEach>

	</tbody>
	<tfoot>
		<tr>
			<td colspan="4">Ingredientes cadastrados:<span id="qtd-ingrediente"> ${ingredientes.size()}</span></td>
		</tr>
		<tr>
			<td colspan="4">
				<button type="button" class="btn btn-primary" data-toggle="modal"
					data-target="#modal-ingrediente">Cadastrar Ingrediente</button>
			</td>
		</tr>
	</tfoot>
</table>