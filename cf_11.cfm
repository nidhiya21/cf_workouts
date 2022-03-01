<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>Task 11</title>
</head>
<body>
    <cfscript>
        function mulitiply(Arg1,Arg2) { 
        var arg_count = ArrayLen(Arguments); 
        var mul = 1; 
        var i = 0; 
        for( i = 1 ; i LTE arg_count; i = i + 1 ) 
        { 
            mul = mul * Arguments[i]; 
        } 
        return mul; 
        }
    </cfscript>
    <div class="container mt-3">
        <h2>Task 11</h2>
        <cfset res = mulitiply(1,2)>
        Result is : <cfdump var=#res#> <br>
        <cfset res1 = mulitiply(1,2,3)>
        Result is :<cfdump var=#res1#><br>
        <cfset res2 = mulitiply(1,2,3,4)>
        Result is :<cfdump var=#res2#> <br>
    </div>
</body>
</html>
