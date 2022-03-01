<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>Task 12</title>
</head>
<body>
    <div class="container mt-3">
        <h2>Task 12</h2>
        <cfquery name = "GetSpecificUser" datasource = "cf-user" > 
            SELECT *
            FROM users 
        </cfquery>
         <cfoutput query = "GetSpecificUser"> 
        <cfset x = GetSpecificUser.firstName[5]>
        <font size = "-1">#x#</font> 
        </cfoutput> 
        <cfquery name = "GetUser" datasource = "cf-user" > 
        SELECT *
        FROM users 
        </cfquery> 
        <table cellpadding = 1 cellspacing = 1> 
            <tr> 
                <td bgcolor = f0f0f0> 
                <b><i>&nbsp;</i></b> 
                </td> 
                <td bgcolor = f0f0f0> 
                <b><i>FirstName</i></b> 
                </td> 
                <td bgcolor = f0f0f0> 
                <b><i>LastName</i></b> 
                </td> 
            </tr>  
            <cfoutput query = "GetUser"> 
                <tr> 
                <td valign = top bgcolor = ffffed> 
                <b>#GetUser.currentRow#</b> 
                </td> 
                <td valign = top> 
                <font size = "-1">#firstName#</font> 
                </td> 
                <td valign = top> 
                <font size = "-1">#lastName#</font> 
                </td>            
                </tr> 
            </cfoutput> 
        </table> 
    </div>
</body>
</html>