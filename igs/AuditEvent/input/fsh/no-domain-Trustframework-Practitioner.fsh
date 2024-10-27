Profile: AuditEventNorwayPractitioner
Id: no-domain-Trustframework-Practitioner
Parent: NoBasisPractitioner
Title: "no-domain-Trustframework-Practitioner"
Description: """
The health care audit event practitioner actor (Auditevent.agent.who).  
"""
* ^status = #active
* identifier ^short = "practitioner:identifier and practitioner:hpr_nr"
* identifier.system ^short = "practitioner:identifier:system and practitioner:hpr_nr:system" 
* identifier.value ^short = "practitioner:identifier:id and practitioner:hpr_nr:id"
* identifier.assigner.display  ^short = "practitioner:identifier:authority and practitioner:hpr_nr:authority"
* identifier 1..*
* name.text ^short = "practitioner:identifier:name"
* qualification.code.coding.code ^short = "practitioner:authorization:code"
* qualification.code.coding.system ^short = "practitioner:authorization:system"
* qualification.code.coding.display ^short = "practitioner:authorization:text"