<cfcomponent output="false">
    <cfset this.name = 'CF Task' />
	<cfset this.applicationTimeout = createtimespan(0,2,0,0) />    
	<cfset this.sessionManagement = true />
	<cfset this.sessionTimeout = createTimespan(0,0,30,0) />  
	
	<cffunction name="onApplicationStart" returntype="boolean" >		
		<cfset application.cf_23 = createObject("component",'cf_23') />
		<cfset application.tagCloud = createObject("component",'tagcloud') />
		<cfset application.cf_5 = createObject("component",'cf_5') />
		<cfset application.cf_11 = createObject("component",'cf_11') />
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