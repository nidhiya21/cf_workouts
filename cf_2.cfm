<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
   <title>Task 2</title>
</head>
    <body>
        <div class="container mt-3">
            <h2>Task 2</h2>
            <form>
              <div class="mb-3 mt-3">
                <label for="number">Enter Number:</label>
                <input name="inputNumber" type="text"   validate="regex"
                pattern="[1-5]"  message="Please enter only valid integers between 1 to 5!">
              </div>
     
              <input name="inputSubmit" class="btn btn-primary" type="submit" validateAt="onSubmit" >
            </form>
          </div>
    <cfif (isDefined("form.inputSubmit"))>
        <cfswitch expression="#form.inputNumber#"> 
            <cfcase value="5">Very Good</cfcase>
            <cfcase value="4">Good</cfcase> 
            <cfcase value="3">Fair</cfcase>
            <cfdefaultcase>Ok</cfdefaultcase> 
        </cfswitch>
    </cfif>
    </body>
</html>