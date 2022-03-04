<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>Task 20</title>
</head>
<body>  
    <div class="container mt-3">
        <h2>Task 20</h2>
        <cffunction name="makeRandomString" returnType="string" output="false">
            <cfset var chars = "23456789ABCDEFGHJKMNPQRS">
            <cfset var length = randRange(4,7)>
            <cfset var result = "">
            <cfset var i = "">
            <cfset var char = "">       
            <cfscript>
            for(i=1; i <= length; i++) {
                char = mid(chars, randRange(1, len(chars)),1);
                result&=char;
            }
            </cfscript>		
            <cfreturn result>
        </cffunction>
        <cfset showForm = true>
        <cfparam name="form.email" default="">
        <cfparam name="form.captcha" default="">
        <cfparam name="form.captchaHash" default="">
        <cfif isDefined("form.send")>
            <cfset errors = "">        
            <cfif (StructKeyExists(form, "email") AND NOT isValid("email", form.email))>
                <cfset errors = errors & "You must enter valid email.<br />">
            </cfif>
            <cfif hash(ucase(form.captcha)) neq form.captchaHash>
                <cfset errors = errors & "You did not enter the right text?<br />">
            </cfif>       
            <cfif errors is "">
                <cfset showForm = false>
            </cfif>            
        </cfif>
    <cfif showForm>
	<cfset captcha = makeRandomString()>
	<cfset captchaHash = hash(captcha)>
	<cfoutput>
            <p>
            Please fill the form below.
            </p>          
            <cfif isDefined("errors")>
            <p>
            <b>Correct these errors:<br />#errors#</b>
            </p>
            </cfif>            
            <form action="#cgi.script_name#" method="post" >
            <table>
                <tr>
                    <td>Email:</td>
                    <td><input name="email" class="form-control" type="text" value="#form.email#"></td>
                </tr>
                <tr>
                    <td>Enter Text Below:</td>
                    <td><input type="text" class="form-control" name="captcha"></td>
                </tr>
                <tr>
                    <td colspan="2">
                    <cfimage action="captcha" width="300" height="75" text="#captcha#">
                    <input type="hidden" name="captchaHash" value="#captchaHash#">
                    </td>
                </tr>		
                <tr>
                    <td> </td>
                    <td><input type="submit" name="send" class="btn btn-success" value="Submit"></td>
                </tr>
            </table>
            </form>
        </cfoutput>	
    <cfelse>
        <cfoutput>
        <p>
            Email Address successfully subscribe our newsletter
        </p>
        </cfoutput>	
    </cfif>     
</div> 
</body>
</html>
