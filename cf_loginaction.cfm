    <cfif NOT IsDefined ('form.username')>
    <cflocation url="cf_login.cfm" addtoken="No">
    </cfif>
    
    <cfquery name="gilwayb" datasource="cf_task_employee">
    SELECT *
    FROM users
    WHERE username = '#FORM.username#'
    AND password = '#FORM.password#'
    </cfquery>
    
    <CFSET Session.LoggedIn = "1">
    <CFSET Session.username = "#gilwayb.username#">  

    <CFIF gilwayb.RecordCount IS 0>
    <cflocation url="cf_27.cfm?file=error" addtoken="No">
    <CFSET StructClear(Session)> 
    <cfelse>
    <CFSET Session.LoggedIn = "1">
    <cflocation url="cf_welcome.cfm" addtoken="No">
    </cfif>