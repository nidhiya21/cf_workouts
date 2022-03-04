<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>Task 7</title>
</head>
<body>
<form  name="form" action="" method="post">
    <h2>Task 7</h2>
    <div class="form-group col-md-4">
		<label>Enter Key:</label>
		<input type="text"    name="textKey" id="textKey"/>
		<br/>
	   </div><br/>
	   <div class="form-group col-md-4">
		<label>
			Enter Value:
		</label>
		<input type="textVal"  name="textVal" id="textVal"/>
		<br />
	</div><br/>
	<div class="form-group col-md-4">
		<input type="submit" class="btn btn-primary"  name="formSubmit" value="Update"/>
	</div>
</form>
<cfif structKeyExists(form,"formSubmit")>
<cfif NOT StructKeyExists(Session, "mystruct")>
<cflock timeout=20 scope="Session" type="Exclusive">
<cfset Session.mystruct = structNew()>
</cflock>
</cfif>
<cfif StructKeyExists(Session, "mystruct")>
<cfset Session.mystruct["#Form.textKey#"] = #form.textVal#> 
</cfif>
<cfdump var="#Session.mystruct#" > 
</cfif>
</body>
</html>