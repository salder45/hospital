
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
<g:form action="ver" >
  <div class="fieldcontain ${hasErrors(bean: usuario, field: 'nombre', 'error')} required">
    <label for="usuario">
      <g:message code="usuario.doctor" default="Usuario" />
      <span class="required-indicator">*</span>
    </label>
    <g:hiddenField id="usuario" name="usuario.id" value="${usuario?.id}"/>
    <g:textField id="usuarioTexto" name="usuarioTexto" value="${usuario?.nombreCompleto}"/>
  </div>
  <fieldset class="buttons">
    <g:submitButton name="search" class="list" value="${message(code: 'search', default: 'Search')}" />
  </fieldset>
</g:form>

</body>
<r:script>
  $(document).ready(function(){
  $("input#usuarioTexto").autocomplete({source:'${createLink(controller:'usuario', action:'buscaUsuariosDoctor')}',
select:function(event,ui){ $("input#usuario").val(ui.item.id);}  
})
});
</r:script>
</html>
