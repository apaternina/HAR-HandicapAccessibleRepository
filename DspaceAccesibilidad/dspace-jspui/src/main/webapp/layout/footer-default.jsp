<!--
    Version: HAR(Handicap Accessible Repository) 1.0
    Fecha : 14-nov-2014
    Author  : Antonio Paternina - apaternina
    Descripciòn : Se  modifica el key del el texto del footer fmt:message.. para mostrar el texto personalizado
-->


<%--

    The contents of this file are subject to the license and copyright
    detailed in the LICENSE and NOTICE files at the root of the source
    tree and available online at

    http://www.dspace.org/license/

--%>
<%--
  - Footer for home page
--%>
<%--    
Version: HAR(Handicap Accessible Repository)
Fecha : 11-nov-2014, 09:10
Author  : http://www.dspace.org/license
Modificado por : Antonio Paternina - apaternina
Descripciòn : Se agregan atributos a etiquetas y se modifica el codigo html para que los plugines de accesibilidad
              puedan leerlo.
              Se agregan mensajes personalizados
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ page contentType="text/html;charset=UTF-8" %>

<%@ page import="java.net.URLEncoder" %>
<%@ page import="org.dspace.app.webui.util.UIUtil" %>

<%
    String sidebar = (String) request.getAttribute("dspace.layout.sidebar");
    String cssfutco = (String) request.getAttribute("dspace.layout.cssfutco");
%>

<%-- Right-hand side bar if appropriate --%>
<%
    if (sidebar != null) {
%>
</div>
<div class="col-md-3">
    <%= sidebar%>
</div>
</div>       
<%
    }
%>
</div>
<%
    if (cssfutco == null || cssfutco.equals("on")) {
%>
<link rel="stylesheet" href="<%= request.getContextPath()%>/static/css/FUTCO/FUTCO.css" type="text/css" />
<%
            }                                                                 //Added code ends here
%>
</main>
<!--<a id="saltarContent" style="bottom:82px;" class="sr-only"  href="#content2">Saltar el pié de página</a>-->
<%-- Page footer --%>

<footer class="navbar navbar-inverse navbar-bottom bar_footer">

    <div id="designedby" class="container text-muted">
    <!--<fmt:message key="jsp.layout.footer-default.theme-by"/> <a href="http://www.cineca.it"><img
                           src="<%= request.getContextPath()%>/image/logo-cineca-small.png"
                           alt="Logo CINECA" /></a>-->
        <div id="footer_feedback" class="pull-right">                                    
            <p class="text-muted"><fmt:message key="jsp.layout.footer-FUTCO.text"/>&nbsp;
           <!-- <a target="_blank" href="<%= request.getContextPath()%>/feedback"><fmt:message key="jsp.layout.footer-default.feedback"/></a>-->
            <!--<a href="<%= request.getContextPath()%>/htmlmap"></a></p>-->
        </div>
        <div class="software_footer_default"><fmt:message key="jsp.layout-footer-HAR-name"/></div>
    </div>
</footer>
</body>
</html>
