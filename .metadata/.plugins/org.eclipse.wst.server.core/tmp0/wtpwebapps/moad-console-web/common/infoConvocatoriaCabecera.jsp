<%@ include file="/common/taglibs.jsp"%>

			<!-- Información de la convocatoria -->
			<div class="cabeceraMedio">
				<c:url var="nuevoURL" value="/listadoConvocatoriaPerfiles.do">
					<c:param name="idProcedimiento" value="${param.idProcedimiento}"/>
					<c:param name="idOrden" value="${param.idOrden}"/>				
					<c:param name="idConvocatoria" value="${param.idConvocatoria}"/>				
				</c:url>
				<h3>
					<html-el:link href="${nuevoURL}">
						<strong>Convocatoria: </strong><bean:write name="convocatoria" property="titulo"/>
					</html-el:link>
				</h3>
			</div>
