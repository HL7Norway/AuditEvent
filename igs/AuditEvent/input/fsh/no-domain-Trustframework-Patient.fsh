Profile: AuditeventPatient
Id: no-domain-Trustframework-Patient
Parent: NoBasisPatient
Title: "no-domain-Trustframework-Patient"
Description: """
The patient (patients:identifier) that is the subject of the auditevent activity if any (Auditevent._patient).

NOTE! Single auditevent per patient, i.e. need to duplicate auditevent for each patient in list.
"""
* ^status = #active
* identifier ^short = "patients:identifier:id, :system and :authority"
* identifier.id ^short = "patients:identifier:id"
* identifier.system ^short = "patients:identifier:system"
* identifier.assigner.display ^short = "patients:identifier:authority"
* identifier 1..*
* name ^short = "patients:identifier:name"