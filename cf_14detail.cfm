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
                <h2>Tak 14 Details</h2> 
                <cfoutput>
                <p><b>Image Name is :</b>#URL.name#</p>
                <p><b>Image Description  is :</b>#URL.desc#</p><br>
                <img src="./images/#URL.img#"/>
                </cfoutput>
            </div>
        
        </div>
    </body> 
</html>