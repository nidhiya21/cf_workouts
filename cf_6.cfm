<cfsilent>
	<cfparam
		name="FORM.Contact"
		type="struct"
		default="#StructNew()#"
		/>
	<cfparam
		name="FORM.Contact.Phone1.Number"
		type="string"
		default=""
		/>
	<cfparam
		name="FORM.Contact.Phone2.Number"
		type="string"
		default=""
		/>
</cfsilent>
<cfif NOT StructIsEmpty( FORM )>
	<cfloop
		item="Key"
		collection="#FORM#">
		<cfif Find( ".", Key )>
			<cfset Value = FORM[ Key ] />
			<cfset StructDelete( FORM, Key ) />
			<cfset "FORM.#Key#" = Value />
		</cfif>
	</cfloop>
    <cfdump var="#FORM#">
</cfif>
<cfoutput>
	<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"><html>
	<head>
		<title>Task 6</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
	</head>
	<body>
        <h3>Task 6</h3>
        <div class="container mt-3">
		<form
			action="#CGI.script_name#"
			method="post">
            <div class="mb-3 mt-3">
			<label for="contact.phone1.number">
				Home Phone:
			</label>

			<input
				type="text"
				name="contact.phone1.number"
				id="contact.phone1.number"
				value="#FORM.contact.Phone1.Number#"
				/>
			<br />
        </div>
            <div class="mb-3 mt-3">
			<label for="contact.phone2.number">
				Mobile Phone:
			</label>
			<input
				type="text"
				name="contact.phone2.number"
				id="contact.phone2.number"
				value="#FORM.contact.Phone2.Number#"
				/>

			<br />
        </div>
			<input
				type="submit"
                class="btn btn-primary" 
				value="Update Phone Numbers"
				/>
		</form>
    </div>
	</body>
	</html>
</cfoutput>