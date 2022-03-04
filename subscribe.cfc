<cfcomponent>
<cffunction name="searchUser" access="remote" returnFormat="JSON">
    <cfargument name="useremail" type="any" required="true">
       <cfquery name="searchUserMail" datasource="cf_task_employee">
         SELECT username
                FROM subscribers 
            WHERE useremail = <cfqueryparam cfsqltype="cf_sql_varchar"  value="#arguments.useremail#">             
        </cfquery> 
       <cfset cfcResults = searchUserMail.recordcount>
    <cfif cfcResults NEQ 0>
<!---       <cfset cfcResults1.status = "400"> --->
      <cfset cfcResults1 = "Error">    
   <cfelse>
<!---       <cfset cfcResults1.status = "200"> --->
      <cfset cfcResults1 = "Success">             
   </cfif>
   <cfscript>
    if(#cfcResults1# == "Error"){
        return false;
    } else {
        return true;
    }
  </cfscript>
<!---     <cfreturn cfcResults1> --->
    </cffunction>
</cfcomponent>