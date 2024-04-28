ValueSet: NO_basis_encounter_auditevent_servicetype
Id: no-basis-encounter-auditevent-servicetype
Title: "AuditEvent encounter.servicetype valueset"
Description: """
Valueset for Encounter.serviceType used in context of auditevent. See [volven.no](https://volven.no/) or [FinnKode](https://beta.finnkode.ehelse.no/adm/collections) for definition.
"""
* include codes from system $VOLVEN_8655
* include codes from system $VOLVEN_8663
* include codes from system $VOLVEN_8451

ValueSet: NO_basis_auditevent_purpose_of_event
Id: no-basis-auditevent-purpose-of-event
Title: "PurposeOfEvent valueset"
Description: """
Valueset for AuditEvent.purposeOfEvent valueset used in context of no-basis-auditevent. Volven.no code systems (urn:oid:2.16.578.1.12.4.1.1.x) are defined [here](https://volven.no/) or [FinnKode](https://beta.finnkode.ehelse.no/adm/collections)
"""
* include codes from valueset http://terminology.hl7.org/ValueSet/v3-PurposeOfUse
* include codes from system DIPSDecisionTemplate
* include codes from system $VOLVEN_9151

