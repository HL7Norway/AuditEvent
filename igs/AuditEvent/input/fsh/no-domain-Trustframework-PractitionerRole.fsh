Profile: AuditeventPractitionerrole
Id: no-domain-Trustframework-PractitioneRole
Parent: NoBasisPractitionerRole
Title: "no-domain-Trustframework-PractitioneRole"
Description: """
The health care practitioner auditevent actor at managing organization (Auditevent.agent.who).

NOTE! The organization element reference either a department that again references a legal entity as the top level (hierarchy) or legal entity directly. Small organizations, like GPs, the organization element will reference the GP's own business (legal entity), 
but a clinician working in hospital will reference a department that again references its hospital (legal entity).

"""
* ^status = #active
* practitioner only Reference(AuditEventNorwayPractitioner) 
* practitioner 1..1
* practitioner ^short = "practitioner:identifier, practitioner:hpr_nr and practitioner:authorization"
* organization only Reference(AuditeventDepartment or AuditeventPractitionerLegalentity) 
* organization ^short = "practitioner:department XOR practitioner:legal_entity"
* organization 1..1
* location only Reference(AuditeventPractitionerPointofcare) 
* location ^short = "practitioner:point_of_care"
* location 1..1