<%@ include file="/common/taglibs.jsp"%>
<%@page import="es.ja.cice.pct.moad.webapp.security.spring.SecurityContextHelper"%>
<%@page import="es.ja.cice.pct.moad.webapp.security.ConstantesSecurity"%>

<% boolean mostrarGestionTablaYProc = (SecurityContextHelper.tienePerfil(ConstantesSecurity.MOAD_PF_ADMIN) ||  
		SecurityContextHelper.tienePerfil(ConstantesSecurity.MOAD_PF_ADMIN_APP) ||
		SecurityContextHelper.tienePerfil(ConstantesSecurity.MOAD_PF_CONSULTA_APP));
	boolean mostrarUsuarios = (SecurityContextHelper.tienePerfil(ConstantesSecurity.MOAD_PF_ADMIN) 
			|| SecurityContextHelper.tienePerfil(ConstantesSecurity.MOAD_PF_ADMIN_USU));

%>

<un:useConstants var="C" className="es.ja.cice.pct.moad.webapp.ConstantesWeb" />
<c:choose>
	<c:when test="${sessionScope.tabID == C.ID_PESTANA_GESTION}">
		<c:set var="tabGestionTablas" value="seleccionado"/>
	</c:when>
	<c:when test="${sessionScope.tabID == C.ID_PESTANA_PROCEDIMIENTO}">
		<c:set var="tabProcedimientos" value="seleccionado"/>
	</c:when>
	<c:when test="${sessionScope.tabID == C.ID_PESTANA_USUARIO}">
		<c:set var="tabUsuarios" value="seleccionado"/>
	</c:when>
</c:choose> 
  
<ul> 
	<% if(mostrarGestionTablaYProc){%>
	<li class="<c:out value="${tabGestionTablas}"/>">
		<html:link href="listadoListados.do" title="Gestión de tablas">
			<fmt:message key="gestion.pestana"/>
		</html:link>
	</li>
	<li class="<c:out value="${tabProcedimientos}"/>">
		<html:link href="listadoProcedimientos.do" title="Procedimientos">
			<fmt:message key="procedimiento.pestana"/>
		</html:link>
	</li>
	<%} %>
	<% if(mostrarUsuarios){%>
	<li class="<c:out value="${tabUsuarios}"/>">
		<html:link href="listadoUsuarios.do" title="Usuarios">
			<fmt:message key="usuario.pestana"/>
		</html:link>
	</li>
	<%} %>
</ul>
 