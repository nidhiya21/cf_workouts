<CFAPPLICATION NAME="myApplication"
SESSIONMANAGEMENT="Yes"
SESSIONTIMEOUT="#CreateTimeSpan(0, 0, 20, 0)#"> 
<cfcomponent output="false"> 
 
	<cffunction name="onApplicationStart" returntype="boolean" >		
		<cfset application.cf_23 = createObject("component",'cf_23') />
		<cfreturn true />
	</cffunction>

	<cffunction name="onRequestStart" returntype="boolean" >
		<cfargument name="targetPage" type="string" required="true" />
		<cfif isDefined('url.restartApp')>
			<cfset this.onApplicationStart() />
		</cfif>		
		<cfreturn true />
	</cffunction>
</cfcomponent>
<cfapplication name="userlogin" clientmanagement="Yes" sessionmanagement="Yes" setclientcookies="Yes" sessiontimeout="#createTimeSpan(0,0,20,0)#" applicationtimeout="#createTimeSpan(0,0,20,0)#">

 <!--- if byLogin cookie is defined, set the session --->
 <cfif isDefined("COOKIE.byLogin")>
	<cflock timeout="20" throwontimeout="No" type="EXCLUSIVE" scope="SESSION">
		<cfset SESSION.userName = listFirst(COOKIE.byLogin,":")>
		<cfset SESSION.password = listlast(COOKIE.byLogin,":")>
		<cfset SESSION.authenticated = "true">
	</cflock>
</cfif>

<!--- if SESSION.userName is not defined, redirect to the login --->
<cfif NOT isDefined("SESSION.authenticated")>
		<cflocation url="cf_28.cfm" addtoken="No">
</cfif>