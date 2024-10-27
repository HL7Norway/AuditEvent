Profile: AuditeventEncounter
Id: no-domain-Trustframework-Encounter
Parent: Encounter
Title: "no-domain-Trustframework-Encounter"
Description: """
The encounter associated with auditevent if any (Auditevent._encounter).
"""
* ^status = #active
* serviceType ^short = "care_relation:healthcare_service:*"
* serviceType.coding.code ^short = "care_relation:healthcare_service:code"
* serviceType.coding.system ^short = "care_relation:healthcare_service:system"
* serviceType.coding.display ^short = "care_relation:healthcare_service:text"
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