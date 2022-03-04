<CFIF NOT IsDefined("Session.loggedIn")>
<CFSET StructClear(Session)>
<CFLOCATION URL="cf_27.cfm">
</CFIF>
<H1><CENTER>WELCOME <cfoutput>#Session.username#</cfoutput> !</H1></CENTER>
<a href="logout.cfm">Logout</a>
