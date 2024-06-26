Profile: AuditeventEncounterServiceproviderOrganization
Id: no-domain-Trustframework-Organization-EncounterServiceprovider
Parent: NoBasisOrganization
Title: "no-domain-Trustframework-Organization-EncounterServiceprovider"
Description: "The service provider department of auditevent encounter (Auditevent._encounter)."
* ^status = #active
//* ^version = "2.3.0"
* identifier ^short = "patients:department:id, :system and :authority"
* identifier.id ^short = "patients:department:id"
* identifier.system ^short = "patients:department:system"
* identifier.assigner.display ^short = "patients:department:authority"
* name ^short = "patients:department:name"

Profile: AuditeventEncounterPointofcareOrganization
Id: no-domain-Trustframework-Organization-EncounterPointofcare
Parent: NoBasisOrganization
Title: "no-domain-Trustframework-Organization-EncounterPointofcare"
Description: "The point of care managing organization of the auditevent encounter (Auditevent._encounter)"
* ^status = #active
// * ^version = "2.3.0"
* identifier ^short = "patients:point_of_care_patient:id, :system and :authority"
* identifier.id ^short = "patients:point_of_care_patient:id"
* identifier.system ^short = "patients:point_of_care_patient:system"
* identifier.assigner.display ^short = "patients:point_of_care_patient:authority"
* name ^short = "patients:point_of_care_patient:name"


Profile: AuditeventEncounterPointofcare
Id: no-domain-Trustframework-Location-EncounterPointofcare
Parent: NoBasisLocation
Title: "no-domain-Trustframework-Location-EncounterPointofcare"
Description: """
The point of care location of auditevent encounter (Auditevent._encounter).
"""
* ^status = #active
//* ^version = "2.3.0"
* managingOrganization ^short = "patients:point_of_care_patient:*"
* managingOrganization only Reference(AuditeventEncounterPointofcareOrganization)

Profile: AuditeventEncounter
Id: no-domain-Trustframework-Encounter
Parent: Encounter
Title: "no-domain-Trustframework-Encounter"
Description: """
The encounter associated with auditevent if any (Auditevent._encounter).
"""
* ^status = #active
//* ^version = "2.3.0"
* serviceType ^short = "care-relation:healthcare-service:*"
* serviceType.coding.code ^short = "care-relation:healthcare-service:code"
* serviceType.coding.system ^short = "care-relation:healthcare-service:system"
* serviceType.coding.display ^short = "care-relation:healthcare-service:text"
// * serviceType.coding from NO_basis_encounter_auditevent_servicetype (preferred)
* serviceType.coding ^slicing.discriminator.type = #value
* serviceType.coding ^slicing.discriminator.path = "$this"
* serviceType.coding ^slicing.rules = #open
* serviceType.coding contains
    VOLVEN_8655 0..1 and VOLVEN_8663 0..1 and VOLVEN_8451 0..1
* serviceType.coding[VOLVEN_8655] from urn:oid:2.16.578.1.12.4.1.1.8655 
* serviceType.coding[VOLVEN_8655] ^short = "Volven 8655"
* serviceType.coding[VOLVEN_8655] ^definition = "Helsehjelpsområde (OID=8655)"
* serviceType.coding[VOLVEN_8655] ^mustSupport = false
* serviceType.coding[VOLVEN_8655] ^binding.description = "Volven"
* serviceType.coding[VOLVEN_8663] from urn:oid:2.16.578.1.12.4.1.1.8663 
* serviceType.coding[VOLVEN_8663] ^short = "Volven 8663"
* serviceType.coding[VOLVEN_8663] ^definition = "Tjenestetyper for kommunal helse- og omsorgstjeneste mv. (OID=8663)"
* serviceType.coding[VOLVEN_8663] ^mustSupport = false
* serviceType.coding[VOLVEN_8663] ^binding.description = "Volven"
* serviceType.coding[VOLVEN_8451] from urn:oid:2.16.578.1.12.4.1.1.8451 
* serviceType.coding[VOLVEN_8451] ^short = "Volven 8451"
* serviceType.coding[VOLVEN_8451] ^definition = "Fagområde (OID=8451)"
* serviceType.coding[VOLVEN_8451] ^mustSupport = false
* serviceType.coding[VOLVEN_8451] ^binding.description = "Volven"

* location.location only Reference(AuditeventEncounterPointofcare)
* location.location ^short = "patients:point_of_care_patient:*"
* serviceProvider ^short = "patients:department:*"
* serviceProvider only Reference(AuditeventEncounterServiceproviderOrganization)


Profile: AuditeventPatient
Id: no-domain-Trustframework-Patient
Parent: NoBasisPatient
Title: "no-domain-Trustframework-Patient"
Description: """
The patient (patients:identifier) that is the subject of the auditevent activity if any (Auditevent._patient).

NOTE! Single auditevent per patient, i.e. need to duplicate auditevent for each patient in list.
"""
* ^status = #active
//* ^version = "2.3.0"
* identifier ^short = "patients:identifier:id, :system and :authority"
* identifier.id ^short = "patients:identifier:id"
* identifier.system ^short = "patients:identifier:system"
* identifier.assigner.display ^short = "patients:identifier:authority"
* name ^short = "patients:identifier:name"

Profile: AuditeventPractitionerPointofcareOrganization
Id: no-domain-Trustframework-Organization-PractitionerPointofcare
Parent: NoBasisOrganization
Title: "no-domain-Trustframework-Organization-PractitionerPointofcare"
Description: """
The point of care managing organization of auditevent health care practitioner actor (Auditevent.agent.who).
"""
* ^status = #active
//* ^version = "2.3.0"
* identifier ^short = "practitioner:point-of-care:id, :system, :authority"
* identifier.id ^short = "practitioner:point-of-care:id"
* identifier.system ^short = "practitioner:point-of-care:system"
* identifier.assigner.display ^short = "practitioner:point-of-care:authority"
* name ^short = "practitioner:point-of-care:name"

Profile: AuditeventPractitionerPointofcare
Id: no-domain-Trustframework-Location-PractitionerPointofcare
Parent: NoBasisLocation
Title: "no-domain-Trustframework-Location-PractitionerPointofcare"
Description: """
The point of care location of auditevent health care practitioner actor (Auditevent.agent.who).
"""
* ^status = #active
//* ^version = "2.3.0"
* managingOrganization only Reference(AuditeventPractitionerPointofcareOrganization)
* managingOrganization ^short = "practitioner:point-of-care"

Profile: AuditeventPractitionerLegalentity
Id: no-domain-Trustframework-Organization-PractitionerLegalentity
Parent: NoBasisOrganization
Title: "no-domain-Trustframework-Organization-PractitionerLegalentity"
Description: """
The health care managing organization (legal entity) of the health care auditevent practitioner actor (Auditevent.agent.who).
"""
* ^status = #active
//* ^version = "2.3.0"
* identifier ^short = "practitioner:legal-entity:id, :system, :authority"
* identifier.system ^short = "practitioner:legal-entity:system"
* identifier.id ^short = "practitioner:legal-entity:id"
* identifier.assigner.display ^short = "practitioner:legal-entity:authority"
* name ^short = "practitioner:legal-entity:name"

Profile: AuditeventDepartment
Id: no-domain-Trustframework-Organization-PractitionerDepartment
Parent: NoBasisOrganization
Title: "no-domain-Trustframework-Organization-PractitionerDepartment"
Description: """
The health care department of the health care auditevent practitioner actor (Auditevent.agent.who).
"""
* ^status = #active
//* ^version = "2.3.0"
* identifier ^short = "practitioner:department:id, :system, :authority"
* identifier.system ^short = "practitioner:department:system"
* identifier.id ^short = "practitioner:department:id"
* identifier.assigner.display ^short = "practitioner:department:authority"
* name ^short = "practitioner:department:name"
* partOf only Reference(AuditeventPractitionerLegalentity)
* partOf ^short = "practitioner:legal-entity:*"

Profile: AuditEventNorwayPractitioner
Id: no-domain-Trustframework-Practitioner
Parent: NoBasisPractitioner
Title: "no-domain-Trustframework-Practitioner"
Description: """
The health care audit event practitioner actor (Auditevent.agent.who).  
"""
* ^status = #active
// * ^version = "2.3.0"
* identifier ^short = "practitioner:identifier and practitioner:hpr-nr"
* identifier.system ^short = "practitioner:identifier:system and practitioner:hpr-nr:system" 
* identifier.value ^short = "practitioner:identifier:id and practitioner:hpr-nr:id"
* identifier.assigner.display  ^short = "practitioner:identifier:authority and practitioner:hpr-nr:authority"
* name.text ^short = "practitioner:identifier:name"
* qualification.code.coding.code ^short = "practitioner:authorization:code"
* qualification.code.coding.system ^short = "practitioner:authorization:system"
* qualification.code.coding.display ^short = "practitioner:authorization:text"

Profile: AuditeventPractitionerrole
Id: no-domain-Trustframework-PractitioneRole
Parent: NoBasisPractitionerRole
Title: "no-domain-Trustframework-PractitioneRole"
Description: """
The health care practitioner auditevent actor at managing organization (Auditevent.agent.who).
"""
* ^status = #active
// * ^version = "2.3.0"
* practitioner only Reference(AuditEventNorwayPractitioner) 
* practitioner ^short = "practitioner:identifier, practitioner:hpr-nr and practitioner:authorization"
* organization only Reference(AuditeventDepartment or AuditeventPractitionerLegalentity) 
* organization ^short = "practitioner:department"
* location only Reference(AuditeventPractitionerPointofcare) 
* location ^short = "practitioner:point-of-care"

Profile:        NoDomainTrustframeworkAuditEvent
Id: no-domain-Trustframework-Auditevent
Parent:         AuditEvent
Title:          "no-domain-Trustframework-Auditevent"
Description: """
This is the main profile that describes the mapping of [Norwegian Trust Framework attributes ("Tillitsrammeverk")](https://github.com/NorskHelsenett/Tillitsrammeverk/blob/main/specs/informasjons_og_datamodell.md#424-oppsummering-av-informasjonselementer) to AuditEvent Resource.
"""
* ^status = #active
// * ^version = "2.3.0"
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