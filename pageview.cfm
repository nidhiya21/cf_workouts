
<html>
<head>
</head>
<body>
    <div class="container mt-3">
        <cfif IsDefined("url.id") and IsNumeric(url.id)>
            <cfquery name="ut" datasource="cf_task_employee">
                select pagename,pagedesc from contentpages  where pageid=<cfqueryparam cfsqltype="cf_sql_bigint" value="#url.id#">
            </cfquery> 
        </cfif>
        <cfset pagename=ut.pagename>
        <cfset pagedesc=ut.pagedesc>
        <cfoutput>
            <a href="cf28_welcome.cfm">Back</a></br> 
             Page name:#pagename#</br>
             Page description: #pagedesc#
        
        </cfoutput>
    </div>
  
</body>
</html>
