Profile: AuditEventNorwayPractitionerLocationOrganization
Parent: Organization
Title: "AuditEventNorwayPractitionerLocationOrganization"
* identifier ^short = "practitioner:point-of-care:id, :system, :authority"
* name ^short = "practitioner:point-of-care:name"

Profile: AuditEventNorwayPractitionerLocation
Parent: Location
Title: "AuditEventNorwayPractitionerLocation"
* managingOrganization only Reference(AuditEventNorwayPractitionerLocationOrganization)

Profile: AuditEventNorwayOrganization
Parent: Organization
Title: "AuditEventNorwayOrganization"
* identifier ^short = "practitioner:legal-entity:id, :system, :authority"
* name ^short = "practitioner:legal-entity:name"

Profile: AuditEventNorwayPractitioner
Parent: Practitioner
Title: "AuditEventNorwayPractitioner"
* identifier ^short = "practitioner:identifier:id, :system, :authority"
* name ^short = "practitioner:identifier:name"


Profile: AuditEventNorwayPractitionerRole
Parent: PractitionerRole
Title: "AuditEventNorwayPractitionerRole"
* practitioner only Reference(AuditEventNorwayPractitioner)
* organization only Reference(AuditEventNorwayOrganization) // legal-entity
* location only Reference(AuditEventNorwayPractitionerLocation)
* extension contains
  IdentifierWithName named _department 0..1 MS
* extension[_department] MS  
  * extension[id] ^short = "practitioner:department:id, :system, :authority"
  * extension[name] ^short = "practitioner:department:name"

Profile:        AuditEventNorwayTokenProfileConsumer
Parent:         AuditEvent
Title:          "Audit from a consumer organization perspective"
Description: """
This profile describes where to find the attributes in auditevent that are a part of the security context in cross organizational API access
from the consumer (requestor) perspective.
"""


* extension contains
	CodeWithAssigner named _purpose-of-use 0..1 MS and
	CodeWithAssigner named _purpose-of-use-details 0..1 MS and
	CareRelationMetaData named _careRelationMetaData 0..1 MS and
  CodeWithAssigner named _health-care-service 0..1 MS  

// care-relation
* extension[_health-care-service] MS
  * extension[code].valueCoding.code ^short = "care-relationship:health-care-service:code"
  * extension[code].valueCoding.display ^short = "care-relationship:health-care-service:text"
  * extension[code].valueCoding.system ^short = "care-relationship:health-care-service:system"
  * extension[assigner].valueString ^short = "care-relationship:health-care-service:assigner"
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

* agent.extension contains 
	CodeWithAssigner named _authorization 0..1 MS 

* agent.extension[_authorization]  MS // In other words: attribute exists, it must be mapped
  * extension[code].valueCoding.code ^short = "practitioner:authorization:code"
  * extension[code].valueCoding.system ^short = "practitioner:authorization:system"
  * extension[code].valueCoding.display ^short = "practitioner:authorization:text"
  * extension[assigner].valueString ^short = "practitioner:authorization:assigner"  

* agent.who only Reference(AuditEventNorwayPractitionerRole)
* agent.who.extension contains 
	IdentifierWithName named _HPRNumber 0..1 MS 
* agent.who.extension[_HPRNumber] MS // In other words: attribute exists, it must be mapped
  * extension[id].valueIdentifier.system ^short = "practitioner:hpr-nr:system"
  * extension[id].valueIdentifier.value ^short = "practitioner:hpr-nr:id"
  * extension[id].valueIdentifier.assigner.display ^short = "practitioner:hpr-nr:authority"


  
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
