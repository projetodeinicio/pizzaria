<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<fmt:setLocale value="pt_BR"/>
<table
	class="table table-hover table-condensed table-striped table-bordered">
	<thead>
		<tr id="cabecalho">
			<td>#</td>
			<td>Nome</td>
			<td>Preço</td>
			<td>Categoria</td>
			<td>Ingredientes</td>
			<td>Ações</td>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${pizzas}" var="pizza">
			<tr data-id="${pizza.id}">
			
				<td>${pizza.id}</td>
				<td>${pizza.nome}</td>
				<td>
				<fmt:formatNumber value="${pizza.preco}" type="currency"/>
				</td>
				<td>${pizza.categoria}</td>
				<td>
					<c:forEach items="${pizza.ingredientes}" var="ingrediente">
						${ingrediente.nome} ,
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
			<td colspan="6">Pizzas cadastrados:<span id="qtd-pizza"> ${pizzas.size()}</span></td>
		</tr>
		<tr>
			<td colspan="6">
				<button type="button" class="btn btn-primary" data-toggle="modal"
					data-target="#modal-pizza">Cadastrar Pizza</button>
			</td>
		</tr>
	</tfoot>
</table>