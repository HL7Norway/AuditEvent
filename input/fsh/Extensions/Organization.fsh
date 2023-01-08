Extension: Organization
Title: "subject:organization"
// Description: "Carries other identifiers are known for an agent."
* extension contains
    id 1..1 and
    name 1..1 
* extension[id] ^short = "Identifier of organization (typically Br.reg org.nummer)"
* extension[id].value[x] only Identifier
* extension[name] ^short = "Organization name"
* extension[name].value[x] only string