<%@page import="es.ja.cice.pct.moad.webapp.util.ClaseConstante"%>
<%@ include file="/common/taglibs.jsp"%>
	<%ClaseConstante claseConstante = new ClaseConstante();
	String nombreConsejeria = claseConstante.obtenerNombreConsejeria();
	String urlImagen = claseConstante.obtenerURlConfigurado();%>
	<img src="<c:url value='<%= urlImagen %>'/>" alt="Junta de Andalucía"/>
	<form name="reloj">
		<div class="estilo_fecha_marco">
			<script language="javascript">MostrarFechaActual();</script>
		</div>
		<div class="hora">
			<input class="estilo_hora_marco" readOnly size="7" name="digitos">
		</div>
		<script language="javascript">IniciarReloj24();</script>
	</form>
	<div class="estilo_marco_nombre_aplicacion" id="nombreAplicacion" name="nombreAplicacion">Plataforma común de tramitación. Módulo de administración.</div>
	<div class="estilo_marco_nombre_consejeria" id="nombreConsejeria" name="nombreConsejeria"><%= nombreConsejeria %></div>
