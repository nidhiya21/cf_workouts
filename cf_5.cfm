<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>Task 5</title>
</head>
<body>
    <div class="container mt-3">
        <h2>Task 5</h2>
        <cfoutput>Mother Age (1/26/1959)=#ageSinceDOB("1/26/1959")#</cfoutput><br>
        <cfoutput>User Age (11/21/1991)=#ageSinceDOB("11/21/1991")#</cfoutput><br>
        <cfoutput>Deliver Age =#deliverage("1/26/1959")#</cfoutput><br>
        <cfoutput>Days remaining for mother's Birthday =#dateDiff("d",  Now(),"2023-01-26")#  days</cfoutput><br>
        <cfoutput>Days remaining for user's Birthday = #dateDiff("d", Now(), "2022-11-21")# days</cfoutput><br>
        <cfscript>
        

         function ageSinceDOB(dob) {
  
            var ageYR = DateDiff('yyyy', dob, NOW());
            var ageMO = DateDiff('m', dob, NOW());
            var ageWK = DateDiff('ww', dob, NOW());
            var ageDY = DateDiff('d', dob, NOW());
            var age = "";
            
            if ( isDate(dob) ){    
              if (now() LT dob){
                age = "NA";
              }else{  
                if (ageYR LT 2) {
                  age = ageMO & "m";
                    if (ageMO LT 1) {
                      age = ageWK & "w";
                    }
                    if (ageWK LT 1) {
                      age = ageDY & "d";
                    }
                }else{
                  age = ageYR & "y";
                }  
              }  
            }else{    
              age = "NA";
            }  
            return age;
          }

          function deliverage(dob) {
            userAge = "11/21/1991";
            var ageYR = DateDiff('yyyy', dob, userAge);
            var ageMO = DateDiff('m', dob,userAge);
            var ageWK = DateDiff('ww', dob,userAge);
            var ageDY = DateDiff('d', dob, userAge);
            var age = "";
            
            if ( isDate(dob) ){    
              if (now() LT dob){
                age = "NA";
              }else{  
                if (ageYR LT 2) {
                  age = ageMO & "m";
                    if (ageMO LT 1) {
                      age = ageWK & "w";
                    }
                    if (ageWK LT 1) {
                      age = ageDY & "d";
                    }
                }else{
                  age = ageYR & "y";
                }  
              }  
            }else{    
              age = "NA";
            }  
            return age;
          }
          
     </cfscript>
      </div>
    
</body>
</html>
