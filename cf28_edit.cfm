<cfif StructKeyExists(form,'formSubmit')>
           
            <cfif IsDefined("url.id") and IsNumeric(url.id)> 
                <cfquery datasource="cf_task_employee" name="updateqry">
                    update contentpages
                    set pagename=<cfqueryparam cfsqltype="cf_sql_varchar" value="#form.pagename#">,
                    pagedesc=<cfqueryparam cfsqltype="cf_sql_varchar"  value="#form.pagedesc#">
                     where pageid=<cfqueryparam cfsqltype="cf_sql_integer" value="#url.id#">
                
                    </cfquery> 
                    <cflocation url="cf28_welcome.cfm" addtoken="No">
            </cfif>
        </cfif>
<html>
    <head> 
    <title>Content Pages</title> 
    </head> 
    <body>  
            <form name="form" method="post" action="">
                
                <table>
                    <tr>
                        <th>Page name</th>
                        <td><input type="text" name="pagename"  ></td>
                    </tr>
                    <tr>
                        <th>Page description</th>
                        <td><input type="text" name="pagedesc"  ></td>
                    </tr>
                </table>
                <input type="submit" value="sumbit" name="formSubmit">

            </form>
            
            
</body>
</html>


