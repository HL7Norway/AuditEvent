Profile: AuditEventNorwayEncounterServiceProviderOrganization
Parent: NoBasisOrganization
Title: "no-basis-auditevent-encounter-serviceprovider-organization"
Description: "The service provider organization of auditevent encounter for AuditEventNorway profile."
* identifier ^short = "patients:department:id, :system and :authority"
* identifier.id ^short = "patients:department:id"
* identifier.system ^short = "patients:department:system"
* identifier.assigner.display ^short = "patients:department:authority"
* name ^short = "patients:department:name"


Profile: AuditEventNorwayEncounterPointOfCareOrganization
Parent: NoBasisOrganization
Title: "no-basis-auditevent-encounter-pointofcare-organization"
Description: "The encounter location organization for AuditEventNorway profile"
* identifier ^short = "patients:point_of_care_patient:id, :system and :authority"
* identifier.id ^short = "patients:point_of_care_patient:id"
* identifier.system ^short = "patients:point_of_care_patient:system"
* identifier.assigner.display ^short = "patients:point_of_care_patient:authority"
* name ^short = "patients:point_of_care_patient:name"

Profile: AuditEventNorwayEncounterPointOfCare
Parent: NOBasisLocation
Title: "no-basis-auditevent-encounter-pointofcare"
Description: """
The encounter location with patients:point_of_care_patient:* mapping.

Pasientens nærmeste organisasjon, dvs organisasjonsnummer til enheten hvor pasienten behandles
"""
* managingOrganization ^short = "patients:point_of_care_patient:*"
* managingOrganization only Reference(AuditEventNorwayEncounterPointOfCareOrganization)


Profile: NOBasisPatient
Parent: Patient
Id: no-basis-patient
Title: "no-basis-Patient (shadow)"
Description: """
This should be replaced by [no-basis-Patient](https://simplifier.net/hl7norwayno-basis/nobasispatient)
"""

Profile: NOBasisAuditeventPatient
Parent: NOBasisPatient
Id: no-basis-patient-auditevent
Title: "no-basis-patient-auditevent"
Description: """
The patient (patients:identifier) that is the subject of the data used/created/updated/deleted during the activity

NOTE! Single auditevent per patient, i.e. need to duplicate auditevent for each patient in list.
"""
* identifier ^short = "patients:identifier:id, :system and :authority"
* identifier.id ^short = "patients:identifier:id"
* identifier.system ^short = "patients:identifier:system"
* identifier.assigner.display ^short = "patients:identifier:authority"
* name ^short = "patients:identifier:name"

Profile: AuditEventNorwayEncounter
Parent: Encounter
Id: no-basis-encounter-auditevent
Title: "no-basis-encounter-auditevent"
Description: """
The encounter associated with audit event mapping of care-relation:healthcare-service:* and patients:point_of_care_patient:*
"""
* serviceType ^short = "care-relation:healthcare-service:*"
* serviceType.coding.code ^short = "care-relation:healthcare-service:code"
* serviceType.coding.system ^short = "care-relation:healthcare-service:system"
* serviceType.coding.display ^short = "care-relation:healthcare-service:text"
//* serviceType.extension contains 
//  CodeWithAssigner2 named _assigner 0..1 MS
// * serviceType.extension[_assigner].valueString ^short = "care-relation:healthcare-service:assigner"  
* location.location only Reference(AuditEventNorwayEncounterPointOfCare)
* location.location ^short = "patients:point_of_care_patient:*"
* serviceProvider ^short = "patients:department:*"
* serviceProvider only Reference(AuditEventNorwayEncounterServiceProviderOrganization)


Profile: AuditEventNorwayPractitionerPointOfCareOrganization
Parent: NoBasisOrganization
Title: "no-basis-auditevent-practitioner-pointofcare-organization"
Description: """
The point of care organization (practitioner:point-of-care) of health care practitioner.
"""
* identifier ^short = "practitioner:point-of-care:id, :system, :authority"
* identifier.id ^short = "practitioner:point-of-care:id"
* identifier.system ^short = "practitioner:point-of-care:system"
* identifier.assigner.display ^short = "practitioner:point-of-care:authority"
* name ^short = "practitioner:point-of-care:name"

Profile: NOBasisLocation
Parent: Location
Id: no-basis-Location
Title: "no-basis-Location (shadow)"
Description: """
This is a shadow profile that will be replace by [no-basis-Location](https://simplifier.net/hl7norwayno-basis/nobasislocation)
"""

Profile: AuditEventNorwayPractitionerPointOfCare
Parent: NOBasisLocation
Title: "no-basis-auditevent-practitioner-pointofcare"
Description: """
The point of care location (practitioner:point-of-care) of health care practitioner.
"""
* managingOrganization only Reference(AuditEventNorwayPractitionerPointOfCareOrganization)
* managingOrganization ^short = "practitioner:point-of-care"

Profile: AuditEventNorwayPractitionerLegalEntity
Parent: NoBasisOrganization
Title: "no-basis-auditevent-practitioner-legalentity"
Description: """
The health care organization (practitioner:legal-entity) of the health care practitioner.
"""
* identifier ^short = "practitioner:legal-entity:id, :system, :authority"
* identifier.system ^short = "practitioner:legal-entity:system"
* identifier.id ^short = "practitioner:legal-entity:id"
* identifier.assigner.display ^short = "practitioner:legal-entity:authority"
* name ^short = "practitioner:legal-entity:name"

Profile: NoBasisOrganization
Parent: Organization
Id: no-basis-Organization
Title: "no-basis-Organization (shadow)"
Description: """
This is a shadow profile that will be replaced by [no-basis-Organization](https://simplifier.net/hl7norwayno-basis/nobasisorganization)
"""

Profile: AuditEventNorwayPractitionerDepartment
Parent: NoBasisOrganization
Title: "no-basis-auditevent-department"
Description: """
The health care department (practitioner:department) of the health care practitioner.
"""
* identifier ^short = "practitioner:department:id, :system, :authority"
* identifier.system ^short = "practitioner:department:system"
* identifier.id ^short = "practitioner:department:id"
* identifier.assigner.display ^short = "practitioner:department:authority"
* name ^short = "practitioner:department:name"
* partOf only Reference(AuditEventNorwayPractitionerLegalEntity)
* partOf ^short = "practitioner:legal-entity:*"

Profile: NoBasisPractitioner
Parent: Practitioner
Title: "no-basis-Practitioner (shadow)"
Description: """
This is a shadow profile that should be replaced by [no-basis-Practitioner](https://simplifier.net/hl7norwayno-basis/nobasispractitioner)
"""

Profile: AuditEventNorwayPractitioner
Parent: NoBasisPractitioner
Title: "no-basis-auditevent-practitioner"
Description: """
The national identity (practitioner:identifier and :name), HPR-number (practitioner:hpr-nr) and qualification (practitioner:authorization) of the health care professional.  
"""
* identifier ^short = "practitioner:identifier and practitioner:hpr-nr"
* identifier.system ^short = "practitioner:identifier:system and practitioner:hpr-nr:system" 
* identifier.value ^short = "practitioner:identifier:id and practitioner:hpr-nr:id"
* identifier.assigner.display  ^short = "practitioner:identifier:authority and practitioner:hpr-nr:authority"
* name.text ^short = "practitioner:identifier:name"
* qualification.code.coding.code ^short = "practitioner:authorization:code"
* qualification.code.coding.system ^short = "practitioner:authorization:system"
* qualification.code.coding.display ^short = "practitioner:authorization:text"
// * qualification.code.extension contains 
//  CodeWithAssigner2 named _assigner 0..1 MS
// * qualification.code.extension[_assigner].valueString ^short = "practitioner:authorization:assigner"  
//* extension contains
//    Identifier named _HPRNumber 0..1 MS 
//* extension[_HPRNumber] MS // In other words: attribute exists, it must be mapped
//  * valueIdentifier.system ^short = "practitioner:hpr-nr:system"
//  * valueIdentifier.value ^short = "practitioner:hpr-nr:id"
//  * valueIdentifier.assigner.display ^short = "practitioner:hpr-nr:authority"

Profile: NoBasisPractitionerRole
Parent: PractitionerRole
Id: no-basis-PractitionerRole
Title: "no-basis-PractitionerRole (shadow)"
Description: """
Shadow profile of no-basis-PractitionerRole that will be replaced by [no-basis-PractitionerRole](https://simplifier.net/hl7norwayno-basis/nobasispractitionerrole)
"""

Profile: AuditEventNorwayPractitionerRole
Parent: NoBasisPractitionerRole
Title: "no-basis-auditevent-practitionerrole"
Description: """
The consumer health organization (practitioner:legal-entity) and department affiliation (practitioner:department) of the health care practitioner.
"""
* practitioner only Reference(AuditEventNorwayPractitioner) 
* practitioner ^short = "practitioner:identifier, practitioner:hpr-nr and practitioner:authorization"
* organization only Reference(AuditEventNorwayPractitionerDepartment) 
* organization ^short = "practitioner:department"
* location only Reference(AuditEventNorwayPractitionerPointOfCare) 
* location ^short = "practitioner:point-of-care"
//* extension contains
//  IdentifierWithName named _department 0..1 MS 
//* extension[_department] MS  
//  * extension[id] ^short = "practitioner:department:id, :system, :authority"
//  * extension[name] ^short = "practitioner:department:name"

Profile:        NOBasisAuditevent
Parent:         AuditEvent
Id: no-basis-auditevent
Title:          "no-basis-auditevent"
Description: """
This is the main profile that describes the mapping [Norwegian Trust Framework attributes ("Tillitsrammeverk")](https://github.com/NorskHelsenett/Tillitsrammeverk/blob/main/specs/informasjons_og_datamodell.md#424-oppsummering-av-informasjonselementer) to AuditEvent Resource.
"""
* agent.who only Reference(AuditEventNorwayPractitionerRole)
* purposeOfEvent ^short = "care-relationship:purpose-of-use:code, :system and :text and care-relationship:purpose-of-use-details:code, :system and :text"
* purposeOfEvent.coding.code ^short = "care-relationship:purpose-of-use:code and care-relationship:purpose-of-use-details:code"
* purposeOfEvent.coding.system ^short = "care-relationship:purpose-of-use:system and care-relationship:purpose-of-use-details:system"
* purposeOfEvent.coding.display ^short = "care-relationship:purpose-of-use:text and care-relationship:purpose-of-use-details:text"
// * purposeOfEvent.coding.extension contains CodeWithAssigner2 named _purposeOfEvent_assigner 0..1 MS
// * purposeOfEvent.coding.extension[_purposeOfEvent_assigner].valueString ^short = "care-relationship:purpose-of-use:assigner and care-relationship:purpose-of-use-details:assigner"
 
* extension contains 
  AuditEventEncounterExtension named _encounter 0..1 MS and
  AuditEventPatientExtension named _patient 0..1 MS and 
  //CodeWithAssigner named _purpose-of-use-details 0..1 MS and  
	CareRelationMetaData named _careRelationMetaData 0..1 MS 
//  CodeWithAssigner named _purpose-of-use 0..1 MS and
//   AuditEventAuthorizationExtension named _authorization 0..* MS


/*
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
*/    

* extension[_careRelationMetaData] MS  
  * ^short = "care-relationship:decision-ref:id, :description, :user-selected"
  * extension[id].valueString ^short = "care-relationship:decision-ref:id"
  * extension[description].valueString ^short = "care-relationship:decision-ref:description"
  * extension[user-selected].valueBoolean ^short = "care-relationship:decision-ref:user-selected"  