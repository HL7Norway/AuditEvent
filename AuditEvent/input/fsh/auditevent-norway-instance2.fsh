// Example input: https://github.com/NorskHelsenett/Tillitsrammeverk/blob/main/specs/informasjons_og_datamodell.md#81-eksempel-1---fastlege-ber-om-tilgang-til-dokument

Instance: PractitionerPointOfCareInstance2
InstanceOf: AuditeventPractitionerPointofcare
Usage: #inline
* managingOrganization = Reference(PractitionerLegalEntityInstance2)

Instance: PractitionerInstance2
InstanceOf: AuditEventNorwayPractitioner
Usage: #inline
* identifier[+].system  = $FNR // practitioner:identifier:system"  // TODO: Norwegian national identity number or D number - constrain?
* identifier[=].value  = "20086600138" //  "practitioner:identifier:id"
* identifier[=].assigner.display = "https://www.skatteetaten.no"  // "practitioner:identifier:authority"
* name.text = "August September" // "practitioner:identifier:name"
* identifier[+].system = $HPR // practitioner:hpr-nr:system"
* identifier[=].value =  "9144897" // "practitioner:hpr-nr:id"
* identifier[=].assigner.display = "https://www.helsedirektoratet.no/" // "practitioner:hpr-nr:authority"
* qualification.code = $VOLVEN_9060#LE "Lege" //  "practitioner:authorization:*"

Instance: PractitionerLegalEntityInstance2
InstanceOf: AuditeventPractitionerLegalentity
Usage: #inline
* identifier.system =  $ORGNR // "practitioner:legal-entity:system"
* identifier.id = "100100673" // "practitioner:legal-entity:id"
* identifier.assigner.display = "https://www.brreg.no" // "practitioner:legal-entity:authority"
* name = "Norsk Helsenett SF Fagersta Testlegekontor" // "practitioner:legal-entity:name"

Instance: PractitionerRoleInstance2
InstanceOf: AuditeventPractitionerrole
Usage: #inline
Description: "PractitionerRoleInstance1"
* active = true
* practitioner = Reference(PractitionerInstance2)
* organization = Reference(PractitionerLegalEntityInstance2)
* location = Reference(PractitionerPointOfCareInstance2)

Instance: EncounterInstance2
InstanceOf: AuditeventEncounter
Usage: #inline
//Description: 
//"""
//NB! Hvordan håndtere dette for historiske data hvis man ikke har tilgang til status eller class på kontakt (encounter)?
//"""
* status = #unknown
* class = #unknown // Not in valueset - extensible valueset
* serviceType = $VOLVEN_8655#KX17 "Fastlege, liste uten fast lege" 

//* location.location = Reference(AuditEventNorwayEncounterPointOfCareInstance2)
//* contained[+] = AuditEventNorwayEncounterServiceProviderOrganizationInstance1
//* serviceProvider = Reference(AuditEventNorwayEncounterServiceProviderOrganizationInstance1)

Instance: PatientInstance2
InstanceOf: AuditeventPatient
Usage: #inline
* identifier.id = "05076600324" // "patients:identifier:id"
* identifier.system = $FNR // "patients:identifier:system"
* identifier.assigner.display =  "https://www.skatteetaten.no" // "patients:identifier:authority"

Instance: NOBasisAuditeventInstance2
InstanceOf: NoDomainTrustframeworkAuditEvent
Title: "GP example"
Description: """
ENG: Example of GP as open document content.
NO: Eksempelet hvor en fastlege åpner dokumentinnhold.
"""
Usage: #example

* contained[+] = PractitionerInstance2
* contained[+] = PractitionerLegalEntityInstance2
* contained[+] = PractitionerPointOfCareInstance2
* contained[+] = PractitionerRoleInstance2
* contained[+] = EncounterInstance2
* contained[+] = PatientInstance2
* type = DCM#110110 "Patient Record"
* recorded = 2024-03-19T06:45:00.000Z
* action = #R
* agent[0].requestor = true
* agent[0].who = Reference(PractitionerRoleInstance2)
* extension[_encounter].valueReference = Reference(EncounterInstance2)
* extension[_patient].valueReference = Reference(PatientInstance2)
* extension[_careRelationMetaData]   
  * extension[toa].valueUnsignedInt = 1710830705 // toa  
* source.site = "server.example.com"
* source.type = http://terminology.hl7.org/CodeSystem/security-source-type#4 "Application Server"
* source.observer = Reference(Device/ex-device)
* purposeOfEvent[+].coding = $VOLVEN_8655#KX17 "Fastlege, liste uten fast lege"  // "care-relationship:purpose-of-use:*
* extension[_careRelationMetaData]   
  * extension[toa].valueUnsignedInt = 1700121037 // toa
* entity
  * what = Reference(DocumentReference)
  * type = #DocumentReference
  * name = "Document"
