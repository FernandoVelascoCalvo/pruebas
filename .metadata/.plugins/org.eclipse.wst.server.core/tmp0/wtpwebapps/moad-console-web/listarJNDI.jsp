<%@page import="java.util.Iterator"%>
<%@page import="java.util.HashMap"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="es.ja.cice.pct.moad.util.*"%>

<%



String contextPath = "jdbc/conf_trewa";


UtilesJNDI jndi  = new UtilesJNDI();

out.println("<br><br> DATASOURCES: ACCESO A TREWA<br>");
HashMap<String, DataSource> hmp = jndi.obtenerDataSources(contextPath);

Iterator<String> iter = hmp.keySet().iterator();
while (iter.hasNext()) {
    String strTmp = iter.next();
    out.println("<br>DataSource: "+contextPath+"/"+strTmp);
    out.println("<br>Probando conexioon: "+contextPath+"/"+strTmp);
    if(jndi.validarConexionDS(contextPath, strTmp))
    	out.println("<br>PRUEBA: OK "+strTmp);
    else
        out.println("<br>PRUEBA: ERROR "+strTmp);
    out.println("<br>");
}//while

out.println("<br><br> DATASOURCES: ACCESO A BASES DE DATOS<br>");
contextPath = "jdbc/bbdd";    

hmp = jndi.obtenerDataSources(contextPath);

iter = hmp.keySet().iterator();
while (iter.hasNext()) {
    String strTmp = iter.next();
    out.println("<br>DataSource: "+contextPath+"/"+strTmp);
    out.println("<br>Probando conexioon: "+contextPath+"/"+strTmp);
    if(jndi.validarConexionDS(contextPath, strTmp))
    	out.println("<br>PRUEBA: OK "+strTmp);
    else
        out.println("<br>PRUEBA: ERROR "+strTmp);
    out.println("<br>");    
}//while
    
    
    
out.println("<br>Fin");
%>
