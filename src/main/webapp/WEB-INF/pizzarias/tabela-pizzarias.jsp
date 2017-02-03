<%@ include file="../../templates/head.jsp"%>
<fmt:setLocale value="pt_BR"/>
<table
	class="table table-hover table-condensed table-striped table-bordered">
	<thead>
		<tr id="cabecalho">
			<td>#</td>
			<td>Login</td>
			<td>Senha</td>
			<td>Data de Cad</td>
			<td>Nome</td>
			<td>Endereço</td>
			<td>E-mail</td>
			<td>Telefone</td>
			<td>Permissões</td>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${pizzarias}" var="pizzaria">
			<tr data-id="${pizzaria.id}">
			
				<td>${pizzaria.id}</td>
				<td>${pizzaria.usuario.login}</td>
				<td>${pizzaria.usuario.senha}</td>
				<td>
				<fmt:formatDate value="${pizzaria.dataCadastro}" pattern="dd/MM/yyyy"/>
				</td>
				<td>${pizzaria.nome}</td>
				<td>${pizzaria.endereco}</td>
				<td>${pizzaria.email}</td>
				<td>${pizzaria.telefone}</td>
				<td>${pizzaria.permissoes.nome}</td>
			</tr>
		</c:forEach>

	</tbody>
	<tfoot>
		<tr>
			<td colspan="9">Adms cadastrados:<span id="qtd-pizzarias"> ${pizzarias.size()}</span></td>
		</tr>
		<tr>
			<td colspan="9">
				<button type="button" class="btn btn-primary" data-toggle="modal"
					data-target="#modal-pizzarias">Cadastrar Administrador</button>
			</td>
		</tr>
	</tfoot>
</table>