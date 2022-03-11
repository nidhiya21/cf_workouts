<cfcomponent output="false"> 
    <cffunction name="ageSinceDOB" access="public">
        <cfargument name="dob" type="string" required="yes" >
        <cfset ageYR = DateDiff('yyyy', dob, NOW())>
        <cfset ageMO = DateDiff('m', dob, NOW())>
        <cfset ageWK = DateDiff('ww', dob, NOW())>
        <cfset ageDY = DateDiff('d', dob, NOW())>
        <cfset age = "">         
        <cfif (isDate(dob))>    
            <cfif (now() LT dob)>
                <cfset age = "NA">
            <cfelse>
                <cfif (ageYR LT 2) >
                    <cfset age = ageMO & "m">
                    <cfif (ageMO LT 1) >
                        <cfset age = ageWK & "w">
                    </cfif>
                    <cfif (ageWK LT 1) >
                        <cfset age = ageDY & "d">
                    </cfif>
                <cfelse>
                    <cfset age = ageYR & "y">
                </cfif> 
            </cfif>
        <cfelse>   
            <cfset age = "NA"/>
        </cfif> 
        <cfreturn age> 
    </cffunction>
</cfcomponent>    