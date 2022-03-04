<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
 <title>Task 3</title>
</head>
<body>
    <div class="container mt-3">
        <h2>Task 3</h2>
        <form>
          <div class="mb-3 mt-3">
            <label for="number">Enter Number:</label>
            <input name="inputNumber" type="text" >
          </div>
 
          <input name="inputSubmit" class="btn btn-primary" type="submit"  >
        </form>
      </div>
      <cfif isDefined("form.inputSubmit")>
        <cfscript>
            myList="3,8,9,11,12"
            cfloop(list=myList, index="i", item="j") {
                if(j%3==0){
                writeOutput(j & " ")
                continue;
                }
            }
        
        </cfscript>
        </cfif>
</body>
</html>