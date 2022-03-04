<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>Task 24</title>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
  <script>
        $(document).ready(function() {
            $(':input[type="submit"]').prop('disabled', true);
        });

  </script> 
  <script language="javascript" type="text/javascript">
    function checkUserExists(){      
        var useremail = $('#useremail').val();
        $.ajax({
        url: 'subscribe.cfc', 
        async: false,
        data: 
            { 
                 method: "searchUser",
                 useremail:useremail},
                 success: function(data) {
                    // alert(data);
                     if (data==true) { 
                    //   alert('record not found'); 
                       alert('This Email id not existing in our system you can submit');
                       $(':input[type="submit"]').prop('disabled', false);                    
                      } 
                      else {
                           alert('This Email id alredy existing in our system');
                          
                      }                    
                }
        }); 
    }
</script> 
</head>
<body>  
    <div class="container mt-3">
        <h2>Task 24</h2>
        <h2>Subscribe</h2>
        <form name="form" method="post"> 
          <div class="mb-3 mt-3">
            <input type="name" id="username" name="username" class="form-control" placeholder="Enter Name" /></br>
            <input type="email" id="useremail"  name="useremail" class="form-control" placeholder="you@example.com" /></br> 
            <input name="inputSubmit" class="btn btn-primary" type="submit">  
            <input type="button" name="Finalize" value="Check User Exist" class="btn btn-primary" onClick="checkUserExists();"/>
        </form>
      </div>
    <cfif (isDefined("form.inputSubmit"))>       
        <cfquery name="AddUser" datasource="cf_task_employee"> 
            INSERT INTO subscribers
            (username,useremail
            ) 
            VALUES 
            (
        
            <cfqueryparam cfsqltype="cf_sql_varchar"   value="#form.username#">,
           <cfqueryparam cfsqltype="cf_sql_varchar"   value="#form.useremail#">
            ) 
        </cfquery> 
            <cfoutput> #form.useremail# Successfully</cfoutput>
    </cfif>
</div> 
</body>
</html>
