
<%@ page import="org.hospital.Especialidad" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'especialidad.label', default: 'Especialidad')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-especialidad" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="lista"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="crear"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-especialidad" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list especialidad">
			
				<g:if test="${especialidad?.nombre}">
				<li class="fieldcontain">
					<span id="nombre-label" class="property-label"><g:message code="especialidad.nombre.label" default="Nombre" /></span>
					
						<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${especialidad}" field="nombre"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${especialidad?.usuariosDoctores}">
				<li class="fieldcontain">
					<span id="doctores-label" class="property-label"><g:message code="especialidad.doctores.label" default="Doctores" /></span>
					
						<g:each in="${especialidad.usuariosDoctores}" var="d">
						<span class="property-value" aria-labelledby="doctores-label"><g:link controller="usuario" action="ver" id="${d.id}">${d?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${especialidad?.id}" />
					<g:link class="edit" action="editar" id="${especialidad?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="eliminar" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
