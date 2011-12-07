
<%@ page import="general.Usuario" %>
<!doctype html>
<html>
  <head>
    <meta name="layout" content="main">
  <g:set var="entityName" value="${message(code: 'usuario.label', default: 'Usuario')}" />
  <title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
  <a href="#show-usuario" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
  <!--<div class="nav" role="navigation">
    <ul>
      <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
      <li><g:link class="list" action="lista"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
      <li><g:link class="create" action="crear"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
    </ul>
  </div>-->
  <div id="show-usuario" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityName]" /></h1>
    <g:if test="${flash.message}">
      <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list usuario">

      <g:if test="${usuario?.username}">
        <li class="fieldcontain">
          <span id="username-label" class="property-label"><g:message code="usuario.username.label" default="Username" /></span>

          <span class="property-value" aria-labelledby="username-label"><g:fieldValue bean="${usuario}" field="username"/></span>

        </li>
      </g:if>
      <!--			
                                      <g:if test="${usuario?.password}">
                                      <li class="fieldcontain">
                                              <span id="password-label" class="property-label"><g:message code="usuario.password.label" default="Password" /></span>
                                              
                                                      <span class="property-value" aria-labelledby="password-label"><g:fieldValue bean="${usuario}" field="password"/></span>
                                              
                                      </li>
                                      </g:if>-->

      <g:if test="${usuario?.nombre}">
        <li class="fieldcontain">
          <span id="nombre-label" class="property-label"><g:message code="usuario.nombre.label" default="Nombre" /></span>

          <span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${usuario}" field="nombre"/></span>

        </li>
      </g:if>

      <g:if test="${usuario?.apellidoPaterno}">
        <li class="fieldcontain">
          <span id="apellidoPaterno-label" class="property-label"><g:message code="usuario.apellidoPaterno.label" default="Apellido Paterno" /></span>

          <span class="property-value" aria-labelledby="apellidoPaterno-label"><g:fieldValue bean="${usuario}" field="apellidoPaterno"/></span>

        </li>
      </g:if>

      <g:if test="${usuario?.apellidoMaterno}">
        <li class="fieldcontain">
          <span id="apellidoMaterno-label" class="property-label"><g:message code="usuario.apellidoMaterno.label" default="Apellido Materno" /></span>

          <span class="property-value" aria-labelledby="apellidoMaterno-label"><g:fieldValue bean="${usuario}" field="apellidoMaterno"/></span>

        </li>
      </g:if>

      <g:if test="${usuario?.telefono}">
        <li class="fieldcontain">
          <span id="telefono-label" class="property-label"><g:message code="usuario.telefono.label" default="Telefono" /></span>

          <span class="property-value" aria-labelledby="telefono-label"><g:fieldValue bean="${usuario}" field="telefono"/></span>

        </li>
      </g:if>

      <g:if test="${usuario?.telefonoCelular}">
        <li class="fieldcontain">
          <span id="telefonoCelular-label" class="property-label"><g:message code="usuario.telefonoCelular.label" default="Telefono Celular" /></span>

          <span class="property-value" aria-labelledby="telefonoCelular-label"><g:fieldValue bean="${usuario}" field="telefonoCelular"/></span>

        </li>
      </g:if>

      <g:if test="${usuario?.email}">
        <li class="fieldcontain">
          <span id="email-label" class="property-label"><g:message code="usuario.email.label" default="Email" /></span>

          <span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${usuario}" field="email"/></span>

        </li>
      </g:if>

      <g:if test="${usuario?.accountExpired}">
        <li class="fieldcontain">
          <span id="accountExpired-label" class="property-label"><g:message code="usuario.accountExpired.label" default="Account Expired" /></span>

          <span class="property-value" aria-labelledby="accountExpired-label"><g:formatBoolean boolean="${usuario?.accountExpired}" /></span>

        </li>
      </g:if>

      <g:if test="${usuario?.accountLocked}">
        <li class="fieldcontain">
          <span id="accountLocked-label" class="property-label"><g:message code="usuario.accountLocked.label" default="Account Locked" /></span>

          <span class="property-value" aria-labelledby="accountLocked-label"><g:formatBoolean boolean="${usuario?.accountLocked}" /></span>

        </li>
      </g:if>

      <g:if test="${usuario?.citasDoctor}">
        <li class="fieldcontain">
          <span id="citasDoctor-label" class="property-label"><g:message code="usuario.citasDoctor.label" default="Citas Doctor" /></span>

        <g:each in="${usuario.citasDoctor}" var="c">
          <span class="property-value" aria-labelledby="citasDoctor-label"><g:link controller="cita" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
        </g:each>

        </li>
      </g:if>

      <g:if test="${usuario?.citasPaciente}">
        <li class="fieldcontain">
          <span id="citasPaciente-label" class="property-label"><g:message code="usuario.citasPaciente.label" default="Citas Paciente" /></span>

        <g:each in="${usuario.citasPaciente}" var="c">
          <span class="property-value" aria-labelledby="citasPaciente-label"><g:link controller="cita" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
        </g:each>

        </li>
      </g:if>

      <g:if test="${usuario?.enabled}">
        <li class="fieldcontain">
          <span id="enabled-label" class="property-label"><g:message code="usuario.enabled.label" default="Enabled" /></span>

          <span class="property-value" aria-labelledby="enabled-label"><g:formatBoolean boolean="${usuario?.enabled}" /></span>

        </li>
      </g:if>

      <g:if test="${usuario?.especialidades?.especialidad}">
        <li class="fieldcontain">
          <span id="especialidades-label" class="property-label"><g:message code="usuario.especialidades.label" default="Especialidades" /></span>

        <g:each in="${usuario.especialidades.especialidad}" var="e">
          <span class="property-value" aria-labelledby="especialidades-label"><g:link controller="especialidad" action="ver" id="${e.id}">${e?.encodeAsHTML()}</g:link></span>
        </g:each>

        </li>
      </g:if>

      <g:if test="${usuario?.passwordExpired}">
        <li class="fieldcontain">
          <span id="passwordExpired-label" class="property-label"><g:message code="usuario.passwordExpired.label" default="Password Expired" /></span>

          <span class="property-value" aria-labelledby="passwordExpired-label"><g:formatBoolean boolean="${usuario?.passwordExpired}" /></span>

        </li>
      </g:if>

    </ol>
    <g:form>
      <fieldset class="buttons">
        <g:hiddenField name="id" value="${usuario?.id}" />
        <g:link class="edit" action="editar" id="${usuario?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
        <g:actionSubmit class="delete" action="eliminar" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
        <!--<g:link class="save" controller="cita" action="crear" id="${usuario?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>-->
        <g:link class="save" controller="cita" action="sendToCita" id="${usuario?.id}"><g:message code="sacar.cita" default="Sacar Cita" /></g:link>
        <g:link class="save" controller="usuario" action="agregarEspecialidad" id="${usuario?.id}"><g:message code="usuario.add.especialidad" default="Sacar Cita" /></g:link>
      </fieldset>
    </g:form>
  </div>
</body>
</html>
