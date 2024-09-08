ValueSet: NO_basis_auditevent_purpose_of_event
Id: no-basis-auditevent-purpose-of-event
Title: "PurposeOfEvent valueset"
Description: """
Valueset for AuditEvent.purposeOfEvent valueset used in context of no-basis-auditevent. Volven.no code systems (urn:oid:2.16.578.1.12.4.1.1.x) are defined [here](https://volven.no/) or [FinnKode](https://beta.finnkode.ehelse.no/adm/collections)
"""
* ^status = #active
* include codes from valueset http://terminology.hl7.org/ValueSet/v3-PurposeOfUse
* include codes from system DIPSDecisionTemplate
* include codes from system $VOLVEN_9151

Extension: AuditEventEncounterExtension
Id: auditevent-encounter-extension
Title: "AuditEventEncounterExtension"
Description: "Extension that extends FHIR AuditEvent R4 with Encounter reference which was introduced in FHIR AuditEvent R5"
* ^context.type = #element
* ^context.expression = "AuditEvent"
* ^status = #active
* value[x] only Reference(AuditeventEncounter)

Extension: AuditEventPatientExtension
Id: auditevent-patient-extension
Title: "AuditEventPatientExtension"
Description: "Extension that extends FHIR AuditEvent R4 with en Patient reference which was introduced in FHIR AuditEvent R5"
* ^context.type = #element
* ^context.expression = "AuditEvent"
* ^status = #active
* value[x] only Reference(AuditeventPatient)

Extension: AuditEventCareRelationMetaData
Id: auditevent-carerelation-metadata-extension
Title: "AuditEventCareRelationMetaData"
Description: """
This extension is used to carry attributes from Norwegian Trust Framework (Nasjonalt tillitsrammeverk) which there exists no natural element for.
"""
* ^context.type = #element
* ^context.expression = "AuditEvent"
* ^status = #active
* extension contains
    decision-ref-id 0..1 and
    decision-ref-description 0..1 and
    decision-ref-user-selected 0..1 and
    toa 1..1
* extension[decision-ref-id].value[x] only string
* extension[decision-ref-id].value[x] ^short = "care-relationship:decision-ref:id"
* extension[decision-ref-description].value[x] only string
* extension[decision-ref-description].value[x] ^short = "care-relationship:decision-ref:description"
* extension[decision-ref-user-selected].value[x] only boolean
* extension[decision-ref-user-selected].value[x] ^short = "care-relationship:decision-ref:user-selected"
* extension[toa].value[x] only unsignedInt // valueInteger64 only in R5
* extension[toa].value[x] ^short = "toa"

Profile:        NoDomainTrustframeworkAuditEvent
Id: no-domain-Trustframework-Auditevent
Parent:         AuditEvent
Title:          "no-domain-Trustframework-Auditevent"
Description: """
This is the main profile that describes the mapping of [Norwegian Trust Framework attributes ("Tillitsrammeverk")](https://github.com/NorskHelsenett/Tillitsrammeverk/blob/main/specs/informasjons_og_datamodell.md#424-oppsummering-av-informasjonselementer) to AuditEvent Resource.
"""
* ^status = #active
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