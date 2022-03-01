<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>Task 7</title>
</head>
<body>
<form  name="number_form" action="" method="post">
    <input type="text" name="text1" />
    <input type="text" name="text2" />
    <br />
    <input type="submit" value="ok" name="form_submit" />
</form>


<cfif structKeyExists(form,"form_submit")>
<cfset key=form.text1>
<cfset value=form.text2>
</cfif>

<cfif NOT StructKeyExists(Session, "mystruct")>
<cflock timeout=20 scope="Session" type="Exclusive">
<cfset Session.mystruct = structNew()>
</cflock>
</cfif>

<cfif StructKeyExists(Session, "mystruct")>
<cfif IsDefined("key") AND  IsDefined("value") >
<cfif NOT StructKeyExists(Session.mystruct,"#key#")>
<cfset Session.mystruct["#key#"] = #value#> 
</cfif>
</cfif>
</cfif>

<cfdump var="#Session.mystruct#" > 
</body>
</html>