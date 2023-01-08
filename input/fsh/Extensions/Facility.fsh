Extension: Facility
Title: "subject:facility and resource:facility"
// Description: "Carries other identifiers are known for an agent."
* extension contains
    id 1..1 and
    name 1..1 
* extension[id] ^short = "Identifier of facility (typically Br.reg. orgnummer)"
* extension[id].value[x] only Identifier
* extension[name] ^short = "Facility name"
* extension[name].value[x] only string