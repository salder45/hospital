
<%@ page import="general.hospital.*" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'usuario.label', default: 'Usuario')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
		<r:require module="jquery-ui"/>
	</head>
	

	
	<body>
			
  <div class="fieldcontain ${hasErrors(bean: usuario, field: 'nombre', 'error')} required">
  <label for="usuario">
    <g:message code="usuario.label" default="Usuario" />
    <span class="required-indicator">*</span>
  </label>
  <!--<g:select id="usuario" name="usuario.id" from="${general.Usuario.list()}" optionKey="id" required="" value="${usuario?.id}" class="many-to-one"/>-->
  <g:hiddenField id="usuario" name="usuario.id" value="${usuario?.id}"/>
  <g:textField id="usuarioTexto" name="usuarioTexto" value="${usuario?.nombreCompleto}"/>
</div>
	</body>
	<r:script>
  $(document).ready(function(){
  $("input#usuarioTexto").autocomplete({source:'${createLink(controller:'usuario', action:'buscaUsuariosDoctor')}',
  select:function(event,ui){ $("input#usuario").val(ui.item.id);}  
  })
  });
</r:script>
</html>
