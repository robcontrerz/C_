<%@Page Language="C#" Debug="true" Trace="false"%>

<%@Import Namespace="System"%>
<%@Import Namespace="System.IO"%>
<%@Import Namespace="System.Security"%>
<%@Import Namespace="System.Security.Permissions"%>
<html>
<head>
	<title>Test</title>
</head>
<body>


<%
// This page contains some examples of how to retrieve CSP cookie attributes
// on your .NET web pages if you are using the .NET Forms Authentication code supplied by CSP.
// Note that you do not need to use these coding techniques just to control access to your pages,
// even if you  need the access to be based on CSP groups/priviliges.  That can all be handled
// using settings in each web folder's web.config file.  But, if you need to change a web page's 
// behavior based on groups/privileges, then you may find these techniques very useful.


// DEMONSTRATION OF USER.ISINROLE() FUNCTIONALITY
 if (System.Web.HttpContext.Current.User.IsInRole("G_RMRIn"))
           Response.Write("in G_RMRIn role<br>");
 else
           Response.Write("not in G_RMRIn role<br>");
 
        
 // DEMONSTRATION OF RETRIEVAL OF ATTRIBUTES FOR USE ON THE PAGE.
 CSP.User userx = (CSP.User)System.Web.HttpContext.Current.User;
 string sPrivs = null;
 // SHOW PRIVILEGES.
 for (int i = 0; i < userx.Privs.Length; i++)  {
     sPrivs = sPrivs + ";" + userx.Privs[i];
     Response.Write(sPrivs + "<br>");
 }
 // SHOW ATTUID.     
 Response.Write(userx.attuid);
 
 // COOL WAY TO DETECT CSP PRIVILEGES/GROUPS FOR USE ON THE PAGE
 try {
  	PrincipalPermission p = new PrincipalPermission(null,"G_RMRAdm");
 	p.Demand();
 	Response.Write("<br>Has demanded permission");
 }
 catch {
        Response.Write("<br>Does not have demanded permission");
 }
 
%>

</body>
</html>