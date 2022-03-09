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
            FROM tags where length(paragraph) > 3  ORDER BY count DESC,paragraph ASC
        </CFQUERY>
        <CFLOOP QUERY="GetWords">
            <CFOUTPUT>- #paragraph#(#count#)<BR></CFOUTPUT>
        </CFLOOP>
       
    </div> 
</body>
</html>
