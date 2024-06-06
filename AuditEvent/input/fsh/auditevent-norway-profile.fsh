Profile: AuditeventEncounterServiceproviderOrganization
Id: auditevent-encounter-serviceprovider-organization
Parent: NoBasisOrganization
Title: "auditevent-encounter-serviceprovider-organization"
Description: "The service provider department of auditevent encounter (Auditevent._encounter)."
* ^status = #active
* ^version = "2.3.0"
* identifier ^short = "patients:department:id, :system and :authority"
* identifier.id ^short = "patients:department:id"
* identifier.system ^short = "patients:department:system"
* identifier.assigner.display ^short = "patients:department:authority"
* name ^short = "patients:department:name"


Profile: AuditeventEncounterPointofcareOrganization
Id: auditevent-encounter-pointofcare-organization
Parent: NoBasisOrganization
Title: "auditevent-encounter-pointofcare-organization"
Description: "The point of care managing organization of the auditevent encounter (Auditevent._encounter)"
* ^status = #active
* ^version = "2.3.0"
* identifier ^short = "patients:point_of_care_patient:id, :system and :authority"
* identifier.id ^short = "patients:point_of_care_patient:id"
* identifier.system ^short = "patients:point_of_care_patient:system"
* identifier.assigner.display ^short = "patients:point_of_care_patient:authority"
* name ^short = "patients:point_of_care_patient:name"


Profile: AuditeventEncounterPointofcare
Id: auditevent-encounter-pointofcare
Parent: NoBasisLocation
Title: "auditevent-encounter-pointofcare"
Description: """
The point of care location of auditevent encounter (Auditevent._encounter).
"""
* ^status = #active
* ^version = "2.3.0"
* managingOrganization ^short = "patients:point_of_care_patient:*"
* managingOrganization only Reference(AuditeventEncounterPointofcareOrganization)

Profile: AuditeventEncounter
Id: auditevent-encounter
Parent: Encounter
Title: "auditevent-encounter"
Description: """
The encounter associated with auditevent if any (Auditevent._encounter).
"""
* ^status = #active
* ^version = "2.3.0"
* serviceType ^short = "care-relation:healthcare-service:*"
* serviceType.coding.code ^short = "care-relation:healthcare-service:code"
* serviceType.coding.system ^short = "care-relation:healthcare-service:system"
* serviceType.coding.display ^short = "care-relation:healthcare-service:text"
* serviceType.coding from NO_basis_encounter_auditevent_servicetype (preferred)
* location.location only Reference(AuditeventEncounterPointofcare)
* location.location ^short = "patients:point_of_care_patient:*"
* serviceProvider ^short = "patients:department:*"
* serviceProvider only Reference(AuditeventEncounterServiceproviderOrganization)


Profile: AuditeventPatient
Id: auditevent-patient
Parent: NoBasisPatient
Title: "auditevent-patient"
Description: """
The patient (patients:identifier) that is the subject of the auditevent activity if any (Auditevent._patient).

NOTE! Single auditevent per patient, i.e. need to duplicate auditevent for each patient in list.
"""
* ^status = #active
* ^version = "2.3.0"
* identifier ^short = "patients:identifier:id, :system and :authority"
* identifier.id ^short = "patients:identifier:id"
* identifier.system ^short = "patients:identifier:system"
* identifier.assigner.display ^short = "patients:identifier:authority"
* name ^short = "patients:identifier:name"



Profile: AuditeventPractitionerPointofcareOrganization
Id: auditevent-practitioner-pointofcare-organization
Parent: NoBasisOrganization
Title: "auditevent-practitioner-pointofcare-organization"
Description: """
The point of care managing organization of auditevent health care practitioner actor (Auditevent.agent.who).
"""
* ^status = #active
* ^version = "2.3.0"
* identifier ^short = "practitioner:point-of-care:id, :system, :authority"
* identifier.id ^short = "practitioner:point-of-care:id"
* identifier.system ^short = "practitioner:point-of-care:system"
* identifier.assigner.display ^short = "practitioner:point-of-care:authority"
* name ^short = "practitioner:point-of-care:name"

Profile: AuditeventPractitionerPointofcare
Id: auditevent-practitioner-pointofcare
Parent: NoBasisLocation
Title: "auditevent-practitioner-pointofcare"
Description: """
The point of care location of auditevent health care practitioner actor (Auditevent.agent.who).
"""
* ^status = #active
* ^version = "2.3.0"
* managingOrganization only Reference(AuditeventPractitionerPointofcareOrganization)
* managingOrganization ^short = "practitioner:point-of-care"

Profile: AuditeventPractitionerLegalentity
Id: auditevent-practitioner-legalentity
Parent: NoBasisOrganization
Title: "auditevent-practitioner-legalentity"
Description: """
The health care managing organization (legal entity) of the health care auditevent practitioner actor (Auditevent.agent.who).
"""
* ^status = #active
* ^version = "2.3.0"
* identifier ^short = "practitioner:legal-entity:id, :system, :authority"
* identifier.system ^short = "practitioner:legal-entity:system"
* identifier.id ^short = "practitioner:legal-entity:id"
* identifier.assigner.display ^short = "practitioner:legal-entity:authority"
* name ^short = "practitioner:legal-entity:name"

Profile: AuditeventDepartment
Id: auditevent-department
Parent: NoBasisOrganization
Title: "auditevent-department"
Description: """
The health care department of the health care auditevent practitioner actor (Auditevent.agent.who).
"""
* ^status = #active
* ^version = "2.3.0"
* identifier ^short = "practitioner:department:id, :system, :authority"
* identifier.system ^short = "practitioner:department:system"
* identifier.id ^short = "practitioner:department:id"
* identifier.assigner.display ^short = "practitioner:department:authority"
* name ^short = "practitioner:department:name"
* partOf only Reference(AuditeventPractitionerLegalentity)
* partOf ^short = "practitioner:legal-entity:*"

Profile: AuditEventNorwayPractitioner
Id: auditevent-practitioner
Parent: NoBasisPractitioner
Title: "auditevent-practitioner"
Description: """
The health care audit event practitioner actor (Auditevent.agent.who).  
"""
* ^status = #active
* ^version = "2.3.0"
* identifier ^short = "practitioner:identifier and practitioner:hpr-nr"
* identifier.system ^short = "practitioner:identifier:system and practitioner:hpr-nr:system" 
* identifier.value ^short = "practitioner:identifier:id and practitioner:hpr-nr:id"
* identifier.assigner.display  ^short = "practitioner:identifier:authority and practitioner:hpr-nr:authority"
* name.text ^short = "practitioner:identifier:name"
* qualification.code.coding.code ^short = "practitioner:authorization:code"
* qualification.code.coding.system ^short = "practitioner:authorization:system"
* qualification.code.coding.display ^short = "practitioner:authorization:text"

Profile: AuditeventPractitionerrole
Id: auditevent-practitionerrole
Parent: NoBasisPractitionerRole
Title: "auditevent-practitionerrole"
Description: """
The health care practitioner auditevent actor at managing organization (Auditevent.agent.who).
"""
* ^status = #active
* ^version = "2.3.0"
* practitioner only Reference(AuditEventNorwayPractitioner) 
* practitioner ^short = "practitioner:identifier, practitioner:hpr-nr and practitioner:authorization"
* organization only Reference(auditevent-department or AuditeventPractitionerLegalentity) 
* organization ^short = "practitioner:department"
* location only Reference(AuditeventPractitionerPointofcare) 
* location ^short = "practitioner:point-of-care"

Profile:        NOBasisAuditevent
Id: no-basis-Auditevent
Parent:         AuditEvent
Title:          "no-basis-Auditevent"
Description: """
This is the main profile that describes the mapping of [Norwegian Trust Framework attributes ("Tillitsrammeverk")](https://github.com/NorskHelsenett/Tillitsrammeverk/blob/main/specs/informasjons_og_datamodell.md#424-oppsummering-av-informasjonselementer) to AuditEvent Resource.
"""
* ^status = #active
* ^version = "2.3.0"
* agent.who only Reference(AuditeventPractitionerrole)
* purposeOfEvent ^short = "care-relationship:purpose-of-use:code, :system and :text and care-relationship:purpose-of-use-details:code, :system and :text"
* purposeOfEvent.coding.code ^short = "care-relationship:purpose-of-use:code and care-relationship:purpose-of-use-details:code"
* purposeOfEvent.coding.system ^short = "care-relationship:purpose-of-use:system and care-relationship:purpose-of-use-details:system"
* purposeOfEvent.coding.display ^short = "care-relationship:purpose-of-use:text and care-relationship:purpose-of-use-details:text"
* purposeOfEvent from NO_basis_auditevent_purpose_of_event (extensible)
* extension contains 
  AuditEventEncounterExtension named _encounter 0..1 MS and
  AuditEventPatientExtension named _patient 0..1 MS and 
	AuditEventCareRelationMetaData named _careRelationMetaData 0..1 MS 
* extension[_careRelationMetaData] MS  
  * ^short = "toa, care-relationship:decision-ref:id, :description, :user-selected"
  * extension[decision-ref-id] ^short = "care-relationship:decision-ref:id"
  * extension[decision-ref-description] ^short = "care-relationship:decision-ref:description"
  * extension[decision-ref-user-selected] ^short = "care-relationship:decision-ref:user-selected"  
  * extension[toa] ^short = "toa"