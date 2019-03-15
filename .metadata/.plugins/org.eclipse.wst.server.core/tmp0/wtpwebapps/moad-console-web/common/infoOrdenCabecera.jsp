<%@ include file="/common/taglibs.jsp"%>

			<!-- Información de la orden -->
			<div class="cabeceraMedio">
				<c:url var="nuevoURL" value="/listadoOrdenConvocatorias.do">
					<c:param name="idProcedimiento" value="${param.idProcedimiento}"/>
					<c:param name="idOrden" value="${param.idOrden}"/>				
				</c:url>
				<h2>
					<html-el:link href="${nuevoURL}">
						<strong>Orden: </strong><bean:write name="orden" property="titulo"/>
					</html-el:link>
				</h2>
			</div>
