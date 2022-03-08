<CFIF NOT IsDefined("Session.loggedIn")>
    <CFSET StructClear(Session)>
    <CFLOCATION URL="cf_27.cfm">
    </CFIF>
    
    <H3><CENTER>WELCOME <cfoutput>#Session.username#</cfoutput> !</H3></CENTER> 
    <a href="cf_new.cfm">test</a> 
    <a href="logout.cfm">Logout</a>
    