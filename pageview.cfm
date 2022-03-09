
<html>
<head>
    <link href="./css/welcome.css" rel="stylesheet" type="text/css"/> 
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
            <div class="page-desc">
             <b>Page name : </b>#pagename#</br></br>
             <b>Page description : </b> #pagedesc#
            </div>
        
        </cfoutput>
    </div>
  
</body>
</html>
