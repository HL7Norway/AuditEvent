// Example input: https://github.com/NorskHelsenett/Tillitsrammeverk/blob/main/specs/informasjons_og_datamodell.md#82-eksempel-2---ansatt-i-kommune-ber-om-tilgang-til-dokument

Instance: PractitionerPointOfCareOrganizationInstance3
InstanceOf: AuditEventNorwayPractitionerPointOfCareOrganization
Usage: #inline
* identifier.id = "875300342" // "practitioner:point-of-care:id"
* identifier.system = $ORGNR  //  "practitioner:point-of-care:system"
* identifier.assigner.display = "https://www.brreg.no" // "practitioner:point-of-care:authority"
* name = "MADSERUDHJEMMET" // "practitioner:point-of-care:name"

Instance: PractitionerPointOfCareInstance3
InstanceOf: AuditEventNorwayPractitionerPointOfCare
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
* qualification.code.coding.code = #LE //  "practitioner:authorization:code"
* qualification.code.coding.system =   $VOLVEN_9060 // "practitioner:authorization:system"
* qualification.code.coding.display = "Lege" // "practitioner:authorization:text"
// * qualification.code.extension[_assigner].valueString = "https://www.helsedirektoratet.no/"  // "practitioner:authorization:assigner"  

Instance: PractitionerLegalEntityInstance3
InstanceOf: AuditEventNorwayPractitionerLegalEntity
Usage: #inline
* identifier.system =  $ORGNR // "practitioner:legal-entity:system"
* identifier.id = "997506499" // "practitioner:legal-entity:id"
* identifier.assigner.display = "https://www.brreg.no" // "practitioner:legal-entity:authority"
* name = "OSLO KOMMUNE HELSEETATEN" // "practitioner:legal-entity:name"

Instance: PractitionerRoleInstance3
InstanceOf: AuditEventNorwayPractitionerRole
Usage: #inline
Description: "PractitionerRoleInstance3"
* active = true
* practitioner = Reference(PractitionerInstance3)
* organization = Reference(PractitionerLegalEntityInstance3)
* location = Reference(PractitionerPointOfCareInstance3)

Instance: EncounterInstance3
InstanceOf: AuditEventNorwayEncounter
Usage: #inline
//Description: 
//"""
//NB! Hvordan håndtere dette for historiske data hvis man ikke har tilgang til status eller class på kontakt (encounter)?
//"""
* status = #unknown
* class = #unknown // Not in valueset - extensible valueset
* serviceType.coding.system = "urn:oid:2.16.578.1.12.4.1.1.8663"
* serviceType.coding.code = #KP1
* serviceType.coding.display = "Legetjeneste ved sykehjem"
  

Instance: PatientInstance3
InstanceOf: NOBasisAuditeventPatient
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
* recorded = 2021-03-15T09:49:00.000Z
* action = #R
* agent[0].requestor = true
* agent[0].who = Reference(PractitionerRoleInstance3)
* extension[_encounter].valueReference = Reference(EncounterInstance3)
* extension[_patient].valueReference = Reference(PatientInstance3)
* extension[_careRelationMetaData]   
  * extension[decision-ref-id].valueString  =  "23423255" // "care-relationship:decision-ref:id"
  * extension[decision-ref-description].valueString = "Innlagt pasient"  // "care-relationship:decision-ref:description"
  * extension[decision-ref-user-selected].valueBoolean = false // "care-relationship:decision-ref:user-selected"
  * extension[toa].valueUnsignedInt = 1700121037 // toa  
* source.site = "server.example.com"
* source.type = http://terminology.hl7.org/CodeSystem/security-source-type#4 "Application Server"
* source.observer = Reference(Device/ex-device)
* purposeOfEvent.coding[+].code = #COC  // "care-relationship:purpose-of-use:code" 
* purposeOfEvent.coding[=].system = "urn:oid:2.16.840.1.113883.1.11.20448" // "care-relationship:purpose-of-use:system"
* purposeOfEvent.coding[=].display = "COC"  // "care-relationship:purpose-of-use:text"
* purposeOfEvent.coding[+].code = #15  // "care-relationship:purpose-of-use-details:code"
* purposeOfEvent.coding[=].system = "urn:oid:2.16.578.1.12.4.1.1.9151" // "care-relationship:purpose-of-use-details:system"
* purposeOfEvent.coding[=].display = "Helsetjenester i hjemmet"  // "care-relationship:purpose-of-use-details:text"
* entity
  * what = Reference(DocumentReference)
  * type = #DocumentReference
  * name = "Document"


