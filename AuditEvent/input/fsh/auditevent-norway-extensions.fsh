Extension: AuditEventEncounterExtension
Title: "AuditEventEncounterExtension"
Description: "Extension that extends FHIR AuditEvent R4 with Encounter reference which was introduced in FHIR AuditEvent R5"
* ^context.type = #element
* ^context.expression = "AuditEvent"
* value[x] only Reference(AuditeventEncounter)

Extension: AuditEventPatientExtension
Title: "AuditEventPatientExtension"
Description: "Extension that extends FHIR AuditEvent R4 with en Patient reference which was introduced in FHIR AuditEvent R5"
* ^context.type = #element
* ^context.expression = "AuditEvent"
* value[x] only Reference(AuditeventPatient)

Extension: CareRelationMetaData
Title: "AuditEventCareRelationMetaData"
Description: """
This extension is used to carry attributes from Norwegian Trust Framework (Nasjonalt tillitsrammeverk) which there exists no natural element for.
"""
* ^context.type = #element
* ^context.expression = "AuditEvent"
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
