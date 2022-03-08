<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>Task 28</title>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
</head>
<body>  
    <div class="container mt-3">
        <cfif (isDefined("url.file"))>
            <cfoutput>Incorrect Username/Password</cfoutput><br>   
        </cfif>
        <h2>Task 28</h2>
        <h2>Login</h2>
        <div class="row">
        <FORM NAME="CFForm_1" ACTION="cf28_loginaction.cfm" METHOD=POST>

            <div class="form-group col-md-4">
                <label>Email login</label>
                <input type="text" name="username" id="username" class="form-control" required> 
            </div><br>
            <div class="form-group col-md-4"> 
                <label>Password</label>
                <input type="password" name="password" id="password" MAXLENGTH="50" class="form-control" required> 
            </div><br>
            
            <div class="form-group col-md-4"> 
                <label></label> 
                <input type="Submit" class="btn btn-success" value="Login" name="login">
            </div> 
            </FORM>
        </div>
      </div>
</div> 
</body>
</html>
