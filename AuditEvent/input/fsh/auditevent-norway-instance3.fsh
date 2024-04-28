// Example input: https://github.com/NorskHelsenett/Tillitsrammeverk/blob/main/specs/informasjons_og_datamodell.md#82-eksempel-2---ansatt-i-kommune-ber-om-tilgang-til-dokument

Instance: PractitionerPointOfCareOrganizationInstance3
InstanceOf: AuditeventPractitionerPointofcareOrganization
Usage: #inline
* identifier.id = "875300342" // "practitioner:point-of-care:id"
* identifier.system = $ORGNR  //  "practitioner:point-of-care:system"
* identifier.assigner.display = "https://www.brreg.no" // "practitioner:point-of-care:authority"
* name = "MADSERUDHJEMMET" // "practitioner:point-of-care:name"

Instance: PractitionerPointOfCareInstance3
InstanceOf: AuditeventPractitionerPointofcare
Usage: #inline
* managingOrganization = Reference(PractitionerPointOfCareOrganizationInstance3)

Instance: PractitionerInstance3
InstanceOf: AuditEventNorwayPractitioner
Usage: #inline
* identifier[+].system  = $FNR // practitioner:identifier:system"  // TODO: Norwegian national identity number or D number - constrain?
* identifier[=].value  = "03117000205" //  "practitioner:identifier:id"
* identifier[=].assigner.display = "https://www.skatteetaten.no"  // "practitioner:identifier:authority"
* name.text = "Rita Lin" // "practitioner:identifier:name"
* identifier[+].system = $HPR // practitioner:hpr-nr:system"
* identifier[=].value =  "9144900" // "practitioner:hpr-nr:id"
* identifier[=].assigner.display = "https://www.helsedirektoratet.no/" // "practitioner:hpr-nr:authority"
* qualification.code = $VOLVEN_9060#LE "Lege" //  "practitioner:authorization:*

Instance: PractitionerLegalEntityInstance3
InstanceOf: AuditeventPractitionerLegalentity
Usage: #inline
* identifier.system =  $ORGNR // "practitioner:legal-entity:system"
* identifier.id = "997506499" // "practitioner:legal-entity:id"
* identifier.assigner.display = "https://www.brreg.no" // "practitioner:legal-entity:authority"
* name = "OSLO KOMMUNE HELSEETATEN" // "practitioner:legal-entity:name"

Instance: PractitionerRoleInstance3
InstanceOf: AuditeventPractitionerrole
Usage: #inline
Description: "PractitionerRoleInstance3"
* active = true
* practitioner = Reference(PractitionerInstance3)
* organization = Reference(PractitionerLegalEntityInstance3)
* location = Reference(PractitionerPointOfCareInstance3)

Instance: EncounterInstance3
InstanceOf: AuditeventEncounter
Usage: #inline
//Description: 
//"""
//NB! Hvordan håndtere dette for historiske data hvis man ikke har tilgang til status eller class på kontakt (encounter)?
//"""
* status = #unknown
* class = #unknown // Not in valueset - extensible valueset
* serviceType = $VOLVEN_8663#KP1 "Legetjeneste ved sykehjem"
 

Instance: PatientInstance3
InstanceOf: AuditeventPatient
Usage: #inline
* identifier.id = "05076600324" // "patients:identifier:id"
* identifier.system = $FNR // "patients:identifier:system"
* identifier.assigner.display =  "https://www.skatteetaten.no" // "patients:identifier:authority"

Instance: NOBasisAuditeventInstance3
InstanceOf: NOBasisAuditevent
Title: "Municipality example"
Description: """
ENG: In this example, a nursing home doctor at Madserudhjemmet needs access to a document in another organization to plan further follow-up for a patient receiving home care services from the municipality.
NO: I dette eksempelet har en sykehjemslege ved Madserudhjemmet behov for tilgang til et dokument i en annen virksomhet for å planlegge videre oppfølging av en pasient som mottar hjemmehjelpstjenester fra kommunen
"""
Usage: #example

* contained[+] = PractitionerRoleInstance3
* contained[+] = PractitionerInstance3
* contained[+] = PractitionerLegalEntityInstance3
* contained[+] = PractitionerPointOfCareInstance3
* contained[+] = PractitionerPointOfCareOrganizationInstance3
* contained[+] = EncounterInstance3
* contained[+] = PatientInstance3

* type = DCM#110110 "Patient Record"
* recorded = 2024-03-19T06:45:00.000Z
* action = #R
* agent[0].requestor = true
* agent[0].who = Reference(PractitionerRoleInstance3)
* extension[_encounter].valueReference = Reference(EncounterInstance3)
* extension[_patient].valueReference = Reference(PatientInstance3)
* extension[_careRelationMetaData]   
  * extension[decision-ref-id].valueString  =  "23423255" // "care-relationship:decision-ref:id"
  * extension[decision-ref-description].valueString = "Innlagt pasient"  // "care-relationship:decision-ref:description"
  * extension[decision-ref-user-selected].valueBoolean = false // "care-relationship:decision-ref:user-selected"
  * extension[toa].valueUnsignedInt = 1710830705 // toa  
* source.site = "server.example.com"
* source.type = http://terminology.hl7.org/CodeSystem/security-source-type#4 "Application Server"
* source.observer = Reference(Device/ex-device)
* purposeOfEvent[+].coding  = http://terminology.hl7.org/CodeSystem/v3-ActReason#COC "coordination of care"  // "care-relationship:purpose-of-use:*
* purposeOfEvent[+].coding =  $VOLVEN_9151#15 "Helsetjenester i hjemmet" // "care-relationship:purpose-of-use-details:*
* entity
  * what = Reference(DocumentReference)
  * type = #DocumentReference
  * name = "Document"


