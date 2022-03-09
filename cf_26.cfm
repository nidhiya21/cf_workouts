<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Task 26</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        
    </head>
    <body>
        <div class="container">
            <div class="row">
                <h2>Tak 26</h2> 
                <form action="index.cfm" name="form" method="post" enctype="multipart/form-data" > 
                
                <div class="form-group col-md-4">
                    <label> Description</label>
                    <input type = "file" name = "attachment">
                </div><br>
                
                <div class="form-group col-md-4"> 
                    <label></label> 
                    <input type="Submit" class="btn btn-success" value="Submit" name="formSubmit">
                </div> 
                </form> 
            </div>
                <cfscript>
                    myfile = FileRead("C:\ColdFusion2021\cfusion\wwwroot\cf_workout\c26.txt");
               </cfscript>                   
                <cfset stringInfo = application.tagCloud.getString(myfile) />
                <cfset sorted = structSort(stringInfo)>
                <cfloop index="word" array="#sorted#"> 
                    <cfquery  datasource="cf_task_employee"  name="addPage">
                    INSERT INTO tags(paragraph, count)
                            VALUES ('#word#',#stringInfo[word]#)
                        </cfquery>  
                    </cfloop> 
               <CFQUERY NAME="GetWords" DATASOURCE="cf_task_employee"> 
                SELECT paragraph,count
                FROM tags   ORDER BY count DESC,paragraph ASC
            </CFQUERY>
            <CFLOOP QUERY="GetWords">
                <cfif #count# GTE 4>
                    <cfset style="color:red;font-size:25pt;" > 
                <cfelseif #count# EQ 3>
                    <cfset style="color:yellow;font-size:22pt;" > 
                <cfelseif #count# EQ 2>
                    <cfset style="color:green;font-size:18pt;" > 
                <CFELSE>    
                    <cfset style="color:blue;font-size:14pt;" > 
                </CFIF>  
                <CFOUTPUT><p style=#style#>- #paragraph#(#count#)<p><BR></CFOUTPUT>
               
            </CFLOOP>               
                
        </div>
    </body> 
</html>