<cfcomponent output="false">

    <cffunction name="getString" access="public" returntype="struct">
    <cfargument name="inputString" type="string" required="true" />
    <cfset words = reMatch("[[:word:]]+", inputString)>
    <cfset wordCount = structNew()>
    <cfloop index="word" array="#words#"> 
    <cfif structKeyExists(wordCount, word)> 
    <cfset wordCount[word]++> 
    <cfelse>
        <cfset wordCount[word] = 1>
    </cfif> 
    </cfloop>
    <cfreturn wordCount> 
    </cffunction>
  </cfcomponent>
