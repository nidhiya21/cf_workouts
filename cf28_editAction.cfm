
<cfoutput>
    update contentpages
    set pagename="#form.pagename#",
    pagedesc="#form.pagedesc#"
    where pageid="#form.id#
</cfoutput>
