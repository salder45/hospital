
<script type="text/javascript">
  var timeout=500;
  var closetimer=0;
  var ddmenuitem=0;
  
  function mopen(id){
    mcancelclosetime();
    
    if(ddmenuitem) ddmenuitem.style.visibility='hidden';
    
    ddmenuitem=document.getElementById(id);
    ddmenuitem.style.visibility='visible';
  }
  
  function mclose(){
    if(ddmenuitem)ddmenuitem.style.visibility='hidden';
  }
  
  function mclosetime(){
    closetimer=window.setTimeout(mclose,timeout)
  }
  
  function mcancelclosetime(){
    if(closetimer){
      window.clearTimeout(closetimer);
      closetimer=null;
    }
  }
  document.onclick=mclose;
  
</script>
<P align="right">
<div align="right">
  </br>
  <ul id="menuS">
    <li><a  href="${resource(dir: '')}">Home</a></li>
    <li><a href="#" onmouseover="mopen('m1')" onmouseout="mclosetime()">Buscar</a>
      <div id="m1" onmouseover="mcancelclosetime()" onmouseout="mclosetime()" >

        <g:link controller="usuario" action='buscarDoctor' >Doctor</g:link>

        <g:link controller="usuario" action='buscarEspecialidad' >Especialidad</g:link>
        <sec:ifAnyGranted roles="ROLE_ADMIN"><g:link controller="usuario" action='buscarUsuario' >Usuarios</g:link></sec:ifAnyGranted>
      </div>
    </li>
    <li><a href="${createLink(controller:'usuario',action:'crear')}">Registro</a></li>
    <li><sec:ifAnyGranted roles="ROLE_PACIENTE"><a href="#" onmouseover="mopen('m2')" onmouseout="mclosetime()">Cita</a></sec:ifAnyGranted>
    <div id="m2" onmouseover="mcancelclosetime()" onmouseout="mclosetime()" >
      <g:link controller="cita" action='crear' >Agregar</g:link>
      <g:link controller="cita" action='lista' >Lista</g:link>
      <sec:ifAnyGranted roles="ROLE_ASISTENTE"><g:link controller="cita" action='listaAsistente' >Lista Asistente</g:link></sec:ifAnyGranted>      
    </div>
    </li>
    <li><sec:ifAnyGranted roles="ROLE_DOCTOR"><a href="#" onmouseover="mopen('m3')" onmouseout="mclosetime()">Asistente</a></sec:ifAnyGranted>
    <div id="m3" onmouseover="mcancelclosetime()" onmouseout="mclosetime()" >

      <g:link controller="asistente" action='crear' >Agregar Asistente</g:link>

    </div>
    </li>

    <li><sec:ifAnyGranted roles="ROLE_ADMIN"><a href="#" onmouseover="mopen('m4')" onmouseout="mclosetime()">Usuarios</a></sec:ifAnyGranted>
    <div id="m4" onmouseover="mcancelclosetime()" onmouseout="mclosetime()" >

      <g:link controller="usuario" action='buscarUsuario' >Buscar</g:link>
       <g:link controller="usuario" action='lista' >Usuarios</g:link>

    </div>
    </li>
    <li> <sec:ifNotLoggedIn><a href="${createLink(controller:'login')}">Login</a></sec:ifNotLoggedIn></li>
    <li> <sec:ifLoggedIn><a href="${createLink(controller:'logout')}">Salir <sec:loggedInUserInfo field="username"/></a></sec:ifLoggedIn></li>
  </ul>
</div>
</p>
<sec:ifLoggedIn>
  <sec:loggedInUserInfo field="username" />
</sec:ifLoggedIn>
</br>
<div align ="center">
<a href="#page-body" class="skip"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		
		<div id="page-body" role="main">
			 <div id="wrapper">
    
        <div class="slider-wrapper theme-default">
            <div class="ribbon"></div>
            <div id="slider" class="nivoSlider">
                <img src="images/toystory.jpg" alt="" />
                <img src="images/up.jpg" alt="" title="Hacemos Todo Por Tu Salud" />
                <img src="images/walle.jpg" alt="" data-transition="slideInLeft" />
                <img src="images/nemo.jpg" alt="" title="Modernas Instalaciones" />
            </div>
    
        </div>

    </div>
    <script type="text/javascript" src="scripts/jquery-1.6.4.min.js"></script>
    <script type="text/javascript" src="jquery.nivo.slider.pack.js"></script>
    <script type="text/javascript">
    $(window).load(function() {
        $('#slider').nivoSlider();
    });
    </script>
</div>