<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>Task 1</title>
</head>
<body>
    <div class="container mt-3">
        <h2>Task 1</h2>
        <form>
          <div class="mb-3 mt-3">
            <label for="number">Enter Number:</label>
            <input name="inputNumber" type="text"  validate="regex"
            pattern="[1-5]"  message="Please enter only valid integers between 1 to 5!">
          </div>
          <input name="inputSubmit" class="btn btn-primary" type="submit" validateAt="onSubmit" >
        </form>
      </div>
    <cfif (isDefined("form.inputSubmit"))>
        <cfif(form.inputNumber EQ 5)>
        <cfoutput>Very Good</cfoutput><br>
        <cfelseif (form.inputNumber EQ 4)> 
        <cfoutput> Good</cfoutput><br>
        <cfelseif (form.inputNumber EQ 3)> 
        <cfoutput> Fair</cfoutput><br>   
        <cfelse> 
        <cfoutput> Ok</cfoutput><br> 
        </cfif>
    </cfif>
</body>
</html>
