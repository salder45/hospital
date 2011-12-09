

    <div id="top_left_col">

      <div id="links">
        <ul id="menu">
          <li><a  href="${resource(dir: '')}">&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp Home</a></li>
          <li><a href="#">&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp Buscar</a>
            <ul>
              <li><g:link controller="usuario" action='buscarUsuario' >&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp Doctor </g:link></li>
              <li><g:link controller="especialidad" action='buscarEspecialidad' >&nbsp &nbsp &nbsp &nbsp &nbsp Especialidad</g:link></li>
              <li><sec:ifAnyGranted roles="ROLE_ADMIN"><g:link controller="usuario" action='buscarUsuario'>&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp Usuarios</g:link></sec:ifAnyGranted></li>

            </ul>
          </li>
          <li><a href="${createLink(controller:'usuario',action:'crear')}">&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp Registro</a></li>
          <li><a href="#"><sec:ifAnyGranted roles="ROLE_ASISTENTE">&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp Cita</sec:ifAnyGranted></a>
            <ul>
              <li><g:link controller="cita" action='crear' >&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp Agregar </g:link></li>
              <li><g:link controller="cita" action='lista' >&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp Lista</g:link></li>
              <li><sec:ifAnyGranted roles="ROLE_ASISTENTE"><g:link controller="cita" action='listaAsistente' >&nbsp &nbsp &nbsp &nbsp Lista Asistente</g:link></sec:ifAnyGranted></li>

            </ul>
          </li>
          <li><a href="#"><sec:ifAnyGranted roles="ROLE_DOCTOR">&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp Asistente</sec:ifAnyGranted></a>
            <ul>
              <li><a href="#"><g:link controller="asistente" action='crear' >&nbsp &nbsp &nbsp Agregar Asistente </a></g:link></li>
            </ul>
        </li>
 
        <li><a href="#"><sec:ifAnyGranted roles="ROLE_ADMIN">&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp Usuarios</a></sec:ifAnyGranted>
            <ul>
              <li><g:link controller="usuario" action='buscarUsuario' >&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp Buscar</g:link></li>
              <li><g:link controller="usuario" action='lista' >&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp Usuarios</g:link></li>
            </ul>

          </li>
           <li> <sec:ifNotLoggedIn><a href="${createLink(controller:'login')}">Login</a></sec:ifNotLoggedIn></li>
          <li><sec:ifLoggedIn><a href="${createLink(controller:'logout')}">&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp Salir <sec:loggedInUserInfo field="username"/></a></sec:ifLoggedIn></li>
        </ul>
      </div>

    </div>



