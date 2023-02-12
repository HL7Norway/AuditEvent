Extension: ApplicationRole
Title: "Identifier of user in system/application"
* extension contains
    id 1..1 and
    name 0..1 
* extension[id] ^short = "User ID (User Role ID in DIPS) "
* extension[id].value[x] only Identifier
* extension[name] ^short = "User name (User role name in DIPS"
* extension[name].value[x] only string