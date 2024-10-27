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
