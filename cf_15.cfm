<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>Task 15</title>
</head>
<body>
    <div class="container mt-3">
        <h2>Task 15</h2>
		<cfinvoke component="cf_15" method="multiply" returnvariable="result">
		<cfinvokeargument name="arg1" value="1"/> 
		<cfinvokeargument name="arg2" value="2"/> 
		<cfinvokeargument name="arg3" value="3"/>  
		</cfinvoke>
		<cfoutput>cfinvoke UsingArgument  : #result#</cfoutput><br><br>

		<cfobject name="tellMultiply" component="cf_15">
		<cfinvoke component="#tellMultiply#" method="multiply">
		<cfoutput>cf using object  : #tellMultiply.Multiply(3,4,5)#</cfoutput><br>

		<!--- instantiate once and reuse the instance--->
		<cfscript>
			tellMultiply=createObject("component","cf_15");
			result=tellMultiply.Multiply(2,3);
			
		</cfscript>
		<cfoutput>cf using instance #result#</cfoutput>
	</div>
</body>
</html>
