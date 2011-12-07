<%@ page import="org.hospital.Especialidad" %>



<div class="fieldcontain ${hasErrors(bean: especialidad, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="especialidad.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" required="" value="${especialidad?.nombre}"/>
</div>
<!--
<div class="fieldcontain ${hasErrors(bean: especialidad, field: 'doctores', 'error')} ">
	<label for="doctores">
		<g:message code="especialidad.doctores.label" default="Doctores" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${especialidad?.doctores?}" var="d">
    <li><g:link controller="doctorEspecialidad" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="doctorEspecialidad" action="create" params="['especialidad.id': especialidad?.id]">${message(code: 'default.add.label', args: [message(code: 'doctorEspecialidad.label', default: 'DoctorEspecialidad')])}</g:link>
</li>
</ul>
-->
</div>

