<%--

    The contents of this file are subject to the license and copyright
    detailed in the LICENSE and NOTICE files at the root of the source
    tree and available online at

    http://www.dspace.org/license/

--%>
<%--
  - Default navigation bar
--%>

<%@page import="org.apache.commons.lang.StringUtils"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ page contentType="text/html;charset=UTF-8" %>

<%@ taglib uri="/WEB-INF/dspace-tags.tld" prefix="dspace" %>

<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="javax.servlet.jsp.jstl.fmt.LocaleSupport" %>
<%@ page import="org.dspace.app.webui.util.UIUtil" %>
<%@ page import="org.dspace.content.Collection" %>
<%@ page import="org.dspace.content.Community" %>
<%@ page import="org.dspace.eperson.EPerson" %>
<%@ page import="org.dspace.core.ConfigurationManager" %>
<%@ page import="org.dspace.browse.BrowseIndex" %>
<%@ page import="org.dspace.browse.BrowseInfo" %>
<%@ page import="java.util.Map" %>
<%
    // Is anyone logged in?
    EPerson user = (EPerson) request.getAttribute("dspace.current.user");

    // Is the logged in user an admin
    Boolean admin = (Boolean)request.getAttribute("is.admin");
    boolean isAdmin = (admin == null ? false : admin.booleanValue());

    // Get the current page, minus query string
    String currentPage = UIUtil.getOriginalURL(request);
    int c = currentPage.indexOf( '?' );
    if( c > -1 )
    {
        currentPage = currentPage.substring( 0, c );
    }

    // E-mail may have to be truncated
    String navbarEmail = null;

    if (user != null)
    {
        navbarEmail = user.getEmail();
    }
    
    // get the browse indices
    
	BrowseIndex[] bis = BrowseIndex.getBrowseIndices();
    BrowseInfo binfo = (BrowseInfo) request.getAttribute("browse.info");
    String browseCurrent = "";
    if (binfo != null)
    {
        BrowseIndex bix = binfo.getBrowseIndex();
        // Only highlight the current browse, only if it is a metadata index,
        // or the selected sort option is the default for the index
        if (bix.isMetadataIndex() || bix.getSortOption() == binfo.getSortOption())
        {
            if (bix.getName() != null)
    			browseCurrent = bix.getName();
        }
    }
%>
 <script  type="text/javascript">

    </script>
       <div class="navbar-header">
         <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
           <span class="icon-bar"></span>
           <span class="icon-bar"></span>
           <span class="icon-bar"></span>
         </button>
           <a id="logo" class="navbar-brand" href="<%= request.getContextPath() %>/"><img class="tamañoLogo" src="<%= request.getContextPath() %>/image/FUTCO/LOGOFITCO_trans.png" alt="logo del repositorio eccesible tecnológico comfenalco"/></a><!--<fmt:message key="jsp.layout.navbar-alt-logo"/> -->
       <!--<img class="tamañoLogo" src="<%= request.getContextPath() %>/image/FUTCO/LOGOFITCO_trans.png" alt="logo del repositorio eccesible tecnológico comfenalco"/> -->
       </div>
       <nav class="collapse navbar-collapse bs-navbar-collapse" role="menubar">
         <ul class="nav navbar-nav">
             <li class="<%= currentPage.endsWith("/home.jsp")? "active" : "" %>"><a tabindex=""  href="<%= request.getContextPath() %>/" accesskey="1"><span class="glyphicon glyphicon-home"></span> <fmt:message key="jsp.layout.navbar-default.home"/></a></li>
                
           <li class="dropdown" role="menuitem"  >
               <a tabindex="" href="#" class="dropdown-toggle" data-toggle="dropdown" accesskey="2"><fmt:message key="jsp.layout.navbar-default.browse"/> <b class="caret"></b></a>
             <ul class="dropdown-menu" role="menu">
               <li role="menuitem" ><a  href="<%= request.getContextPath() %>/community-list"><fmt:message key="jsp.layout.navbar-default.communities-collections"/></a></li>
               
               <!--<li class="divider"></li>-->
               <div class="divider" ></div>
                             
                                <!--<li class=""  >Explorar Items por:</li>-->
                        <strong class="dropdown-header" >Explorar Items por:</strong>
                       
                            
				<%-- Insert the dynamic browse indices here --%>
                                
				<%
					for (int i = 0; i < bis.length; i++)
					{
						BrowseIndex bix = bis[i];
						String key = "browse.menu." + bix.getName();
					%>
                                        <li role="menuitem"><a href="<%= request.getContextPath() %>/browse?type=<%= bix.getName() %>"><fmt:message key="<%= key %>"/></a></li>
					<%	
					}
				%>
				    
				<%-- End of dynamic browse indices --%>

            </ul>
          </li>
          <li id="li_popupAyuda" accesskey="3" class="<%=( currentPage.endsWith( "/help" ) ? "active" : "" ) %>"><dspace:popup page="<%= LocaleSupport.getLocalizedMessage(pageContext, \"help.index\") %>"><fmt:message key="jsp.layout.navbar-default.help"/></dspace:popup></li>
       </ul>
       <div class="nav navbar-nav navbar-right" role="menuitem" >
		<ul class="nav navbar-nav navbar-right">
         <li class="dropdown" >
         <%
    if (user != null)
    {
		%>
                <a  accesskey="4"  tabindex=""   href="#"  class="dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-user"></span> <fmt:message key="jsp.layout.navbar-default.loggedin">
		      <fmt:param><%= StringUtils.abbreviate(navbarEmail, 20) %></fmt:param>
		  </fmt:message> <b class="caret"></b></a>
		<%
    } else {
		%>
             <a accesskey="4"  tabindex="" href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-user"></span> <fmt:message key="jsp.layout.navbar-default.sign"/> <b class="caret"></b></a>
	<% } %>             
             <ul   class="dropdown-menu" tabindex="" accesskey="5" role="navigation">
               <li role="menuitem"><a href="<%= request.getContextPath() %>/mydspace"><fmt:message key="jsp.layout.navbar-default.users"/></a></li>
               <li role="menuitem"><a href="<%= request.getContextPath() %>/subscribe"><fmt:message key="jsp.layout.navbar-default.receive"/></a></li>
               <li role="menuitem"><a href="<%= request.getContextPath() %>/profile"><fmt:message key="jsp.layout.navbar-default.edit"/></a></li>

		<%
		  if (isAdmin)
		  {
		%>
			   <li class="divider"></li>  
               <li><a href="<%= request.getContextPath() %>/dspace-admin"><fmt:message key="jsp.administer"/></a></li>
		<%
		  }
		  if (user != null) {
		%>
		<li><a href="<%= request.getContextPath() %>/logout"><span class="glyphicon glyphicon-log-out"></span> <fmt:message key="jsp.layout.navbar-default.logout"/></a></li>
		<% } %>
             </ul>
           </li>
          </ul>
          
	<%-- Search Box --%>
	<form method="get" action="<%= request.getContextPath() %>/simple-search" class="navbar-form navbar-right" scope="search">
	    
            <div class="form-group">
                <label for="tequery"><fmt:message key="jsp.layout.navbar-default.search"/></label>
                <input tabindex="" type="text" class="keyboard form-control_search" style="width:none;" placeholder="<fmt:message key="jsp.layout.navbar-default.search"/>" name="query" id="tequery" size="25"/>
        </div>
        
        <button tabindex="" type="submit" title="buscar" class="btn btn-primary" value="Buscar" navbar-brand><span class="glyphicon glyphicon-search" role="button" id="btn_search" name="btn_search"></span></button>
<%--               <br/><a href="<%= request.getContextPath() %>/advanced-search"><fmt:message key="jsp.layout.navbar-default.advanced"/></a>
<%
			if (ConfigurationManager.getBooleanProperty("webui.controlledvocabulary.enable"))
			{
%>        
              <br/><a href="<%= request.getContextPath() %>/subject-search"><fmt:message key="jsp.layout.navbar-default.subjectsearch"/></a>
<%
            }
%> --%>
	</form></div>
    </nav>
