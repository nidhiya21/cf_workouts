<cfcomponent output="false"> 
<cffunction name="saveEmployee" access="public" returntype="structure">
<cfargument name="position" type="string" required="yes" >
<cfargument name="relocate" type="string" required="yes" >
<cfargument name="start_date" type="string" required="yes" >
<cfargument name="website" type="string" required="no" >
<cfargument name="resume" type="string" required="no" >
<cfargument name="salary" type="numeric" required="no" >
<cfargument name="firstName" type="string" required="yes" >
<cfargument name="lastName" type="string" required="yes" >
<cfargument name="emailAddress" type="string" required="yes" >
<cfargument name="phoneNumber" type="numeric" required="yes" >

<cfquery name="saveEmployeeDetails" datasource="cf_task_employee" >
INSERT INTO clients
( 
position,relocate,start_date,website,resume,salary,firstName,lastName,emailAddress,phoneNumber
)
VALUES
( 
<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.Field17#" />
,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.Field19#" />
,<cfqueryparam cfsqltype="CF_SQL_TIME" value="#arguments.Field20#" />
,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.Field14#" />
,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.Field12#" />
,<cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.Field16#" />
,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.Field22#" />
,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.Field23#" />
,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.Field13#" />
,<cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.Field25#" />
)
)
</cfquery>
<cfreturn />
</cffunction>
</cfcomponent>