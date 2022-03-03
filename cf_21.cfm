<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>Task 21</title>
</head>
<body>  
    <div class="container mt-3">
        <h2>Task 21</h2>
        <h4>Birthday Wishes</h4>
        <cfscript>
            mailerService = new mail();
            if(IsDefined("form.mailto"))
            {
            if(form.mailto is not "")
            {
            savecontent variable="mailBody"{
            WriteOutput("Birthday greetings:" & "<br><br>" & form.body);
            }
            form.mailFrom = "rincekthomas@gmail.com"
            form.subject  = "Birthday Greetings"
            mailerService.setTo(form.mailto);
            mailerService.setFrom(form.mailFrom);
            mailerService.setSubject(form.subject);
            mailerService.setType("html");
            mailerService.addParam(file=expandpath(form.attachment),type="text/plain",remove
            =false);
            mailerService.send(body=mailBody);
            writeoutput("<h3>Thank you</h3>" & "<p>Thank you, " & mailfrom & "<br>" & "Your message, " & subject & ", has been sent to " & mailto & "</p>");
            }
            }
        </cfscript>
        <form action = "cf_21.cfm" method="POST">
            <table>
            <tr>
            <td>Birthday Baby Name</td>
            <td><input type = "Text" class="form-control" name ="MailName"></td>
            </tr>
            <tr>
            <td>His Email Id</td>
            <td><input type = "Text" class="form-control" name ="MailTo"></td>
            </tr>
            <tr>
            <td>Birthday Wishes</td>
            <td><textarea name ="body" cols="40" rows="5" wrap="virtual" class="form-control"></textarea></td>
            </tr>
            <tr>
            <td>Attachement</td>
            <td><input type = "file" name = "attachment"></td>
            </tr>
            </table>
            <!--- Establish required fields. --->
            <input type = "hidden" name = "MailTo_required" value = "You must enter a recipient">
            <p><input type = "Submit" name = ""  class="btn btn-success"></p>
            </p>
        </form>       
    </div> 
</body>
</html>
