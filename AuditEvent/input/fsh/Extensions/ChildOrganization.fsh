Extension: ChildOrganization
Title: "subject:child-organization and resource:child-organization"
// Description: "Carries other identifiers are known for an agent."
* extension contains
    id 1..1 and
    name 1..1 
* extension[id] ^short = "Identifier of child organization (typically RESH-ID)"
* extension[id].value[x] only Identifier
* extension[name] ^short = "Child organization name"
* extension[name].value[x] only string