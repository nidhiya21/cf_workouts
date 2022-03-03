<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>Task 24</title>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script>
    function saveSubscriber(){
        var useremail =  document.getElementById("email").value;  
        var username =  document.getElementById("name").value;  
        $.ajax({
        TYPE: "POST",
        URL: "subscriber.cfm?site_url='+useremail+'&site_name='+username",
        cache:false,
        data: { useremail:useremail, username: username},
        error: function() {
            alert('Ajax Error'); 
        },
        success: function(response){
         //   $("##uploadSuccess").html(response);
         alert('ok');

        }

    });
  }   

</script>

</head>
<body>  
    <div class="container mt-3">
        <h2>Task 24</h2>

        <div id="subscribeText">
            <h2>Subscribe!</h2>
            <form  name="form"  method="post"> 
            <input type="name" id="name" class="form-control" placeholder="Enter Name" /></br>
            <input type="email" id="email"  class="form-control" placeholder="you@example.com" /></br>
            <button type="button" id="send"  onClick="saveSubscriber()" class="btn btn-success">Submit!</button></br>
            </form>
            
        </div>
</div> 
</body>
</html>
