
<%@ page import="general.Usuario" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'usuario.label', default: 'Usuario')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<!--<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="crear"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>-->
		<div id="list-usuario" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
                        <table class="tabla-grails">

				<thead class="tabla-grails">
					<tr class="tabla-grails">
					
						<g:sortableColumn property="username" title="${message(code: 'usuario.username.label', default: 'Username')}"  class="tabla-grails"/>
					
						<g:sortableColumn property="password" title="${message(code: 'usuario.password.label', default: 'Password')}"  class="tabla-grails"/>
					
						<g:sortableColumn property="nombre" title="${message(code: 'usuario.nombre.label', default: 'Nombre')}"  class="tabla-grails"/>
					
						<g:sortableColumn property="apellidoPaterno" title="${message(code: 'usuario.apellidoPaterno.label', default: 'Apellido Paterno')}"  class="tabla-grails"/>
					
						<g:sortableColumn property="apellidoMaterno" title="${message(code: 'usuario.apellidoMaterno.label', default: 'Apellido Materno')}"  class="tabla-grails"/>
					
						<g:sortableColumn property="telefono" title="${message(code: 'usuario.telefono.label', default: 'Telefono')}"  class="tabla-grails"/>
					
					</tr>
				</thead>
				<tbody class="tabla-grails">
				<g:each in="${usuarioList}" status="i" var="usuario">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}"  class="tabla-grails">
					
						<td class="tabla-grails"><g:link action="ver" id="${usuario.id}" class="tabla-grails">${fieldValue(bean: usuario, field: "username")}</g:link></td>
					
						<td class="tabla-grails">${fieldValue(bean: usuario, field: "password")}</td>
					
						<td class="tabla-grails">${fieldValue(bean: usuario, field: "nombre")}</td>
					
						<td class="tabla-grails">${fieldValue(bean: usuario, field: "apellidoPaterno")}</td>
					
						<td class="tabla-grails">${fieldValue(bean: usuario, field: "apellidoMaterno")}</td>
					
						<td> class="tabla-grails"${fieldValue(bean: usuario, field: "telefono")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${usuarioTotal}" />
			</div>
		</div>
	</body>
</html>
