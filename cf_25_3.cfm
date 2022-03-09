<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>Task 28-2</title>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
</head>
<body>  
    <div class="container mt-3">
        <CFQUERY NAME="GetWords" DATASOURCE="cf_task_employee"> 
            SELECT paragraph,count
            FROM tags   ORDER BY count DESC,paragraph ASC
        </CFQUERY>
        <CFLOOP QUERY="GetWords">
            <cfif #count# GTE 4>
                <cfset style="color:red;font-size:25pt;" > 
            <cfelseif #count# EQ 3>
                <cfset style="color:yellow;font-size:22pt;" > 
            <cfelseif #count# EQ 2>
                <cfset style="color:green;font-size:18pt;" > 
            <CFELSE>    
                <cfset style="color:blue;font-size:14pt;" > 
            </CFIF>  
            <CFOUTPUT><p style=#style#>- #paragraph#(#count#)<p><BR></CFOUTPUT>
           
        </CFLOOP>
       
    </div> 
</body>
</html>
