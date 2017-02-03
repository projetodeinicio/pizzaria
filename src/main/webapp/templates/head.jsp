<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%-- <c:set var="ctx">${pageContext.request.contextPath}</c:set>
<c:set var="urlAtual">${pageContext.request.requestURL}</c:set> --%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${titulo}</title>
<c:set var="path" value="${pageContext.request.contextPath}" scope="request"/>
	<style type="text/css">
		@IMPORT url("${path}/static/bootstrap/css/bootstrap.min.css");
		@IMPORT url("${path}/static/bootstrap/css/bootstrap-theme.min.css");
		@IMPORT url("${path}/static/css/estilo.css");
		@IMPORT url("${path}/static/css/jquery-ui.css");
	</style>
</head>