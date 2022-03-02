<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>Task 16</title>
</head>
<body>
    
<div class="container mt-3">
    <h2>Tak 16</h2>
<cfscript>
matrixArray= [[1, 4, 7], [2, 5, 8], [3, 6, 9]];
</cfscript>
<cfloop from="1" to="#ArrayLen(matrixArray)#" index="i">
<cfoutput>
    <cfloop from="1" to="#ArrayLen(matrixArray[i])#" index="j">
    #matrixArray[i][j]#
    </cfloop>
    <br>
</cfoutput>
</cfloop>
</div>

</body>
</html>