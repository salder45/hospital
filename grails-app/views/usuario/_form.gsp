<%@ page import="general.Usuario" %>



<div class="fieldcontain ${hasErrors(bean: usuario, field: 'username', 'error')} required">
	<label for="username">
		<g:message code="usuario.username.label" default="Username" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="username" required="" value="${usuario?.username}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: usuario, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="usuario.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="password" name="password" required="" value="${usuario?.password}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: usuario, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="usuario.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" maxlength="40" pattern="${usuario.constraints.nombre.matches}" required="" value="${usuario?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: usuario, field: 'apellidoPaterno', 'error')} required">
	<label for="apellidoPaterno">
		<g:message code="usuario.apellidoPaterno.label" default="Apellido Paterno" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="apellidoPaterno" maxlength="60" pattern="${usuario.constraints.apellidoPaterno.matches}" required="" value="${usuario?.apellidoPaterno}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: usuario, field: 'apellidoMaterno', 'error')} ">
	<label for="apellidoMaterno">
		<g:message code="usuario.apellidoMaterno.label" default="Apellido Materno" />
		
	</label>
	<g:textField name="apellidoMaterno" maxlength="60" pattern="${usuario.constraints.apellidoMaterno.matches}" value="${usuario?.apellidoMaterno}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: usuario, field: 'telefono', 'error')} ">
	<label for="telefono">
		<g:message code="usuario.telefono.label" default="Telefono" />
		
	</label>
	<g:textField name="telefono" maxlength="14" pattern="${usuario.constraints.telefono.matches}" value="${usuario?.telefono}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: usuario, field: 'telefonoCelular', 'error')} ">
	<label for="telefonoCelular">
		<g:message code="usuario.telefonoCelular.label" default="Telefono Celular" />
		
	</label>
	<g:textField name="telefonoCelular" maxlength="16" pattern="${usuario.constraints.telefonoCelular.matches}" value="${usuario?.telefonoCelular}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: usuario, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="usuario.email.label" default="Email" />
		
	</label>
	<g:field type="email" name="email" value="${usuario?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: usuario, field: 'accountExpired', 'error')} ">
	<label for="accountExpired">
		<g:message code="usuario.accountExpired.label" default="Account Expired" />
		
	</label>
	<g:checkBox name="accountExpired" value="${usuario?.accountExpired}" />
</div>

<div class="fieldcontain ${hasErrors(bean: usuario, field: 'accountLocked', 'error')} ">
	<label for="accountLocked">
		<g:message code="usuario.accountLocked.label" default="Account Locked" />
		
	</label>
	<g:checkBox name="accountLocked" value="${usuario?.accountLocked}" />
</div>

<div class="fieldcontain ${hasErrors(bean: usuario, field: 'citasDoctor', 'error')} ">
	<label for="citasDoctor">
		<g:message code="usuario.citasDoctor.label" default="Citas Doctor" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${usuario?.citasDoctor?}" var="c">
    <li><g:link controller="cita" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="cita" action="create" params="['usuario.id': usuario?.id]">${message(code: 'default.add.label', args: [message(code: 'cita.label', default: 'Cita')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: usuario, field: 'citasPaciente', 'error')} ">
	<label for="citasPaciente">
		<g:message code="usuario.citasPaciente.label" default="Citas Paciente" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${usuario?.citasPaciente?}" var="c">
    <li><g:link controller="cita" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="cita" action="create" params="['usuario.id': usuario?.id]">${message(code: 'default.add.label', args: [message(code: 'cita.label', default: 'Cita')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: usuario, field: 'enabled', 'error')} ">
	<label for="enabled">
		<g:message code="usuario.enabled.label" default="Enabled" />
		
	</label>
	<g:checkBox name="enabled" value="${usuario?.enabled}" />
</div>

<div class="fieldcontain ${hasErrors(bean: usuario, field: 'especialidades', 'error')} ">
	<label for="especialidades">
		<g:message code="usuario.especialidades.label" default="Especialidades" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${usuario?.especialidades?}" var="e">
    <li><g:link controller="especialidad" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="especialidad" action="create" params="['usuario.id': usuario?.id]">${message(code: 'default.add.label', args: [message(code: 'especialidad.label', default: 'Especialidad')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: usuario, field: 'passwordExpired', 'error')} ">
	<label for="passwordExpired">
		<g:message code="usuario.passwordExpired.label" default="Password Expired" />
		
	</label>
	<g:checkBox name="passwordExpired" value="${usuario?.passwordExpired}" />
</div>

