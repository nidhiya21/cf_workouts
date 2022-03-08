<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Task 14</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        
    </head>
    <body>
        <div class="container">
            <div class="row">
                <h2>Tak 25</h2> 
                <form action="cf_14.cfm" name="form" method="post" enctype="multipart/form-data" > 
                <div class="form-group col-md-4">
                    <label>Image Name</label>
                    <input type="text" name="imageName" class="form-control"> 
                </div><br>
                <div class="form-group col-md-4">
                    <label>Image Description</label>
                    <textarea name="imageDescription" class="form-control"> </textarea>
                </div><br>
                
                <div class="form-group col-md-4"> 
                    <label></label> 
                    <input type="Submit" class="btn btn-success" value="Submit" name="formSubmit">
                </div> 
                </form> 
            </div>
            <cfif StructKeyExists(Form,'formSubmit')>
                <cfquery  datasource="cf_task_employee"  name="addPage">
                    insert into contentpages(pagename,pagedesc)
                    values(
                    "#form.pagename#","#form.pagedesc#"
                    
                    )
                    </cfquery>
             </cfif>
            
        </div>
    </body> 
</html>