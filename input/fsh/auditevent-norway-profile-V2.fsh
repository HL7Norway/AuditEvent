Profile:        AuditEventNorwayTokenProfile
Parent:         AuditEvent
Title:          "National profile for AuditEvent for security token mapping"
Description: """
This profile should be used in all use cases where the request to an API involves a security token (JWT/SAML). The profile describes how the attributes / claims of a 
token must be mapped into elements / fields of an AuditEvent if they are present.
"""

* purposeOfEvent.coding ^short = "healthcareservice:system, :id, :name. :assigner ignoreres siden Coding-datatypen ikke har assigner."
* purposeOfEvent.coding MS // In other words: attribute exists, it must be mapped
* agent ^slicing.discriminator.type = #pattern
* agent ^slicing.discriminator.path = "type"
* agent ^slicing.rules = #open
* agent ^slicing.description = "Slices on agent[*].type"
* agent contains 
    user 1..

* agent[user].who.extension contains 
	Qualification named qualification 0..1 MS and	
	NationalIdentifier named national-identifier 0..1 MS and
	ApplicationRole named application-role 0..1 MS

* agent[user].extension contains 
	Organization named organization 0..1 MS and
	ChildOrganization named child-organization 0..1 MS and
	Facility named facility 0..1 MS and
	AssuranceLevel named assurance-level 0..1 MS

* agent[user].type = UserAgentTypesCS#TokenBased
* agent[user].who.identifier.value ^short = "subject:id"	
* agent[user].who.identifier.system ^short = "subject:system"
* agent[user].who.identifier.assigner.identifier.value ^short = "subject:assigner"
* agent[user].who.display ^short = "subject:name"
* agent[user].purposeOfUse MS // In other words: attribute exists, it must be mapped
* agent[user].purposeOfUse.coding.code ^short = "purpose:id and purpose-local:id"
* agent[user].purposeOfUse.coding.system ^short = "purpose:system and purpose-local:system"
* agent[user].purposeOfUse.coding.display ^short = "purpose:name and purpose-local:name"
* agent[user].purposeOfUse.coding.userSelected ^short = "purpose-local:userselected"
* agent[user].purposeOfUse.coding.userSelected ^definition = "purpose-local:userselected definition"
* agent[user].purposeOfUse.text ^short = "purpose:description and purpose-local:description"
* agent[user].who.extension[qualification] MS // In other words: attribute exists, it must be mapped
* agent[user].who.extension[qualification].extension[id].valueIdentifier.system ^short = "subject:qualification:system"
* agent[user].who.extension[qualification].extension[id].valueIdentifier.value ^short = "subject:qualification:id"
* agent[user].who.extension[qualification].extension[id].valueIdentifier.assigner.identifier.value ^short = "subject:qualification:assigner"
* agent[user].who.extension[qualification].extension[name].valueString ^short = "subject:qualification:name"
* agent[user].who.extension[national-identifier] MS // In other words: attribute exists, it must be mapped
* agent[user].who.extension[national-identifier].extension[id].valueIdentifier.system ^short = "subject:national-identifier:system"
* agent[user].who.extension[national-identifier].extension[id].valueIdentifier.value ^short = "subject:national-identifier:id"
* agent[user].who.extension[national-identifier].extension[id].valueIdentifier.assigner.identifier.value ^short = "subject:national-identifier:assigner"
* agent[user].who.extension[national-identifier].extension[name].valueString ^short = "subject:national-identifier:name"
* agent[user].who.extension[application-role] MS // In other words: attribute exists, it must be mapped
* agent[user].who.extension[application-role].extension[id].valueIdentifier.system ^short = "subject:application-role:system"
* agent[user].who.extension[application-role].extension[id].valueIdentifier.value ^short = "subject:application-role:id"
* agent[user].who.extension[application-role].extension[id].valueIdentifier.assigner.identifier.value ^short = "subject:application-role:assigner"
* agent[user].who.extension[application-role].extension[name].valueString  ^short = "subject:application-role:name" // NB! Ikke i bruk fra DIPS. Lagt til for ordens skyld.

* agent[user].extension[organization] MS // In other words: attribute exists, it must be mapped
* agent[user].extension[organization].extension[id].valueIdentifier.system ^short = "subject:organization:system"
* agent[user].extension[organization].extension[id].valueIdentifier.value ^short = "subject:organization:id"
* agent[user].extension[organization].extension[id].valueIdentifier.assigner.identifier.value ^short = "subject:organization:assigner"
* agent[user].extension[organization].extension[name].valueString ^short = "subject:organization:name"

* agent[user].extension[child-organization] MS // In other words: attribute exists, it must be mapped
* agent[user].extension[child-organization].extension[id].valueIdentifier.system ^short = "subject:child-organization:system"  //  (typisk Brønnøysund organisasjonsnummer - nivå 2 av subject:organization) 
* agent[user].extension[child-organization].extension[id].valueIdentifier.value ^short = "subject:child-organization:id"
* agent[user].extension[child-organization].extension[id].valueIdentifier.assigner.identifier.value ^short = "subject:child-organization:assigner"
* agent[user].extension[child-organization].extension[name].valueString ^short = "subject:child-organization:name"

* agent[user].extension[facility] MS // In other words: attribute exists, it must be mapped
* agent[user].extension[facility].extension[id].valueIdentifier.system ^short = "subject:facility:system" // (typisk RESH-ID)
* agent[user].extension[facility].extension[id].valueIdentifier.value ^short = "subject:facility:id"
* agent[user].extension[facility].extension[id].valueIdentifier.assigner.identifier.value ^short = "subject:facility:assigner"
* agent[user].extension[facility].extension[name].valueString ^short = "subject:facility:name"

* agent[user].extension[assurance-level]  MS // In other words: attribute exists, it must be mapped
* agent[user].extension[assurance-level].valueCodeableConcept.coding.code ^short = "subject:assurance-level:code"
* agent[user].extension[assurance-level].valueCodeableConcept.coding.system ^short = "subject:assurance-level:system"
* agent[user].extension[assurance-level].valueCodeableConcept.coding.display ^short = "subject:assurance-level:name"

* agent[user].role MS // In other words: attribute exists, it must be mapped
* agent[user].role ^short = "subject:qualification-role:*, subject:role:* and subject:functional-role:*. :assigner is ignored"

* entity ^slicing.discriminator[0].type = #pattern
* entity ^slicing.discriminator[=].path = "type"
* entity ^slicing.discriminator[+].type = #pattern
* entity ^slicing.discriminator[=].path = "role"
* entity ^slicing.rules = #open
* entity contains 
    patient 0..1 

* entity[patient].extension contains 	
	ChildOrganization named child-organization 0..1 MS and
	Facility named facility 0..1 MS
* entity[patient] MS // In other words: attribute exists, it must be mapped	
* entity[patient].type = http://terminology.hl7.org/CodeSystem/audit-entity-type#1 "Person" // Slice part 1
* entity[patient].role = http://terminology.hl7.org/CodeSystem/object-role#1 "Patient"  // Slice part 2
* entity[patient].what 1..1
* entity[patient].what only Reference(Patient)
* entity[patient].what.identifier.value ^short = "resource:id" // (FNR/DNR)
* entity[patient].what.identifier.system ^short = "resource:system"
* entity[patient].what.identifier.assigner.identifier.value ^short = "resource:assigner"
* entity[patient].what.display ^short = "resource:name"  

* entity[patient].extension[child-organization] MS // In other words: attribute exists, it must be mapped
* entity[patient].extension[child-organization].extension[id].valueIdentifier.system ^short = "resource:child-organization:system"  // (Brønnøysund organisasjonsnummer - nivå 2 av subject:organization)
* entity[patient].extension[child-organization].extension[id].valueIdentifier.value ^short = "resource:child-organization:id"
* entity[patient].extension[child-organization].extension[id].valueIdentifier.assigner.identifier.value ^short = "resource:child-organization:assigner"
* entity[patient].extension[child-organization].extension[name].valueString ^short = "resource:child-organization:name"

* entity[patient].extension[facility] MS // In other words: attribute exists, it must be mapped
* entity[patient].extension[facility].extension[id].valueIdentifier.system ^short = "resource:facility:system" // (RESH-ID) 
* entity[patient].extension[facility].extension[id].valueIdentifier.value ^short = "resource:facility:id"
* entity[patient].extension[facility].extension[id].valueIdentifier.assigner.identifier.value ^short = "resource:facility:assigner"
* entity[patient].extension[facility].extension[name].valueString ^short = "resource:facility:name"