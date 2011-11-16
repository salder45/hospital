
<%@ page import="org.hospital.Cita" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'cita.label', default: 'Cita')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-cita" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="lista"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="crear"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-cita" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list cita">
			
				<g:if test="${cita?.cita}">
				<li class="fieldcontain">
					<span id="cita-label" class="property-label"><g:message code="cita.cita.label" default="Cita" /></span>
					
						<span class="property-value" aria-labelledby="cita-label"><g:formatDate date="${cita?.cita}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${cita?.status}">
				<li class="fieldcontain">
					<span id="status-label" class="property-label"><g:message code="cita.status.label" default="Status" /></span>
					
						<span class="property-value" aria-labelledby="status-label"><g:fieldValue bean="${cita}" field="status"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${cita?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="cita.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${cita?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${cita?.doctor}">
				<li class="fieldcontain">
					<span id="doctor-label" class="property-label"><g:message code="cita.doctor.label" default="Doctor" /></span>
					
						<span class="property-value" aria-labelledby="doctor-label"><g:link controller="usuario" action="show" id="${cita?.doctor?.id}">${cita?.doctor?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${cita?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="cita.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${cita?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${cita?.paciente}">
				<li class="fieldcontain">
					<span id="paciente-label" class="property-label"><g:message code="cita.paciente.label" default="Paciente" /></span>
					
						<span class="property-value" aria-labelledby="paciente-label"><g:link controller="usuario" action="show" id="${cita?.paciente?.id}">${cita?.paciente?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${cita?.userCreated}">
				<li class="fieldcontain">
					<span id="userCreated-label" class="property-label"><g:message code="cita.userCreated.label" default="User Created" /></span>
					
						<span class="property-value" aria-labelledby="userCreated-label"><g:link controller="usuario" action="show" id="${cita?.userCreated?.id}">${cita?.userCreated?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${cita?.id}" />
					<g:link class="edit" action="editar" id="${cita?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="eliminar" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
