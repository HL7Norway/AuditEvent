Profile:        AuditEventNorwayTokenProfile
Parent:         AuditEvent
Title:          "National profile for AuditEvent for security token mapping"
Description: """
This profile should be used in all use cases where the request to an API involves a security token (JWT/SAML). The profile describes how the attributes / claims of a 
token must be mapped into elements / fields of an AuditEvent if they are present.
"""

* agent.who.extension contains 
	IdentifierWithName named _HPRNumber 0..1 MS 

* agent.extension contains 
	IdentifierWithName named _legal-entity 0..1 MS and
	IdentifierWithName named _point-of-care 0..1 MS and
	IdentifierWithName named _department 0..1 MS and
	CodeWithAssigner named _authorization 0..1 MS 

* extension contains
	CodeWithAssigner named _purpose-of-use 0..1 MS and
	CodeWithAssigner named _purpose-of-use-details 0..1 MS and
	CareRelationMetaData named _careRelationMetaData 0..1 MS and
  CodeWithAssigner named _health-care-service 0..1 MS  

* agent.who.identifier.value ^short = "practitioner:identifier:id"	
* agent.who.identifier.system ^short = "practitioner:identifier:system"
* agent.who.identifier.assigner.display ^short = "practitioner:identifier:authority"
* agent.who.display ^short = "practitioner:identifier:name"
* agent.who.extension[_HPRNumber] MS // In other words: attribute exists, it must be mapped
  * extension[id].valueIdentifier.system ^short = "practitioner:hpr-nr:system"
  * extension[id].valueIdentifier.value ^short = "practitioner:hpr-nr:id"
  * extension[id].valueIdentifier.assigner.display ^short = "practitioner:hpr-nr:authority"
* agent.extension[_authorization]  MS // In other words: attribute exists, it must be mapped
  * extension[code].valueCoding.code ^short = "practitioner:authorization:code"
  * extension[code].valueCoding.system ^short = "practitioner:authorization:system"
  * extension[code].valueCoding.display ^short = "practitioner:authorization:text"
  * extension[assigner].valueString ^short = "practitioner:authorization:assigner"
* agent.extension[_legal-entity] MS // In other words: attribute exists, it must be mapped
  * extension[id].valueIdentifier.system ^short = "practitioner:legal-entity:system"
  * extension[id].valueIdentifier.value ^short = "practitioner:legal-entity:id"
  * extension[id].valueIdentifier.assigner.display ^short = "practitioner:legal-entity:authority"
  * extension[name].valueString ^short = "practitioner:legal-entity:name"
* agent.extension[_point-of-care] MS // In other words: attribute exists, it must be mapped
  * extension[id].valueIdentifier.system ^short = "practitioner:point-of-care:system"  //  (typisk Brønnøysund organisasjonsnummer - nivå 2 av subject:organization) 
  * extension[id].valueIdentifier.value ^short = "practitioner:point-of-care:id"
  * extension[id].valueIdentifier.assigner.display ^short = "practitioner:point-of-care:authority"
  * extension[name].valueString ^short = "practitioner:point-of-care:name"
* agent.extension[_department] MS // In other words: attribute exists, it must be mapped
  * extension[id].valueIdentifier.system ^short = "practitioner:department:system" // (typisk RESH-ID)
  * extension[id].valueIdentifier.value ^short = "practitioner:department:id"
  * extension[id].valueIdentifier.assigner.display ^short = "practitioner:department:authority"
  * extension[name].valueString ^short = "practitioner:department:name"

// care-relation
* extension[_purpose-of-use] MS
  * extension[code].valueCoding.code ^short = "care-relationship:purpose-of-use:code"
  * extension[code].valueCoding.system ^short = "care-relationship:purpose-of-use:system" 
  * extension[code].valueCoding.display ^short = "care-relationship:purpose-of-use:text" 
  * extension[assigner].valueString ^short = "care-relationship:purpose-of-use:assigner"
* extension[_purpose-of-use-details] MS
  * extension[code].valueCoding.code ^short = "care-relationship:purpose-of-use-details:code"
  * extension[code].valueCoding.system ^short = "care-relationship:purpose-of-use-details:system" 
  * extension[code].valueCoding.display ^short = "care-relationship:purpose-of-use-details:text" 
  * extension[assigner].valueString ^short = "care-relationship:purpose-of-use-details:assigner"
* extension[_careRelationMetaData] MS
  * extension[id].valueString ^short = "care-relationship:decision-ref:id"
  * extension[description].valueString ^short = "care-relationship:decision-ref:description"
  * extension[user-selected].valueBoolean ^short = "care-relationship:decision-ref:user-selected"
* extension[_health-care-service] MS
  * extension[code].valueCoding.code ^short = "care-relationship:health-care-service:code"
  * extension[code].valueCoding.display ^short = "care-relationship:health-care-service:text"
  * extension[code].valueCoding.system ^short = "care-relationship:health-care-service:system"
  * extension[assigner].valueString ^short = "care-relationship:health-care-service:assigner"
	  
* entity ^slicing.discriminator[0].type = #pattern
* entity ^slicing.discriminator[=].path = "type"
* entity ^slicing.discriminator[+].type = #pattern
* entity ^slicing.discriminator[=].path = "role"
* entity ^slicing.rules = #open
* entity contains 
    patient 0..1 // Only one patient per auditevent. Remember to document.

* entity[patient].extension contains 	
	IdentifierWithName named _point-of-care 0..1 MS and
	IdentifierWithName named _department 0..1 MS 

* entity[patient] MS // In other words: attribute exists, it must be mapped	
* entity[patient].type = http://terminology.hl7.org/CodeSystem/audit-entity-type#1 "Person" // Slice part 1
* entity[patient].role = http://terminology.hl7.org/CodeSystem/object-role#1 "Patient"  // Slice part 2
* entity[patient].what 1..1
* entity[patient].what only Reference(Patient)
* entity[patient].what.identifier.value ^short = "patients[*]:identifier:id" 
* entity[patient].what.identifier.system ^short = "patients[*]:identifier:system"
* entity[patient].what.identifier.assigner.display ^short = "patients[*]:identifier:authority"
* entity[patient].what.display ^short = "patients[*]:identifier:name"  

* entity[patient].extension[_point-of-care] MS // In other words: attribute exists, it must be mapped
  * extension[id].valueIdentifier.system ^short = "patients[*]:point-of-care:system"  
  * extension[id].valueIdentifier.value ^short = "patients[*]:point-of-care:id"
  * extension[id].valueIdentifier.assigner.display ^short = "patients[*]:point-of-care:authority"
  * extension[name].valueString ^short = "patients[*]:point-of-care:name"

* entity[patient].extension[_department] MS // In other words: attribute exists, it must be mapped
  * extension[id].valueIdentifier.system ^short = "patients[*]:department:system" 
  * extension[id].valueIdentifier.value ^short = "patients[*]:department:id"
  * extension[id].valueIdentifier.assigner.display ^short = "patients[*]:department:authority"
  * extension[name].valueString ^short = "patients[*]:department:name"

