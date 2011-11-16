<%@ page import="org.hospital.Cita" %>



<div class="fieldcontain ${hasErrors(bean: cita, field: 'cita', 'error')} required">
	<label for="cita">
		<g:message code="cita.cita.label" default="Cita" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="cita" precision="day"  value="${cita?.cita}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: cita, field: 'status', 'error')} required">
	<label for="status">
		<g:message code="cita.status.label" default="Status" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="status" required="" value="${cita?.status}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: cita, field: 'doctor', 'error')} required">
	<label for="doctor">
		<g:message code="cita.doctor.label" default="Doctor" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="doctor" name="doctor.id" from="${general.Usuario.list()}" optionKey="id" required="" value="${cita?.doctor?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: cita, field: 'paciente', 'error')} required">
	<label for="paciente">
		<g:message code="cita.paciente.label" default="Paciente" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="paciente" name="paciente.id" from="${general.Usuario.list()}" optionKey="id" required="" value="${cita?.paciente?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: cita, field: 'userCreated', 'error')} required">
	<label for="userCreated">
		<g:message code="cita.userCreated.label" default="User Created" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="userCreated" name="userCreated.id" from="${general.Usuario.list()}" optionKey="id" required="" value="${cita?.userCreated?.id}" class="many-to-one"/>
</div>

