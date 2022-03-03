
<cfif isDefined('URL.site_url') AND isDefined('URL.site_name')>

<cfquery name="AddUser" datasource="cf_task_employee"> 
INSERT INTO subscribers
(name,email
) 
VALUES 
(
"#URL.site_url#",
"#URL.site_name#"
) 
</cfquery> 
<cfoutput>#URL.site_name#</cfoutput>
<cfelse>
Error! Please fill all fields!
</cfif> 
