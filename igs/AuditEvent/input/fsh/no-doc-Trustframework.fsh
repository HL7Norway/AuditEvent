Profile: AuditeventEncounterServiceproviderOrganization
Id: no-doc-Trustframework-Organization-EncounterServiceprovider
Parent: NoBasisOrganization
Title: "no-doc-Trustframework-Organization-EncounterServiceprovider"
Description: "The service provider department of auditevent encounter (Auditevent._encounter)."
* ^status = #active
* identifier ^short = "patients:department:id, :system and :authority"
* identifier.id ^short = "patients:department:id"
* identifier.system ^short = "patients:department:system"
* identifier.assigner.display ^short = "patients:department:authority"
* name ^short = "patients:department:name"

Profile: AuditeventEncounterPointofcareOrganization
Id: no-doc-Trustframework-Organization-EncounterPointofcare
Parent: NoBasisOrganization
Title: "no-doc-Trustframework-Organization-EncounterPointofcare"
Description: "The point of care managing organization of the auditevent encounter (Auditevent._encounter)"
* ^status = #active
* identifier ^short = "patients:point_of_care_patient:id, :system and :authority"
* identifier.id ^short = "patients:point_of_care_patient:id"
* identifier.system ^short = "patients:point_of_care_patient:system"
* identifier.assigner.display ^short = "patients:point_of_care_patient:authority"
* name ^short = "patients:point_of_care_patient:name"


Profile: AuditeventEncounterPointofcare
Id: no-doc-Trustframework-Location-EncounterPointofcare
Parent: NoBasisLocation
Title: "no-doc-Trustframework-Location-EncounterPointofcare"
Description: """
The point of care location of auditevent encounter (Auditevent._encounter).
"""
* ^status = #active
* managingOrganization ^short = "patients:point_of_care_patient:*"
* managingOrganization only Reference(AuditeventEncounterPointofcareOrganization)

Profile: AuditeventPatient
Id: no-doc-Trustframework-Patient
Parent: NoBasisPatient
Title: "no-doc-Trustframework-Patient"
Description: """
The patient (patients:identifier) that is the subject of the auditevent activity if any (Auditevent._patient).

NOTE! Single auditevent per patient, i.e. need to duplicate auditevent for each patient in list.
"""
* ^status = #active
* identifier ^short = "patients:identifier:id, :system and :authority"
* identifier.id ^short = "patients:identifier:id"
* identifier.system ^short = "patients:identifier:system"
* identifier.assigner.display ^short = "patients:identifier:authority"
* name ^short = "patients:identifier:name"

Profile: AuditeventPractitionerPointofcareOrganization
Id: no-doc-Trustframework-Organization-PractitionerPointofcare
Parent: NoBasisOrganization
Title: "no-doc-Trustframework-Organization-PractitionerPointofcare"
Description: """
The point of care managing organization of auditevent health care practitioner actor (Auditevent.agent.who).
"""
* ^status = #active
* identifier ^short = "practitioner:point_of_care:id, :system, :authority"
* identifier.id ^short = "practitioner:point_of_care:id"
* identifier.system ^short = "practitioner:point_of_care:system"
* identifier.assigner.display ^short = "practitioner:point_of_care:authority"
* name ^short = "practitioner:point_of_care:name"

Profile: AuditeventPractitionerPointofcare
Id: no-doc-Trustframework-Location-PractitionerPointofcare
Parent: NoBasisLocation
Title: "no-doc-Trustframework-Location-PractitionerPointofcare"
Description: """
The point of care location of auditevent health care practitioner actor (Auditevent.agent.who).
"""
* ^status = #active
* managingOrganization only Reference(AuditeventPractitionerPointofcareOrganization)
* managingOrganization ^short = "practitioner:point_of_care"

Profile: AuditeventPractitionerLegalentity
Id: no-doc-Trustframework-Organization-PractitionerLegalentity
Parent: NoBasisOrganization
Title: "no-doc-Trustframework-Organization-PractitionerLegalentity"
Description: """
The health care managing organization (legal entity) of the health care auditevent practitioner actor (Auditevent.agent.who).
"""
* ^status = #active
* identifier ^short = "practitioner:legal_entity:id, :system, :authority"
* identifier.system ^short = "practitioner:legal_entity:system"
* identifier.id ^short = "practitioner:legal_entity:id"
* identifier.assigner.display ^short = "practitioner:legal_entity:authority"
* name ^short = "practitioner:legal_entity:name"

Profile: AuditeventDepartment
Id: no-doc-Trustframework-Organization-PractitionerDepartment
Parent: NoBasisOrganization
Title: "no-doc-Trustframework-Organization-PractitionerDepartment"
Description: """
The health care department of the health care auditevent practitioner actor (Auditevent.agent.who).
"""
* ^status = #active
* identifier ^short = "practitioner:department:id, :system, :authority"
* identifier.system ^short = "practitioner:department:system"
* identifier.id ^short = "practitioner:department:id"
* identifier.assigner.display ^short = "practitioner:department:authority"
* name ^short = "practitioner:department:name"
* partOf only Reference(AuditeventPractitionerLegalentity)
* partOf ^short = "practitioner:legal_entity:*"

Profile: AuditEventNorwayPractitioner
Id: no-doc-Trustframework-Practitioner
Parent: NoBasisPractitioner
Title: "no-doc-Trustframework-Practitioner"
Description: """
The health care audit event practitioner actor (Auditevent.agent.who).  
"""
* ^status = #active
* identifier ^short = "practitioner:identifier and practitioner:hpr_nr"
* identifier.system ^short = "practitioner:identifier:system and practitioner:hpr_nr:system" 
* identifier.value ^short = "practitioner:identifier:id and practitioner:hpr_nr:id"
* identifier.assigner.display  ^short = "practitioner:identifier:authority and practitioner:hpr_nr:authority"
* name.text ^short = "practitioner:identifier:name"
* qualification.code.coding.code ^short = "practitioner:authorization:code"
* qualification.code.coding.system ^short = "practitioner:authorization:system"
* qualification.code.coding.display ^short = "practitioner:authorization:text"

Profile: AuditeventPractitionerrole
Id: no-doc-Trustframework-PractitioneRole
Parent: NoBasisPractitionerRole
Title: "no-doc-Trustframework-PractitioneRole"
Description: """
The health care practitioner auditevent actor at managing organization (Auditevent.agent.who).
"""
* ^status = #active
* practitioner only Reference(AuditEventNorwayPractitioner) 
* practitioner ^short = "practitioner:identifier, practitioner:hpr_nr and practitioner:authorization"
* organization only Reference(AuditeventDepartment or AuditeventPractitionerLegalentity) 
* organization ^short = "practitioner:department"
* location only Reference(AuditeventPractitionerPointofcare) 
* location ^short = "practitioner:point_of_care"