<cfcomponent  output="false">
    <cffunction name="validateUser" access="public" output="false" retrntype="array">
        <cfargument name="username"  type="string" required="true">
        <cfargument name="password"  type="string" required="true">
        
        <cfset var aErrorMessages = arrayNew(1)>
        <cfif NOT isVaild('email',arguments.username)>
            <cfset arrayAppend(aErrorMessages,'Please provide vaild email address')>
        </cfif>  
        <cfif arguments.password EQ ''>
            <cfset arrayAppend(aErrorMessages,'Please provid password')>
        </cfif>  
        <cfreturn aErrorMessages/>
       
    </cffunction> 
    <cffunction name="doLogin" access="public" output="false" retrntype="boolean">
        <cfargument name="username"  type="string" required="true">
        <cfargument name="password"  type="string" required="true">
        <cfset var isUserLoggedIn = false/>
        <cfquery name="rsLoginUser">
        SELECT users.userid,users.username,users.password,users.role
			FROM user-role as users
			WHERE (users.username = '#arguments.username#' AND users.password = '#arguments.password#')

        </cfquery>
        <cfif rsLoginUser.recordCount EQ 1>
            <cflogin>
                <cfloginuser  name="#rsLoginUser.username#"  password="#rsLoginUser.password#"  roles="#rsLoginUser.role#">
              
            </cflogin>    
            <cfset session.stLoggedInUser = {'username'=rsLoginUser.username,'userid'=rsLoginUser.userid}>
            <cfset var isUserLoggedIn = true/>

        </cfif> 
        <cfreturn isUserLoggedIn/>   
    </cffunction> 
    <cffunction name="doLogout" access="public" output="false" retrntype="void">
        <cfargument name="username"  type="string" required="true">
        <cfargument name="password"  type="string" required="true">
        <cfset structdelete(session,'stLoggedInUser')/>
        <cflogout>

    </cffunction>    


</cfcomponent>