<%@ page import="org.hospital.Cita" %>
<html>
  <head>
    <link rel="stylesheet" href="../demos.css">
  <r:require module="jquery-ui"/>
</head>
<body>
  <script>
          $(function() {
            $( "#citaS" ).datepicker(
          );                 
          });                   

  </script>
  <div class="fieldcontain ${hasErrors(bean: cita, field: 'cita', 'error')} required">
    <label for="cita">
      <g:message code="cita.cita.label" default="Cita" />
      <span class="required-indicator">*</span>
    </label>
    <g:textField name="citaS" required="" value="${cita?.cita}" />
    <!--<g:datePicker name="cita" precision="day"  value="${cita?.cita}"  />-->
  </div>

  <div class="fieldcontain ${hasErrors(bean: cita, field: 'doctor', 'error')} required">
    <label for="doctor">
      <g:message code="cita.doctor.label" default="Doctor" />
      <span class="required-indicator">*</span>
    </label>
    <!--<g:select id="doctor" name="doctor.id" from="${general.Usuario.list()}" optionKey="id" required="" value="${cita?.doctor?.id}" class="many-to-one"/>-->
    <g:hiddenField id="doctor" name="doctor.id" value="${cita?.doctor?.id}"/>
    <g:textField id="doctorTexto" name="doctorTexto" value="${cita?.doctor?.nombreCompleto}"/>
  </div>

  <div class="fieldcontain ${hasErrors(bean: cita, field: 'paciente', 'error')} required">
    <label for="paciente">
      <g:message code="cita.paciente.label" default="Paciente" />
      <span class="required-indicator">*</span>
    </label>
    <g:hiddenField id="paciente" name="paciente.id" value="${cita?.paciente?.id}"/>
    <g:textField id="pacienteTexto" name="pacienteTexto" value="${cita?.paciente?.nombreCompleto}"/>
    <!--<g:select id="paciente" name="paciente.id" from="${general.Usuario.list()}" optionKey="id" required="" value="${cita?.paciente?.id}" class="many-to-one"/>-->
  </div>
  <div class="fieldcontain ${hasErrors(bean: cita, field: 'horario', 'error')} required">
    <label for="horario">
      <g:message code="cita.horario.label" default="Horario" />
      <span class="required-indicator">*</span>
    </label>
    <g:select id="horario" name="horario.id" from="${org.hospital.Horario.list()}" optionKey="id" required="" value="${cita?.horario?.id}" class="many-to-one"/>
  </div>



<r:script>
  $(document).ready(function(){
  $("input#doctorTexto").autocomplete({source:'${createLink(controller:'usuario', action:'buscaUsuariosDoctor')}',
  select:function(event,ui){ $("input#doctor").val(ui.item.id);}  
  })
  $("input#pacienteTexto").autocomplete({source:'${createLink(controller:'usuario', action:'buscaUsuariosPacientes')}',
select:function(event,ui){ $("input#paciente").val(ui.item.id);}  
})
});
</r:script>
</body>
</html>