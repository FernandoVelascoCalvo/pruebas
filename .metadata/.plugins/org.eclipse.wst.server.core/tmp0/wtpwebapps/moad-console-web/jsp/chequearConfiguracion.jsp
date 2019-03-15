<%@ include file="/common/taglibs.jsp"%>

<html>
	<head>
		<title><fmt:message key="chequearConfiguracion.titulo"/></title>
	</head>
	<body>

		<p class="azul"><fmt:message key="chequearConfiguracion.subtitulo"/></p>
		<p class="info"><fmt:message key="chequearConfiguracion.comentario"/></p>

		<div class="listado02">
			<table>
				<logic:iterate id="instHerramienta" name="resultados">
					<tr>
						<td class="col_5 <bean:write name="instHerramienta" property="value.icono"/>" >&nbsp;</td>
						<td class="col_95"><bean:write name="instHerramienta" property="value.nombreInstHerramienta"/></td>


							<td class="probarIzq">
								<c:url var="nuevoURL" value="/chequearConfiguracion.do">
									<c:param name="d-3449996-p" value="${param['d-3449996-p']}"/>
									<c:param name="idProcedimiento" value="${param.idProcedimiento}"/>
									<c:param name="idConfiguracion" value="${param.idConfiguracion}"/>
									<c:param name="idInstHerramienta" value="${instHerramienta.value.idInstHerramienta}"/>
								</c:url>
								<html-el:link href="${nuevoURL}" styleClass="enlace_boton">
									<fmt:message key="chequear.enlace.probar"/>
								</html-el:link>
							</td>
					</tr>
					<tr class="<bean:write name="instHerramienta" property="value.estiloFilaError"/>">
						<td class="col_5 info" >&nbsp;</td>
						<td colspan="2"><bean:write name="instHerramienta" property="value.mensajeError"/></td>
					</tr>
				</logic:iterate>
			</table>

			<!-- Enlace para volver a la página que listas las configuraciones -->
			<c:url var="volverURL" value="/listadoConfiguracionHerramientas.do">
				<c:param name="d-3449996-p" value="${param['d-3449996-p']}"/>
				<c:param name="idProcedimiento" value="${param.idProcedimiento}"/>
				<c:param name="idConfiguracion" value="${param.idConfiguracion}"/>
			</c:url>
			<html-el:link href="${volverURL}" styleClass="btn_volver_center">
				<fmt:message key="comun.enlace.volver"/>
			</html-el:link>

		</div>
	</body>

</html>
