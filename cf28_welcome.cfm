<CFIF NOT IsDefined("Session.loggedIn")>
<CFSET StructClear(Session)>
<CFLOCATION URL="cf_27.cfm">
</CFIF>
<cfif IsDefined("url.did") and IsNumeric(url.did)>
    <cfquery name="del" datasource="cf_task_employee">
    delete from contentpages  where pageid=<cfqueryparam cfsqltype="cf_sql_bigint" value="#url.did#">
    </cfquery>
    <cfoutput>Page deleted successfully</cfoutput>
</cfif>
<H2><CENTER> <cfoutput>#Session.roles#</cfoutput> Dashboard</H2></CENTER> 
<h3><CENTER>WELCOME <cfoutput>#Session.username#</cfoutput> !</H3></CENTER>
<a href="cf28logout.cfm">Logout</a>
<html>
    <head> 
    <title>Content Pages</title> 
    </head> 
    <body>  
    <h3>Content Pages</h3>    
    <cfquery name = "GetPage" datasource = "cf_task_employee"> 
    SELECT * FROM contentpages
    ORDER BY pageid 
    </cfquery> 
    <cfquery name = "GetPage" datasource = "cf_task_employee" > 
    SELECT pageid, pagename, pagedesc
    FROM contentpages
    ORDER BY pageid 
    </cfquery> 
     <CFIF ((Session.roles EQ 'admin') or (Session.roles EQ 'editor'))>
        <a href="cf28_new.cfm">Add Page</a> 
      <table cellpadding = 1 cellspacing = 1> 
        <tr> 
        <td bgcolor = f0f0f0> 
        <b>&nbsp;</b> 
        </td> 
        <td bgcolor = f0f0f0> 
        <b>Page name</b> 
        </td> 
        <td bgcolor = f0f0f0> 
        <b>Page description</b> 
        </td> 
        <td bgcolor = f0f0f0> 
        <b>Action</b> 
        </td>
        </tr>  
        <cfoutput query = "GetPage" > 
        <tr> 
        <td valign = top bgcolor = ffffed> 
        <b>#GetPage.currentRow#</b> 
        </td> 
        <td valign = top> 
        <font size = "-1">#pagename#</font> 
        </td> 
        <td valign = top> 
        <font size = "-1">#pagedesc#</font> 
        </td>
     
        <td valign = top> 
        <font size = "-1"><a href="cf28_edit.cfm?id=#pageid#">Edit</a> / <a href="cf28_welcome.cfm?did=#pageid#">Delete</a></font> 
        </td>  
        </tr> 
        </cfoutput> 
       
        </table> 
    <cfelse>     
     <CFQUERY NAME="GetPageDesc" DATASOURCE="cf_task_employee">
                SELECT pageid, pagename, pagedesc
                FROM contentpages  ORDER BY pageid 
       </CFQUERY>
       
       <CFLOOP QUERY="GetPageDesc">
         <CFOUTPUT><a href="pageview.cfm?id=#pageid#">#pagename#</a><BR></CFOUTPUT>
       </CFLOOP>
    </CFIF>
    </body> 
    </html>

