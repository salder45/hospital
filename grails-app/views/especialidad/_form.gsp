<%@ page import="org.hospital.Especialidad" %>



<div class="fieldcontain ${hasErrors(bean: especialidad, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="especialidad.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" required="" value="${especialidad?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: especialidad, field: 'doctor', 'error')} required">
	<label for="doctor">
		<g:message code="especialidad.doctor.label" default="Doctor" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="doctor" name="doctor.id" from="${general.Usuario.list()}" optionKey="id" required="" value="${especialidad?.doctor?.id}" class="many-to-one"/>
</div>

