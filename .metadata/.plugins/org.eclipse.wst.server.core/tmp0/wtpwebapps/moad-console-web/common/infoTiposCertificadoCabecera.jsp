<%@ include file="/common/taglibs.jsp"%>

			<!-- Información del Tipo de Registro -->
			<div class="cabeceraMedio">
				<c:url var="nuevoURL" value="/listadoTipoCertificadoPerfiles.do">
					<c:param name="idProcedimiento" value="${param.idProcedimiento}"/>
					<c:param name="idTipoCertificado" value="${param.idTipoCertificado}"/>				
				</c:url>
				<h2>
					<html-el:link href="${nuevoURL}">
						<strong>Tipo de Certificado: </strong><bean:write name="tipoCertificado" property="entidad"/>
													- <bean:write name="tipoCertificado" property="tipo"/>
					</html-el:link>
				</h2>
			</div>
