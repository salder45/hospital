
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
  <div class="fieldcontain ${hasErrors(bean: especialidad, field: 'nombre', 'error')} required">
    <label for="especialidad">
      <g:message code="especialidad.especialidad" default="Especialidad" />
      <span class="required-indicator">*</span>
    </label>
    <g:hiddenField id="especialidad" name="especialidad.id" value="${especialidad?.id}"/>
    <g:textField id="especialidadTexto" name="especialidadTexto" value="${especialidad?.nombre}"/>
  </div>
  <fieldset class="buttons">
    <g:submitButton name="search" class="list" value="${message(code: 'search', default: 'Search')}" />
  </fieldset>
</g:form>

</body>
<r:script>
  $(document).ready(function(){
  $("input#especialidadTexto").autocomplete({source:'${createLink(controller:'especialidad', action:'listaEspecialidades')}',
select:function(event,ui){ $("input#especialidad").val(ui.item.id);}  
})
});
</r:script>
</html>
