<html> 
<head> 
<title>Add Page</title> 
</head> 
<body> 
<h2>Add Page</h2> 
<table> 
<form action="cf28_new.cfm" method="post"> 
<tr> 
<td>Page name:</td>  
<td><input type="text" name="pagename" ></td> 
</tr> 
<tr> 
<td>Page Description:</td> 
<td><input type="text" name="pagedesc" ></td> 
</tr> 
<tr>

<td>&nbsp;</td> 
<td><input type="Submit" value="Submit" name="formSubmit">&nbsp;<input type="Reset" 
value="Clear Form"></td> 
</tr> 
</form> 
</table> 
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