<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>Task 12</title>
</head>
<body>
    <div class="container mt-3">
        <h2>Task 12</h2>
        <form  action="cf_12_action.cfm"  name="form" method="post">
          <div class="mb-3 mt-3">
            <label for="number">Enter Number:</label>
            <input name="inputNumber" type="text"  validate="regex"
            pattern="[1-9]"  message="Please enter only valid integers less than  10!">
          </div>
          <input name="inputSubmit" class="btn btn-primary" type="submit" validateAt="onSubmit" >
        </form>
    </div>
</body>
</html>
