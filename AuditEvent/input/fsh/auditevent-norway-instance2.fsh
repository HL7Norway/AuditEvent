// Example input: https://github.com/NorskHelsenett/Tillitsrammeverk/blob/main/specs/informasjons_og_datamodell.md#81-eksempel-1---fastlege-ber-om-tilgang-til-dokument

Instance: AuditEventNorwayPractitionerPointOfCareInstance2
InstanceOf: AuditEventNorwayPractitionerPointOfCare
Usage: #inline
* contained[+] = AuditEventNorwayPractitionerLegalEntityInstance2
* managingOrganization = Reference(AuditEventNorwayPractitionerLegalEntityInstance2)

Instance: AuditEventNorwayPractitionerInstance2
InstanceOf: AuditEventNorwayPractitioner
Usage: #inline
* identifier[+].system  = $FNR // practitioner:identifier:system"  // TODO: Norwegian national identity number or D number - constrain?
* identifier[=].value  = "20086600138" //  "practitioner:identifier:id"
* identifier[=].assigner.display = "https://www.skatteetaten.no"  // "practitioner:identifier:authority"
* identifier[=].type = #FNR
* name.text = "August September" // "practitioner:identifier:name"
* identifier[+].system = $HPR // practitioner:hpr-nr:system"
* identifier[=].value =  "9144897" // "practitioner:hpr-nr:id"
* identifier[=].assigner.display = "https://www.helsedirektoratet.no/" // "practitioner:hpr-nr:authority"
* identifier[=].type = #HPR
* qualification.code.coding.code = #LE //  "practitioner:authorization:code"
* qualification.code.coding.system =   $KAT_HELSEPERSONELL // "practitioner:authorization:system"
* qualification.code.coding.display = "Lege" // "practitioner:authorization:text"
// * qualification.code.extension[_assigner].valueString = "https://www.helsedirektoratet.no/"  // "practitioner:authorization:assigner"  

Instance: AuditEventNorwayPractitionerLegalEntityInstance2
InstanceOf: AuditEventNorwayPractitionerLegalEntity
Usage: #inline
* identifier.system =  $ORGNR // "practitioner:legal-entity:system"
* identifier.id = "100100673" // "practitioner:legal-entity:id"
* identifier.assigner.display = "https://www.brreg.no" // "practitioner:legal-entity:authority"
* name = "Norsk Helsenett SF Fagersta Testlegekontor" // "practitioner:legal-entity:name"

Instance: AuditEventNorwayPractitionerRoleInstance2
InstanceOf: AuditEventNorwayPractitionerRole
Usage: #inline
Description: "AuditEventNorwayPractitionerRoleInstance1"
* active = true
* contained[+] = AuditEventNorwayPractitionerInstance2
* practitioner = Reference(AuditEventNorwayPractitionerInstance2)
* contained[+] = AuditEventNorwayPractitionerLegalEntityInstance2
* organization = Reference(AuditEventNorwayPractitionerLegalEntityInstance2)
* contained[+] = AuditEventNorwayPractitionerPointOfCareInstance2
* location = Reference(AuditEventNorwayPractitionerPointOfCareInstance2)

Instance: AuditEventNorwayEncounterInstance2
InstanceOf: AuditEventNorwayEncounter
Usage: #inline
//Description: 
//"""
//NB! Hvordan håndtere dette for historiske data hvis man ikke har tilgang til status eller class på kontakt (encounter)?
//"""
* status = #unknown
* class = #unknown // Not in valueset - extensible valueset
* contained[+] = AuditEventNorwayEncounterPointOfCareInstance1
* location.location = Reference(AuditEventNorwayEncounterPointOfCareInstance1)
//* contained[+] = AuditEventNorwayEncounterServiceProviderOrganizationInstance1
//* serviceProvider = Reference(AuditEventNorwayEncounterServiceProviderOrganizationInstance1)

Instance: AuditEventNorwayPatientInstance2
InstanceOf: NOBasisAuditeventPatient
Usage: #inline
* identifier.id = "05076600324" // "patients:identifier:id"
* identifier.system = $FNR // "patients:identifier:system"
* identifier.assigner.display =  "https://www.skatteetaten.no" // "patients:identifier:authority"

Instance: NOBasisAuditeventInstance2
InstanceOf: NOBasisAuditevent
Title: "GP example"
Description: """
ENG: Example of GP as open document content.
NO: Eksempelet hvor en fastlege åpner dokumentinnhold.
"""
Usage: #example

* type = DCM#110110 "Patient Record"
* recorded = 2021-03-15T09:49:00.000Z
* action = #R

* agent[0].requestor = true
* contained[+] = AuditEventNorwayPractitionerRoleInstance2
* agent[0].who = Reference(AuditEventNorwayPractitionerRoleInstance2)

* contained[+] = AuditEventNorwayEncounterInstance2
* extension[_encounter].valueReference = Reference(AuditEventNorwayEncounterInstance2)

* contained[+] = AuditEventNorwayPatientInstance2
* extension[_patient].valueReference = Reference(AuditEventNorwayPatientInstance2)

* source.site = "server.example.com"
* source.type = http://terminology.hl7.org/CodeSystem/security-source-type#4 "Application Server"
* source.observer = Reference(Device/ex-device)
 
* purposeOfEvent.coding[+].code = #KX17  // "care-relationship:purpose-of-use:code" 
* purposeOfEvent.coding[=].system = "urn:oid:2.16.578.1.12.4.1.1.8655" // "care-relationship:purpose-of-use:system"
* purposeOfEvent.coding[=].display = "Fastlege, liste uten fast lege"  // "care-relationship:purpose-of-use:text"

* entity
  * what = Reference(DocumentReference)
  * type = #DocumentReference
  * name = "Document"
