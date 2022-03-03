<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Task 18</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">   
    </head>
    <body>
       <h2>Task 18</h2>
        <div class="container">
            <cfscript>
                qryResult = queryExecute("SELECT * FROM employee", {}, {datasource="cf_task_employee"});
                // writeOutput( qryResult.id[1] );
            
            </cfscript>
            <cfdump var="#qryResult#">
        </div>
    </body> 
</html>