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
This extension carries information about a 'user session' defined as access to health information for a patient or group where the access criteria are the same and access occurs from a single logical system within a given time window.
"""
* ^context.type = #element
* ^context.expression = "AuditEvent"
* ^status = #active
* extension contains
    decision-ref-id 1..1 and
    decision-ref-description 1..1 and
    decision-ref-user-selected 1..1 and
    toa 1..1
* extension[decision-ref-id].value[x] only string
* extension[decision-ref-id].value[x] ^short = "care_relationship:decision_ref:id"
* extension[decision-ref-description].value[x] only string
* extension[decision-ref-description].value[x] ^short = "care_relationship:decision_ref:description"
* extension[decision-ref-user-selected].value[x] only boolean
* extension[decision-ref-user-selected].value[x] ^short = "care_relationship:decision_ref:user_selected"
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
* agent.who 1..1
* purposeOfEvent ^short = "care_relationship:purpose_of_use:code, :system and :text and care_relationship:purpose_of_use_details:code, :system and :text"
* purposeOfEvent.coding.code ^short = "care_relationship:purpose_of_use:code and care_relationship:purpose_of_use_details:code"
* purposeOfEvent.coding.system ^short = "care_relationship:purpose_of_use:system and care_relationship:purpose_of_use_details:system"
* purposeOfEvent.coding.display ^short = "care_relationship:purpose_of_use:text and care_relationship:purpose_of_use_details:text"
* purposeOfEvent.coding ^slicing.discriminator.type = #value
* purposeOfEvent.coding ^slicing.discriminator.path = "$this"
* purposeOfEvent.coding ^slicing.rules = #open
* purposeOfEvent.coding contains
    PURPOSE_OF_USE_VALUESET 1..1 and  DIPS_DECISIONTEMPLATE 0..1 and VOLVEN_9151 0..1
* purposeOfEvent.coding[PURPOSE_OF_USE_VALUESET] from $PURPOSE_OF_USE_VALUESET 
* purposeOfEvent.coding[DIPS_DECISIONTEMPLATE] from $DIPS_DECISIONTEMPLATE 
* purposeOfEvent.coding[DIPS_DECISIONTEMPLATE] ^short = "DIPS Decision template terminology (see https://hl7norway.github.io/AuditEvent/currentbuild/CodeSystem-decisiontemplate.html)"
* purposeOfEvent.coding[DIPS_DECISIONTEMPLATE] ^mustSupport = false
* purposeOfEvent.coding[DIPS_DECISIONTEMPLATE] ^binding.description = "DIPS"
* purposeOfEvent.coding[VOLVEN_9151] from $VOLVEN_9151 
* purposeOfEvent.coding[VOLVEN_9151] ^short = "Volven 9151"
* purposeOfEvent.coding[VOLVEN_9151] ^definition = "Tjenestetype i helse- og omsorgstjenesten (OID=9151)"
* purposeOfEvent.coding[VOLVEN_9151] ^mustSupport = false
* purposeOfEvent.coding[VOLVEN_9151] ^binding.description = "Volven"

* extension contains 
  AuditEventEncounterExtension named _encounter 0..1 MS and
  AuditEventPatientExtension named _patient 1..1 MS and 
	AuditEventCareRelationMetaData named _careRelationMetaData 0..1 MS 
* extension[_careRelationMetaData] MS  
  * ^short = "toa, care_relationship:decision_ref:id, :description, :user_selected"
  * extension[decision-ref-id] ^short = "care_relationship:decision_ref:id"
  * extension[decision-ref-description] ^short = "care_relationship:decision_ref:description"
  * extension[decision-ref-user-selected] ^short = "care_relationship:decision_ref:user_selected"  
  * extension[toa] ^short = "toa"