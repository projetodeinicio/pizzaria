<%@ include file="../../templates/head.jsp"%>
<table
	class="table table-hover table-condensed table-striped table-bordered">
	<thead>
		<tr id="cabecalho">
			<td>#</td>
			<td>Nome</td>
			<td>endereco</td>
			<td>dataCompra</td>
			<td>email</td>
			<td>telefone</td>
			<td>Celular</td>
			<td>Preço</td>
			<td>Pizzas</td>
			<td>Ações</td>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${clientes}" var="cliente">
			<tr data-id="${cliente.id}">
			
				<td>${cliente.id}</td>
				<td>${cliente.nome}</td>
				<td>${cliente.endereco}</td>
				<td>
				<fmt:formatDate value="${cliente.dataCompra}" pattern="dd/MM/yyyy"/>
				</td>
				<td>${cliente.email}</td>
				<td>${cliente.telefone}</td>
				<td>${cliente.telefone2}</td>
				<td>
				<fmt:formatNumber value="${cliente.preco}" type="currency"/>
				</td>
				<td>
					<c:forEach items="${cliente.pizzas}" var="pizza">
						${pizza.nome} ,
					</c:forEach>
				</td>
				<td><button type="button" class="btn btn-warning btn-editar">Editar</button>
					<button type="button" class="btn btn-danger btn-deletar">Apagar</button>
				</td>
			</tr>
		</c:forEach>

	</tbody>
	<tfoot>
		<tr>
			<td colspan="10">Clientes cadastrados:<span id="qtd-cliente"> ${clientes.size()}</span></td>
		</tr>
		<tr>
			<td colspan="10">
				<button type="button" class="btn btn-primary" data-toggle="modal"
					data-target="#modal-cliente">Cadastrar Cliente</button>
			</td>
		</tr>
	</tfoot>
</table>