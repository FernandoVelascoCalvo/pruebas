<%@ include file="/common/taglibs.jsp"%>

			<!-- Información del procedimiento -->
			<div class="cabeceraArriba"></div>
			<div class="cabeceraMedio">
			
				<c:if test="${procedimiento.id == 0}">
					<h1>
						<strong>Procedimiento: </strong>Todos
					</h1>
				</c:if>
				
				<c:if test="${procedimiento.id != 0}">
					<c:url var="nuevoURL" value="/listadoProcedimientoConfiguraciones.do">
						<pctmoad:param nombre="idProcedimiento"/>
					</c:url>
					<h1>
						<html-el:link href="${nuevoURL}">
							<strong>Procedimiento: </strong><bean:write name="procedimiento" property="nombre"/>
						</html-el:link>
					</h1>
				</c:if>
			</div>
