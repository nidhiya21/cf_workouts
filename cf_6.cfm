<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"><html>
<head>
	<title>Task 6</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<h3>Task 6</h3>
	<div class="container mt-3">
	<div class="row">
	<form action="cf_6.cfm" method="post">
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
	<cfif StructKeyExists(Form,'formSubmit')>
	<cfscript>
		myStruct=StructNew();
		StructInsert(myStruct,"#form.textKey#","#form.textVal#",true);
		WriteDump(myStruct);
    </cfscript>
    </cfif>
	</div>
</div>
</body>
</html>
