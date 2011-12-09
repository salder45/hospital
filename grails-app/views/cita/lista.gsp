
<%@ page import="org.hospital.Cita" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'cita.label', default: 'Cita')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		
		
		<div id="list-cita" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="cita" title="${message(code: 'cita.cita.label', default: 'Cita')}" />
					
						<g:sortableColumn property="status" title="${message(code: 'cita.status.label', default: 'Status')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'cita.dateCreated.label', default: 'Date Created')}" />
					
						<th><g:message code="cita.doctor.label" default="Doctor" /></th>
					
						<g:sortableColumn property="lastUpdated" title="${message(code: 'cita.lastUpdated.label', default: 'Last Updated')}" />
					
						<th><g:message code="cita.paciente.label" default="Paciente" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${citaList}" status="i" var="cita">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="ver" id="${cita.id}">${fieldValue(bean: cita, field: "cita")}</g:link></td>
					
						<td>${fieldValue(bean: cita, field: "status")}</td>
					
						<td><g:formatDate date="${cita.dateCreated}" /></td>
					
						<td>${fieldValue(bean: cita, field: "doctor")}</td>
					
						<td><g:formatDate date="${cita.lastUpdated}" /></td>
					
						<td>${fieldValue(bean: cita, field: "paciente")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${citaTotal}" />
			</div>
		</div>
	</body>
</html>
