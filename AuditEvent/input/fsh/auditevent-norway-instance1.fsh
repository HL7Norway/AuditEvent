// Example input: https://github.com/NorskHelsenett/Tillitsrammeverk/blob/main/specs/informasjons_og_datamodell.md#83-eksempel-3---helsepersonell-i-foretak-ber-om-tilgang-til-dokument

Instance: AuditEventNorwayPractitionerPointOfCareOrganizationInstance1
InstanceOf: AuditEventNorwayPractitionerPointOfCareOrganization
Usage: #inline
* identifier.id = "874716782" // "practitioner:point-of-care:id"
* identifier.system = $ORGNR  //  "practitioner:point-of-care:system"
* identifier.assigner.display = "https://www.brreg.no" // "practitioner:point-of-care:authority"
* name = "OSLO UNIVERSITETSSYKEHUS HF RIKSHOSPITALET - SOMATIKK" // "practitioner:point-of-care:name"

Instance: AuditEventNorwayPractitionerPointOfCareInstance1
InstanceOf: AuditEventNorwayPractitionerPointOfCare
Usage: #inline
* contained[+] = AuditEventNorwayPractitionerPointOfCareOrganizationInstance1
* managingOrganization = Reference(AuditEventNorwayPractitionerPointOfCareOrganizationInstance1)

Instance: AuditEventNorwayPractitionerInstance1
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
//* extension[_HPRNumber]  // In other words: attribute exists, it must be mapped
//  * valueIdentifier.system =  $HPR // practitioner:hpr-nr:system"
//  * valueIdentifier.value =  "9144897" // "practitioner:hpr-nr:id"
//  * valueIdentifier.assigner.display = "https://www.helsedirektoratet.no/" // "practitioner:hpr-nr:authority"

Instance: AuditEventNorwayPractitionerLegalEntityInstance1
InstanceOf: AuditEventNorwayPractitionerLegalEntity
Usage: #inline
* identifier.system =  $ORGNR // "practitioner:legal-entity:system"
* identifier.id = "993467049" // "practitioner:legal-entity:id"
* identifier.assigner.display = "https://www.brreg.no" // "practitioner:legal-entity:authority"
* name = "Oslo universitetssykehus HF" // "practitioner:legal-entity:name"

Instance: AuditEventNorwayPractitionerRoleInstance1
InstanceOf: AuditEventNorwayPractitionerRole
Usage: #inline
Description: "AuditEventNorwayPractitionerRoleInstance1"
* active = true
* contained[+] = AuditEventNorwayPractitionerInstance1
* practitioner = Reference(AuditEventNorwayPractitionerInstance1)
* contained[+] = AuditEventNorwayPractitionerLegalEntityInstance1
* organization = Reference(AuditEventNorwayPractitionerLegalEntityInstance1)
* contained[+] = AuditEventNorwayPractitionerPointOfCareInstance1
* location = Reference(AuditEventNorwayPractitionerPointOfCareInstance1)

Instance: AuditEventNorwayEncounterPointOfCareOrganizationInstance1
InstanceOf: AuditEventNorwayEncounterPointOfCareOrganization
Usage: #inline
* identifier.id = "974589095" // "patients:point_of_care_patient:id"
* identifier.system = $ORGNR // "patients:point_of_care_patient:system"
* identifier.assigner.display = "https://www.brreg.no" // "patients:point_of_care_patient:authority"
* name = "OSLO UNIVERSITETSSYKEHUS HF ULLEVÅL - SOMATIKK" // "patients:point_of_care_patient:name"

Instance: AuditEventNorwayEncounterPointOfCareInstance1
InstanceOf: AuditEventNorwayEncounterPointOfCare
Usage: #inline
* contained[+] = AuditEventNorwayEncounterPointOfCareOrganizationInstance1
* managingOrganization = Reference(AuditEventNorwayEncounterPointOfCareOrganizationInstance1)

Instance: AuditEventNorwayEncounterServiceProviderOrganizationInstance1
InstanceOf: AuditEventNorwayEncounterServiceProviderOrganization
Usage: #inline
* identifier.id = "109765" //  "patients:department:id"
* identifier.system = $RESHID // "patients:department:system"
* identifier.assigner.display = "https://www.nhn.no" // "patients:department:authority"
* name = "Øye dagkir/pol 1. etasje" //  "patients:department:name"

Instance: AuditEventNorwayEncounterInstance1
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
* contained[+] = AuditEventNorwayEncounterServiceProviderOrganizationInstance1
* serviceProvider = Reference(AuditEventNorwayEncounterServiceProviderOrganizationInstance1)
* serviceType.coding.system = "urn:oid:2.16.578.1.12.4.1.1.8655"
* serviceType.coding.code = #S03
* serviceType.coding.display = "Indremedisin"


Instance: AuditEventNorwayPatientInstance1
InstanceOf: NOBasisAuditeventPatient
Usage: #inline
* identifier.id = "05076600324" // "patients:identifier:id"
* identifier.system = $FNR // "patients:identifier:system"
* identifier.assigner.display =  "https://www.skatteetaten.no" // "patients:identifier:authority"

Instance: NOBasisAuditeventInstance1
InstanceOf: NOBasisAuditevent
Title: "Hospital example"
Description: """
ENG: In this example, an anesthesiologist formally associated with Rikshospitalet is preparing to administer anesthesia to a patient undergoing eye surgery at Ullevål Hospital. The anesthesiologist needs access to read documents from previous practitioners in other institutions to determine which substances were used during prior anesthesia, as the patient reports experiencing allergic reactions.
NO: I dette eksempelet skal en anestesilege som formelt tilhører Rikshospitalet forberede seg på å gi anestesi til en pasient som er inne for en øyeoperasjon ved Ullevål sykehus, og anestesilegen trenger derfor tilgang til å lese dokumenter fra tidligere behandlere i andre virksomheter for å finne ut hvilke virkestoffer som ble brukt under tidligere anestesi som pasienten rapporterer medførte allergiske reaksjoner
"""
Usage: #example

* type = DCM#110110 "Patient Record"
* recorded = 2021-03-15T09:49:00.000Z
* action = #R

* agent[0].requestor = true
* contained[+] = AuditEventNorwayPractitionerRoleInstance1
* agent[0].who = Reference(AuditEventNorwayPractitionerRoleInstance1)

* contained[+] = AuditEventNorwayEncounterInstance1
* extension[_encounter].valueReference = Reference(AuditEventNorwayEncounterInstance1)

* contained[+] = AuditEventNorwayPatientInstance1
* extension[_patient].valueReference = Reference(AuditEventNorwayPatientInstance1)

* extension[_careRelationMetaData]   
  * extension[id].valueString  =  "23423255" // "care-relationship:decision-ref:id"
  * extension[description].valueString = "Innlagt pasient"  // "care-relationship:decision-ref:description"
  * extension[user-selected].valueBoolean = false // "care-relationship:decision-ref:user-selected"

* source.site = "server.example.com"
* source.type = http://terminology.hl7.org/CodeSystem/security-source-type#4 "Application Server"
* source.observer = Reference(Device/ex-device)
 
* purposeOfEvent.coding[+].code = #TREAT  // "care-relationship:purpose-of-use:code" 
* purposeOfEvent.coding[=].system = "urn:oid:2.16.840.1.113883.1.11.20448" // "care-relationship:purpose-of-use:system"
* purposeOfEvent.coding[=].display = "Treatment"  // "care-relationship:purpose-of-use:text"

* purposeOfEvent.coding[+].code = #POLBESOK  // "care-relationship:purpose-of-use-details:code"
* purposeOfEvent.coding[=].system = $DIPS_CARERELATION // "care-relationship:purpose-of-use-details:system"
* purposeOfEvent.coding[=].display = "Poliklinisk besøk"  // "care-relationship:purpose-of-use-details:text"

* entity
  * what = Reference(Bundle/Documentlist)
  * type = #Bundle
  * name = "Document list"

