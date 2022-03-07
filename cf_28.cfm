<cflock scope="SESSION" timeout="20" throwontimeout="No" type="EXCLUSIVE">
	<cfparam name="Session.UserName" default="">
	<cfparam name="Session.Password" default="">
</cflock>
<cfset sectionName="admin">
<cfset pgTitle="Log In">
<cfset path="">
<cfparam name="buttontext" default="Log In">
<cfif not isDefined("login")>
	<cfset bodyTagVar="onLoad=""document.login.userName.focus();""">
</cfif>

<cfparam name="caption" type="string" default="Please Log In">
<cfif isDefined("url.status")>
	<cfset caption = #URL.status#>
</cfif>

<!--- <cfinclude template="#path#lib/header.cfm"> --->

<cfif isDefined("URL.login")>

	<cflock scope="session" timeout="20" type="readonly">
		<cfquery name="authUser" datasource="#REQUEST.dbLoc#" >
			SELECT userid
			FROM user-role as users
			WHERE (users.username = '#trim(URL.userName)#' AND users.password = '#trim(URL.password)#')
		</cfquery>
	</cflock>
	
	<cfif authUser.recordcount EQ 1>
		
		<cfif isDefined("URL.rememberLogin")>
			<cfif URL.rememberLogin is TRUE>
				<cfcookie name="byLogin" value="#URL.userName#:#URL.password#" expires="90">
			</cfif>
		</cfif>

		<cflock timeout="20" throwontimeout="No" type="EXCLUSIVE" scope="SESSION">
			<cfset SESSION.userName = URL.userName>
			<cfset SESSION.password = URL.password>
			<cfset SESSION.authenticated = "true">
		</cflock>
        <cflocation url="welcome.cfm" addtoken="No">
			<cfabort>

	<cfelse>
		<cflocation url="cf_28.cfm?status=failed" addtoken="No">
			<cfabort>
	</cfif>
	

<cfelseif isDefined("URL.changepw")>

	<cfquery name="authUserPW" datasource="#REQUEST.dbLoc#">
		SELECT userID
		FROM users
		WHERE (users.userName = '#trim(URL.userName)#' AND users.password = '#trim(URL.password)#')
	</cfquery>
	<cfif URL.password1 IS URL.password2>
		<cfif authUserPW.recordcount EQ 1>
			<cflock timeout="30" throwontimeout="No" type="EXCLUSIVE">
				<cfquery name="changePW" datasource="#REQUEST.dbLoc#" >
					UPDATE USERS
					SET password = '#Trim(URL.password1)#'
					WHERE userName = '#Trim(URL.userName)#'
				</cfquery>
			</cflock>
			
			<div align="center"><b class="error">Your password has been changed.</b></div>
		<cfelse>
			<cflocation url="cf_28.cfm?status=nousermatch&display=changepw" addtoken="No">
		</cfif>
	<cfelse>
		<cflocation url="cf_28.cfm?status=nopwmatch" addtoken="No">
	</cfif>
<cfelseif isDefined("URL.adduser")>
	<cflock timeout="30" throwontimeout="No" type="EXCLUSIVE">
		<cfquery name="addUser" datasource="#REQUEST.dbLoc#" >
			INSERT INTO user-role (username, password)
			VALUES ('#userName#', '#password#')
		</cfquery>
	</cflock>
	
	<div align="center"><b class="error">User has been added</b></div>
<cfelse>

	<cfif isDefined("URL.status") AND (status IS "logout")>
		<cfif isDefined("COOKIE.byLogin")>
			<cfif Len(COOKIE.byLogin) GT 0>
				<cfcookie name="byLogin" value="" expires="NOW">
			</cfif>
		</cfif>
		<cflock timeout="20" throwontimeout="No" type="EXCLUSIVE" scope="SESSION">
		<CFIF (ParameterExists(Session.authenticated))> 
			<CFSCRIPT> 
				StructDelete(session, "userName"); 
				StructDelete(session, "password"); 
				StructDelete(session, "authenticated");
			</CFSCRIPT> 
		</CFIF>
		</cflock>
		<meta http-equiv="Refresh" content="0; url=cf_28.cfm">
	</cfif>
	

<div align="center">
	<table border = "1" cellpadding="2" cellspacing="0">
	<caption><cfif isDefined("URL.status") AND (status IS "failed")>
		<b class="error">Incorrect login.</b>
	<cfelseif isDefined("URL.display") AND (display IS "changepw")>
		<b class="error">Change Password</b>
	<cfelseif isDefined("URL.display") AND (display IS "adduser")>
		<b class="error">Add User</b>
	<cfelseif isDefined("URL.status") AND (status IS "nopwmatch")>
		<b class="error">New passwords do not match.</b>
	<cfelseif isDefined("URL.status") AND (status IS "nousermatch")>
		<b class="error">Invalid username.</b>
	<cfelseif isDefined("URL.status") AND (status IS "error")>
		<b class="error"><cfoutput>#errorMessage# is empty.</cfoutput></b>
	<cfelseif isDefined("URL.status") AND (status IS "logout")>
		<cfif NOT isDefined("SESSION.userName")><b class="error">Logout Successful.</b></cfif>
	<cfelse>
		<b>Please Log In</b>
	</cfif></caption>
	<form action="<cfoutput>#CGI.script_name#</cfoutput>" method="get" name="login" id="login">
	<cfif isDefined("display") AND display IS "changepw">
	<input type="hidden" name="changepw" value="true">
	<cfElseIf isDefined("display") AND display IS "adduser">
	<input type="hidden" name="adduser" value="true">
	<cfelse>
	<input type="hidden" name="login" value="true">
	</cfif>
		<tr>
			<td class="formRequired" align="right">User Name</td>
			<td><input type="Text" name="userName" message="User Name is required" required="Yes" size="10" maxlength="12" id="userName"></td>
		</tr>
		<tr>
			<td class="formRequired" align="right">Password</td>
			<td><input type="password" name="password" message="Password is required" required="Yes" size="10" maxlength="12" id="password"></td>
		</tr>
	<cfif isDefined("display") AND display IS "changepw">
		<tr>
			<td class="formRequired" align="right">New Password</td>
			<td><input type="password" name="password1" message="New Password is required" required="Yes" size="10" maxlength="12" id="password1"></td>
		</tr>
		<tr>
			<td class="formRequired" align="right">Confirm</td>
			<td><input type="password" name="password2" message="Password is required" required="Yes" size="10" maxlength="12" id="password"></td>
		</tr>
		<cfset buttontext = "Change Password">
	</cfif>
 		<tr>
			<td colspan="2" class="formNotRequired" align="center"><input type="checkbox" name="rememberLogin" id="rememberLogin" value="true"><label for="rememberLogin"> Remember login</label></td>
		</tr>
		<tr>
			<td class="formNotRequired"> </td>
			<td class="formNotRequired"><input type="submit" value="<cfoutput>#buttontext#</cfoutput>"></td>
		</tr>
	</form>
	</table>
</div>
</cfif>

<!--- <cfinclude template="#path#lib/footer.cfm"> --->