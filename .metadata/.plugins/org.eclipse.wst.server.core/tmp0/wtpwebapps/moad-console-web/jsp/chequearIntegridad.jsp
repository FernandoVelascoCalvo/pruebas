<%@ include file="/common/taglibs.jsp"%>

<%@page import="es.ja.cice.pct.moad.webapp.ConstantesWeb"%>
<html>
	<head>
		<title><fmt:message key="chequearIntegridad.titulo"/></title>
	</head>

	<body>

		<p class="azul"><fmt:message key="chequearIntegridad.subtitulo"/></p>
		<p class="info"><fmt:message key="chequearIntegridad.comentario"/></p>

		<!-- Información del procedimiento -->
		<jsp:include page="/common/infoProcedimientoCabecera.jsp"/>
		<div class="cabeceraAbajo"></div>

		<!-- Pestañas -->
		<c:set var="tabChequearIntegridad" value="seleccionada" scope="request"/>
		<jsp:include page="/common/subPestanasProcedimiento.jsp"/>

		<div class="listado02">
			<table>

				<tr>
					<td class="col_5 <bean:write name="resultados" property="iconoProcedimiento" />" >&nbsp;</td>
					<td class="col_5" ><bean:write name="resultados" property="enlaceInformeProcedimiento" filter="false"/></td>
					<td class="col_85"><fmt:message key="chequearIntegridad.test.procedimientos"/></td>
					<td class="col_5"><a class="probar" href="chequearIntegridad.do?idTest=<%=ConstantesWeb.ID_TEST_PROCEDIMIENTOS%>&idProcedimiento=<c:out value="${param.idProcedimiento}"/>"><fmt:message key="chequear.enlace.probar"/></a></td>
				</tr>

				<tr class="trimpar">
					<td class="col_5 <bean:write name="resultados" property="iconoUsuario" />" >&nbsp;</td>
					<td class="col_5" ><bean:write name="resultados" property="enlaceInformeUsuario" filter="false"/></td>
					<td class="col_85"><fmt:message key="chequearIntegridad.test.usuarios"/></td>
					<td class="col_5"><a class="probar" href="chequearIntegridad.do?idTest=<%=ConstantesWeb.ID_TEST_USUARIOS%>&idProcedimiento=<c:out value="${param.idProcedimiento}"/>"><fmt:message key="chequear.enlace.probar"/></a></td>
				</tr>

				<tr>
					<td class="col_5 <bean:write name="resultados" property="iconoOrden" />" >&nbsp;</td>
					<td class="col_5" ><bean:write name="resultados" property="enlaceInformeOrden" filter="false"/></td>
					<td class="col_85"><fmt:message key="chequearIntegridad.test.ordenes"/></td>
					<td class="col_5"><a class="probar" href="chequearIntegridad.do?idTest=<%=ConstantesWeb.ID_TEST_ORDENES%>&idProcedimiento=<c:out value="${param.idProcedimiento}"/>"><fmt:message key="chequear.enlace.probar"/></a></td>
				</tr>

				<tr class="trimpar">
					<td class="col_5 <bean:write name="resultados" property="iconoConvocatoria" />" >&nbsp;</td>
					<td class="col_5" ><bean:write name="resultados" property="enlaceInformeConvocatoria" filter="false"/></td>
					<td class="col_85"><fmt:message key="chequearIntegridad.test.convocatorias"/></td>
					<td class="col_5"><a class="probar" href="chequearIntegridad.do?idTest=<%=ConstantesWeb.ID_TEST_CONVOCATORIAS%>&idProcedimiento=<c:out value="${param.idProcedimiento}"/>"><fmt:message key="chequear.enlace.probar"/></a></td>
				</tr>

				<tr>
					<td class="col_5 <bean:write name="resultados" property="iconoPerfil" />" >&nbsp;</td>
					<td class="col_5"><bean:write name="resultados" property="enlaceInformePerfil" filter="false"/></td>
					<td class="col_85"><fmt:message key="chequearIntegridad.test.perfiles"/></td>
					<td class="col_5"><a class="probar" href="chequearIntegridad.do?idTest=<%=ConstantesWeb.ID_TEST_PERFILES%>&idProcedimiento=<c:out value="${param.idProcedimiento}"/>"><fmt:message key="chequear.enlace.probar"/></a></td>
				</tr>

				<tr class="trimpar">
					<td class="col_5 <bean:write name="resultados" property="iconoEmpleado" />" >&nbsp;</td>
					<td class="col_5"><bean:write name="resultados" property="enlaceInformeEmpleado" filter="false"/></td>
					<td class="col_85"><fmt:message key="chequearIntegridad.test.empleados"/></td>
					<td class="col_5"><a class="probar" href="chequearIntegridad.do?idTest=<%=ConstantesWeb.ID_TEST_EMPLEADOS%>&idProcedimiento=<c:out value="${param.idProcedimiento}"/>"><fmt:message key="chequear.enlace.probar"/></a></td>
				</tr>

				<tr>
					<td class="col_5 <bean:write name="resultados" property="iconoTodos" />" >&nbsp;</td>
					<td class="col_5">&nbsp;</td>
					<td class="col_85"><fmt:message key="chequearIntegridad.test.todos"/></td>
					<td class="col_5"><a class="probar" href="chequearIntegridad.do?idTest=<%=ConstantesWeb.ID_TEST_TODOS%>&idProcedimiento=<c:out value="${param.idProcedimiento}"/>"><fmt:message key="chequear.enlace.probar"/></a></td>
				</tr>

			</table>
		</div>
	</body>
</html>

