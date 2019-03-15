<%@ include file="/common/taglibs.jsp"%>

<!-- Información del usuario -->
<div class="cabeceraArriba"></div>
<div class="cabeceraMedio">
	<c:url var="nuevoURL" value="/listadoUsuarioRoles.do">
		<c:param name="cdUsuario" value="${param.cdUsuario}" />
		<c:param name="idUsuarios" value="${param.idUsuarios}" />
	</c:url>
	<h1>
		<html-el:link href="${nuevoURL}">
			<strong>Usuario: </strong>
			<bean:write name="usuario" property="nombreCompleto" />
		</html-el:link>
	</h1>
</div>
