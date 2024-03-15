Extension: AuditEventPatientExtension
Title: "AuditEventPatientExtension"
Description: "Extension that extends FHIR AuditEvent R4 with en Patient reference which was introduced in FHIR AuditEvent R5"
* ^context.type = #element
* ^context.expression = "AuditEvent"
* value[x] only Reference(NOBasisAuditeventPatient)