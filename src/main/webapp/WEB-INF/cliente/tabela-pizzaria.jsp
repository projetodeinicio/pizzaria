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
			<td>Endereco</td>
			<td>Atendendo desde</td>
			<td>Entre em contato</td>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${pizzarias}" var="pizzaria">
			<tr data-id="${pizzaria.id}">
				<td>${pizzaria.id}</td>
				<td>${pizzaria.nome}</td>
				<td>${pizzaria.endereco}</td>
				<td>
				<fmt:formatDate value="${pizzaria.dataCadastro}" pattern="dd/MM/yyyy"/>
				</td>
				<td><a href="#">Contato</a></td>
		</c:forEach>

	</tbody>
	<tfoot>
		<tr>
			<td colspan="6">Pizzarias cadastrados:<span id="qtd-pizzaria"> ${pizzarias.size()}</span></td>
		</tr>
	</tfoot>
</table>