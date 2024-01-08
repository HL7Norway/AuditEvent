Instance: AuditEventNorwayTokenInstance1
InstanceOf: AuditEventNorwayTokenProfile
Title: "Example of mapping a security token to Auditevent"
// Description: 
Usage: #example

* type = DCM#110100 "Application Activity"
* recorded = 2021-12-03T09:49:00.000Z


* agent[0].requestor = true
* agent[0].who.identifier.value = "xxxxxx34794"                       
* agent[0].who.identifier.system = $FNR
* agent[0].who.identifier.assigner.display = "www.skatteetaten.no"
* agent[0].who.display = "Lege Legesen"      

* agent.extension[_legal-entity] 
  * extension[id].valueIdentifier.system = $ORGNR
  * extension[id].valueIdentifier.value = "921592761"
  * extension[id].valueIdentifier.assigner.display  = "www.brreg.no"
  * extension[name].valueString = "Lege Leif Lagesen ENK"
* agent.extension[_point-of-care] 
  * extension[id].valueIdentifier.system = $ORGNR
  * extension[id].valueIdentifier.value = "123456789"
  * extension[id].valueIdentifier.assigner.display = "www.brreg.no"
  * extension[name].valueString = "Det beste legekontoret i byen AS"
* agent.who.extension[_HPRNumber] 
  * extension[id].valueIdentifier.system = $HPR
  * extension[id].valueIdentifier.value = "9144900"
  * extension[id].valueIdentifier.assigner.display = "https://www.helsedirektoratet.no/"
* agent.extension[_authorization] 
  * extension[code].valueCoding.code = #LE
  * extension[code].valueCoding.system = $KAT_HELSEPERSONELL
  * extension[code].valueCoding.display = "Lege"
  * extension[assigner].valueString = "https://www.helsedirektoratet.no/"
* extension[_purpose-of-use] 
  * extension[code].valueCoding.code = #TREAT
  * extension[code].valueCoding.system = "urn:oid:2.16.840.1.113883.1.11.20448"
  * extension[code].valueCoding.display = "Behandling"
  * extension[assigner].valueString = "http://www.hl7.org/"
* extension[_purpose-of-use-details] 
  * extension[code].valueCoding.code = #15
  * extension[code].valueCoding.system = $TJENESTETYPE
  * extension[code].valueCoding.display = "Helsetjenester i hjemmet"
  * extension[assigner].valueString = "https://www.volven.no/"
* extension[_careRelationMetaData] 
  * extension[id].valueString = "bb28f089-4042-407d-a3b5-22a70d72e1ec"
  * extension[description].valueString = "Legekonsultasjon"
  * extension[user-selected].valueBoolean = false
* extension[_health-care-service] 
  * extension[code].valueCoding.code = #KP02
  * extension[code].valueCoding.display = "Sykepleietjeneste"
  * extension[code].valueCoding.system = "urn:oid:2.16.578.1.12.4.1.1.8663"
  * extension[assigner].valueString = "https://www.helsedirektoratet.no"


* entity[patient].type = http://terminology.hl7.org/CodeSystem/audit-entity-type#1 "Person"
* entity[patient].role = http://terminology.hl7.org/CodeSystem/object-role#1 "Patient"
* entity[patient].what.type = 	http://hl7.org/fhir/resource-types#Patient

* source.site = "server.example.com"
* source.type = http://terminology.hl7.org/CodeSystem/security-source-type#4 "Application Server"
* source.observer = Reference(Device/ex-device)

* entity[patient].what.identifier.value = "05076600324"
* entity[patient].what.identifier.system = $FNR
* entity[patient].what.identifier.assigner.display = "https://www.skatteetaten.no"

* entity[patient].extension[_point-of-care] 
  * extension[id].valueIdentifier.system =  $ORGNR
  * extension[id].valueIdentifier.value = "123456789"
  * extension[id].valueIdentifier.assigner.display = "https://www.brreg.no"
  * extension[name].valueString = "Det beste legekontoret i byen AS"


Instance: AuditEventNorwayTokenInstance2
InstanceOf: AuditEventNorwayTokenProfile
Title: "Healthcare professionals in the enterprise request access to the document"
Description: """
In this example, an anesthesiologist who formally belongs to Rikshospitalet is preparing to administer anesthesia to a patient who is in for an eye operation at Ullevål Hospital, and the anesthesiologist therefore needs access to read documents from previous caregivers in other enterprises to find out which active substances were used during previous anesthesia that the patient reports caused allergic reactions
"""
Usage: #example

* type = DCM#110100 "Application Activity"
* recorded = 2021-12-03T09:49:00.000Z


* agent[0].requestor = true
* agent[0].who.identifier.value = "05086900124"                       
* agent[0].who.identifier.system = $FNR
* agent[0].who.identifier.assigner.display = "www.skatteetaten.no"
* agent[0].who.display = "Ben Reddik"      

* agent.extension[_legal-entity] 
  * extension[id].valueIdentifier.system = $ORGNR
  * extension[id].valueIdentifier.value = "993467049"
  * extension[id].valueIdentifier.assigner.display  = "www.brreg.no"
  * extension[name].valueString = "Oslo universitetssykehus HF"
* agent.extension[_point-of-care] 
  * extension[id].valueIdentifier.system = $ORGNR
  * extension[id].valueIdentifier.value = "874716782"
  * extension[id].valueIdentifier.assigner.display = "www.brreg.no"
  * extension[name].valueString = "OSLO UNIVERSITETSSYKEHUS HF RIKSHOSPITALET - SOMATIKK"
* agent.extension[_department] 
  * extension[id].valueIdentifier.system = $RESHID
  * extension[id].valueIdentifier.value = "705592"
  * extension[id].valueIdentifier.assigner.display = "https://www.nhn.no"
  * extension[name].valueString = "Anestesiologi Seksjon RH"
* agent.who.extension[_HPRNumber] 
  * extension[id].valueIdentifier.system = $HPR
  * extension[id].valueIdentifier.value = "222200068"
  * extension[id].valueIdentifier.assigner.display = "https://www.helsedirektoratet.no/"
* agent.extension[_authorization] 
  * extension[code].valueCoding.code = #LE
  * extension[code].valueCoding.system = $KAT_HELSEPERSONELL
  * extension[code].valueCoding.display = "Lege"
  * extension[assigner].valueString = "https://www.helsedirektoratet.no/"
* extension[_purpose-of-use] 
  * extension[code].valueCoding.code = #TREAT
  * extension[code].valueCoding.system = "urn:oid:2.16.840.1.113883.1.11.20448"
  * extension[code].valueCoding.display = "Treatment"
  * extension[assigner].valueString = "http://www.hl7.org/"
* extension[_purpose-of-use-details] 
  * extension[code].valueCoding.code = #POLBESOK
  * extension[code].valueCoding.system = "urn:AuditEventHL7Norway/CodeSystem/carerelation"
  * extension[code].valueCoding.display = "Poliklinisk besøk"
  * extension[assigner].valueString = "https://www.hl7.no"
* extension[_careRelationMetaData] 
  * extension[id].valueString = "bb28f089-4042-407d-a3b5-22a70d72e1ec"
  * extension[description].valueString = "Poliklinisk konsultasjon på Øyeavdeling"
  * extension[user-selected].valueBoolean = false
* extension[_health-care-service] 
  * extension[code].valueCoding.code = #300
  * extension[code].valueCoding.display = "Øyesykdommer"
  * extension[code].valueCoding.system = "urn:oid:2.16.578.1.12.4.1.1.8451"
  * extension[assigner].valueString = "https://www.helsedirektoratet.no"


* entity[patient].type = http://terminology.hl7.org/CodeSystem/audit-entity-type#1 "Person"
* entity[patient].role = http://terminology.hl7.org/CodeSystem/object-role#1 "Patient"
* entity[patient].what.type = 	http://hl7.org/fhir/resource-types#Patient

* source.site = "server.example.com"
* source.type = http://terminology.hl7.org/CodeSystem/security-source-type#4 "Application Server"
* source.observer = Reference(Device/ex-device)


* entity[patient].what.identifier.value = "05076600324"
* entity[patient].what.identifier.system = $FNR
* entity[patient].what.identifier.assigner.display = "https://www.skatteetaten.no"

* entity[patient].extension[_point-of-care] 
  * extension[id].valueIdentifier.system =  $ORGNR
  * extension[id].valueIdentifier.value = "974589095"
  * extension[id].valueIdentifier.assigner.display = "https://www.brreg.no"
  * extension[name].valueString = "OSLO UNIVERSITETSSYKEHUS HF ULLEVÅL - SOMATIKK"

* entity[patient].extension[_department]
  * extension[id].valueIdentifier.system = $RESHID
  * extension[id].valueIdentifier.value = "109765"
  * extension[id].valueIdentifier.assigner.display = "https://www.nhn.no"
  * extension[name].valueString = "Øye dagkir/pol 1. etasje"


