<html> 
<head> 
<title>Add Page</title> 
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head> 
<body> 
<div class="container mt-3">
<h2>Add Page</h2> 
<form action="cf28_new.cfm" method="post"> 
        <div class="mb-3 mt-3">
                <label for="pagename">Page Name:</label>
                <input name="pagename" type="text">
        </div>
        <div class="mb-3 mt-3">
                <label for="pagedesc">Page Description:</label>
                <input name="pagedesc" type="text">
        </div>
        <input name="formSubmit" class="btn btn-primary" type="submit" >
        <input type="Reset" value="Clear Form"  class="btn btn-primary">
</form>     
</table> 
</div>
</body> 
</html>
<cfif StructKeyExists(form,'formSubmit')>
<cfif IsDefined("url.id")>
<cfquery datasource="cf_task_employee" name="upqry">
update contentpages
set pagename=<cfqueryparam cfsqltype="cf_sql_varchar" value="#form.pagename#">,
pagedesc=<cfqueryparam cfsqltype="cf_sql_varchar"  value="#form.pagedesc#">
where pageid=<cfqueryparam cfsqltype="cf_sql_integer" value="#url.id#">

</cfquery> 
<cflocation url="cf_welcome.cfm" addtoken="No">
<cfelseif IsDefined("form.pagename")  and  IsDefined("form.pagedesc")>
<cfquery  datasource="cf_task_employee"  name="addPage">
insert into contentpages(pagename,pagedesc)
values(
"#form.pagename#","#form.pagedesc#"

)
</cfquery>
<cfoutput>Page added successfully</cfoutput>
<cflocation url="cf28_welcome.cfm" addtoken="No">
</cfif>
</cfif>