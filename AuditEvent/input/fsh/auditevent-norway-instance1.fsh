// Example input: https://github.com/NorskHelsenett/Tillitsrammeverk/blob/main/specs/informasjons_og_datamodell.md#83-eksempel-3---helsepersonell-i-foretak-ber-om-tilgang-til-dokument

Instance: PractitionerPointOfCareOrganizationInstance1
InstanceOf: AuditeventPractitionerPointofcareOrganization
Usage: #inline
* identifier.id = "874716782" // "practitioner:point-of-care:id"
* identifier.system = $ORGNR  //  "practitioner:point-of-care:system"
* identifier.assigner.display = "https://www.brreg.no" // "practitioner:point-of-care:authority"
* name = "OSLO UNIVERSITETSSYKEHUS HF RIKSHOSPITALET - SOMATIKK" // "practitioner:point-of-care:name"

Instance: PractitionerPointOfCareInstance1
InstanceOf: AuditeventPractitionerPointofcare
Usage: #inline
* managingOrganization = Reference(PractitionerPointOfCareOrganizationInstance1)

Instance: PractitionerInstance1
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

Instance: PractitionerLegalEntityInstance1
InstanceOf: AuditeventPractitionerLegalentity
Usage: #inline
* identifier.system =  $ORGNR // "practitioner:legal-entity:system"
* identifier.id = "993467049" // "practitioner:legal-entity:id"
* identifier.assigner.display = "https://www.brreg.no" // "practitioner:legal-entity:authority"
* name = "Oslo universitetssykehus HF" // "practitioner:legal-entity:name"

Instance: PractitionerDepartment1
InstanceOf: AuditeventDepartment
Usage: #inline
* identifier.system = $RESHID // "practitioner:department:system"
* identifier.id = "705592" // "practitioner:department:id"
* identifier.assigner.display = "https://www.nhn.no" // "practitioner:department:authority"
* name = "Anestesiologi Seksjon RH" // "practitioner:department:name"
* partOf = Reference(PractitionerLegalEntityInstance1)

Instance: PractitionerRoleInstance1
InstanceOf: AuditeventPractitionerrole
Usage: #inline
Description: "PractitionerRoleInstance1"
* active = true
* practitioner = Reference(PractitionerInstance1)
* organization = Reference(PractitionerDepartment1)
* location = Reference(PractitionerPointOfCareInstance1)

Instance: EncounterPointOfCareOrganizationInstance1
InstanceOf: AuditeventEncounterPointofcareOrganization
Usage: #inline
* identifier.id = "974589095" // "patients:point_of_care_patient:id"
* identifier.system = $ORGNR // "patients:point_of_care_patient:system"
* identifier.assigner.display = "https://www.brreg.no" // "patients:point_of_care_patient:authority"
* name = "OSLO UNIVERSITETSSYKEHUS HF ULLEVÅL - SOMATIKK" // "patients:point_of_care_patient:name"

Instance: EncounterPointOfCareInstance1
InstanceOf: AuditeventEncounterPointofcare
Usage: #inline
* managingOrganization = Reference(EncounterPointOfCareOrganizationInstance1)

Instance: EncounterServiceProviderOrganizationInstance1
InstanceOf: AuditeventEncounterServiceproviderOrganization
Usage: #inline
* identifier.id = "109765" //  "patients:department:id"
* identifier.system = $RESHID // "patients:department:system"
* identifier.assigner.display = "https://www.nhn.no" // "patients:department:authority"
* name = "Øye dagkir/pol 1. etasje" //  "patients:department:name"

Instance: EncounterInstance1
InstanceOf: AuditeventEncounter
Usage: #inline
//Description: 
//"""
//NB! Hvordan håndtere dette for historiske data hvis man ikke har tilgang til status eller class på kontakt (encounter)?
//"""
* status = #unknown
* class = #unknown // Not in valueset - extensible valueset
* location.location = Reference(EncounterPointOfCareInstance1)
* serviceProvider = Reference(EncounterServiceProviderOrganizationInstance1)
* serviceType.coding = $VOLVEN_8655#S03 "Indremedisin"


Instance: PatientInstance1
InstanceOf: AuditeventPatient
Usage: #inline
* identifier.id = "05076600324" // "patients:identifier:id"
* identifier.system = $FNR // "patients:identifier:system"
* identifier.assigner.display =  "https://www.skatteetaten.no" // "patients:identifier:authority"

Instance: NOBasisAuditeventInstance1
InstanceOf: NoDomainTrustframeworkAuditEvent
Title: "Hospital example"
Description: """
ENG: In this example, an anesthesiologist formally associated with Rikshospitalet is preparing to administer anesthesia to a patient undergoing eye surgery at Ullevål Hospital. The anesthesiologist needs access to read documents from previous practitioners in other institutions to determine which substances were used during prior anesthesia, as the patient reports experiencing allergic reactions.
NO: I dette eksempelet skal en anestesilege som formelt tilhører Rikshospitalet forberede seg på å gi anestesi til en pasient som er inne for en øyeoperasjon ved Ullevål sykehus, og anestesilegen trenger derfor tilgang til å lese dokumenter fra tidligere behandlere i andre virksomheter for å finne ut hvilke virkestoffer som ble brukt under tidligere anestesi som pasienten rapporterer medførte allergiske reaksjoner
"""
Usage: #example

* contained[+] = PractitionerInstance1
* contained[+] = PractitionerRoleInstance1
* contained[+] = PractitionerLegalEntityInstance1
* contained[+] = PractitionerDepartment1
* contained[+] = PractitionerPointOfCareInstance1
* contained[+] = PractitionerPointOfCareOrganizationInstance1
* contained[+] = EncounterInstance1
* contained[+] = EncounterPointOfCareInstance1
* contained[+] = EncounterServiceProviderOrganizationInstance1
* contained[+] = EncounterPointOfCareOrganizationInstance1
* contained[+] = PatientInstance1

* type = DCM#110110 "Patient Record"
* recorded = 2024-03-19T06:45:00.000Z
* action = #R
* agent[0].requestor = true
* agent[0].who = Reference(PractitionerRoleInstance1)
* extension[_encounter].valueReference = Reference(EncounterInstance1)
* extension[_patient].valueReference = Reference(PatientInstance1)
* extension[_careRelationMetaData]   
  * extension[decision-ref-id].valueString  =  "23423255" // "care-relationship:decision-ref:id"
  * extension[decision-ref-description].valueString = "Innlagt pasient"  // "care-relationship:decision-ref:description"
  * extension[decision-ref-user-selected].valueBoolean = false // "care-relationship:decision-ref:user-selected"
  * extension[toa].valueUnsignedInt = 1710830705 // toa
* source.site = "server.example.com"
* source.type = http://terminology.hl7.org/CodeSystem/security-source-type#4 "Application Server"
* source.observer = Reference(Device/ex-device)
* purposeOfEvent[+].coding = http://terminology.hl7.org/CodeSystem/v3-ActReason#TREAT "Treatment"    // "care-relationship:purpose-of-use:*
* purposeOfEvent[+].coding = $DIPS_DECISIONTEMPLATE#POLBESOK "Poliklinisk besøk" // "care-relationship:purpose-of-use-details:*
* entity
  * what = Reference(Bundle/Documentlist)
  * type = #Bundle
  * name = "Document list"