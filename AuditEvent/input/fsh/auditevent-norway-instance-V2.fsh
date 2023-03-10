Instance: AuditEventNorwayTokenInstance
InstanceOf: AuditEventNorwayTokenProfile
Title: "Example of mapping a security token to Auditevent"
// Description: 
Usage: #example

* type = DCM#110100 "Application Activity"
* recorded = 2021-12-03T09:49:00.000Z
* purposeOfEvent[+].coding = $VOLVEN_HELSEHJELPSOMRAADE#S08 "Anestesiologi/smertebehandling"                                                                        // healthcareservice:system, :id, :name. :assigner ignoreres siden Coding-datatypen ikke har assigner.

* agent[user].requestor = true
// * agent[user].type = UserAgentTypesCS#TokenBased  // User slice - automatically implied.
* agent[user].who.identifier.value = "ux34234234"                                                                                                                   // subject:id
* agent[user].who.identifier.system = "urn:oid:2.16.578.1.12.4.3.1.40.25.1"                                                                                         // subject:system
* agent[user].who.identifier.assigner.identifier.value = "https://www.helse-sorost.no"                                                                              // subject:assigner
* agent[user].who.display = "BEN PSA REDDIK"                                                                                                                        // subject:name                                                                                                                                                                   // purpose-local:reason - NB: ingen mapping av denne
* agent[user].who.extension[qualification].extension[id].valueIdentifier.system = $HPR                                                                              // subject:qualification:system
* agent[user].who.extension[qualification].extension[id].valueIdentifier.value = "222200068"                                                                        // subject:qualification:id
* agent[user].who.extension[qualification].extension[id].valueIdentifier.assigner.identifier.value = "https://register.helsedirektoratet.no/hpr"                    // subject:qualification:assigner. 
* agent[user].who.extension[qualification].extension[name].valueString = "BEN PSA REDDIK"                                                                           // subject:qualification:name 
* agent[user].who.extension[national-identifier].extension[id].valueIdentifier.system = $FNR                                                                        // subject:national-identifier:system
* agent[user].who.extension[national-identifier].extension[id].valueIdentifier.value = "05086900124"                                                                // subject:national-identifier:id
* agent[user].who.extension[national-identifier].extension[id].valueIdentifier.assigner.identifier.value = "https://www.skatteetaten.no/person/folkeregister/"      // subject:national-identifier:assigner. 
* agent[user].who.extension[national-identifier].extension[name].valueString = "BEN PSA REDDIK"                                                                     // subject:national-identifier:name
* agent[user].who.extension[application-role].extension[id].valueIdentifier.system = "http://dips.com/UserRoleGUID"                                                 // subject:application-role:system
* agent[user].who.extension[application-role].extension[id].valueIdentifier.value = "f185c1ba-2372-4e7e-b601-637d25aa054c"                                          // subject:application-role:id
* agent[user].who.extension[application-role].extension[id].valueIdentifier.assigner.identifier.value = "https://oslo-universitetssykehus.no"                       // subject:application-role:assigner. 
* agent[user].who.extension[application-role].extension[name].valueString  = "N/A"                                                                                  // subject:application-role:name - NB! Ikke i bruk fra DIPS. Lagt til for ordens skyld.

* agent[user].extension[organization].extension[id].valueIdentifier.system = $ORGNR                                                                                 // subject:organization:system
* agent[user].extension[organization].extension[id].valueIdentifier.value = "993467049"                                                                             // subject:organization:id
* agent[user].extension[organization].extension[id].valueIdentifier.assigner.identifier.value = "https://www.brreg.no/"                                             // subject:organization:assigner. 
* agent[user].extension[organization].extension[name].valueString = "Oslo universitetssykehus HF"                                                                   // subject:organization:name

* agent[user].extension[facility].extension[id].valueIdentifier.system =  $RESHID                                                                                   // subject:facility:system (RESH-ID)
* agent[user].extension[facility].extension[id].valueIdentifier.value = "974589095"                                                                                 // subject:facility:id
* agent[user].extension[facility].extension[id].valueIdentifier.assigner.identifier.value =  "https://register.nhn.no/resh"                                         // subject:facility:assigner NB! Feil i p??stander.xlsx?.
* agent[user].extension[facility].extension[name].valueString = "Hjertemedisinsk avdeling"                                                                          // subject:facility:name

* agent[user].extension[child-organization].extension[id].valueIdentifier.system =  $ORGNR                                                                          // subject:child-organization:system (Br??nn??ysund organisasjonsnummer - niv?? 2 av subject:organization)
* agent[user].extension[child-organization].extension[id].valueIdentifier.value = "700386"                                                                          // subject:child-organization:id
* agent[user].extension[child-organization].extension[id].valueIdentifier.assigner.identifier.value =  "https://www.brreg.no/"                                      // subject:child-organization:assigner. 
* agent[user].extension[child-organization].extension[name].valueString = "Oslo universitetssykehus HF Ullev??l ??? somatikk"                                          // subject:child-organization:name

* agent[user].extension[application-session].valueIdentifier.system =  "http://dips.com/session_id_hash"                                                            // subject:application-session:system -- NB! DIPS: Kan ikke garantere unikhet p?? tvers av alle installasjoner
* agent[user].extension[application-session].valueIdentifier.value = "34234534542323"                                                                               // subject:application-session:id
* agent[user].extension[application-session].valueIdentifier.assigner.identifier.value =  "OUS"                                                                     // subject:application-session:assigner 

// * agent[user].purposeOfUse[+].coding[+] = urn:oid:2.16.840.1.113883.5.8#TREAT "Treatment"                                                                           // purpose:system, :id, :name.  
* agent[user].purposeOfUse[+].coding[+] = $v3.ActReason#TREAT "Treatment"                                                                                           // purpose:system, :id, :name.  
* agent[user].purposeOfUse[=].text = "N/A"                                                                                                                          // purpose:description
* agent[user].purposeOfUse[=].extension[purposeOfUse]
  * extension[assigner].valueString = "NHN"                                                                                                                         // purpose:assigner                        
  * extension[reason].valueString = "<Fylles ut ved behov>"                                                                                                         // purpose:reason

* agent[user].purposeOfUse[+].coding[+] = DIPSCareRelationCS#BELEGG "Inneliggende pasient"                                                                              // purpose-local:system, :code, :name. 
* agent[user].purposeOfUse[=].coding[=].userSelected = false                                                                                                        // purpose-local:userSelected
* agent[user].purposeOfUse[=].text = "Inneliggende pasient p?? avdeling <X>, post <Y>, inntid 5.1.23"                                                                // purpose-local:description
* agent[user].purposeOfUse[=].extension[purposeOfUse]
  * extension[assigner].valueString = "OUS"                                                                                                                         // purpose-local:assigner                        
  * extension[reason].valueString = "<Fylles typisk ut hvis userSelected = True>"                                                                                   // purpose-local:reason
  * extension[id].valueString = "aabnmm+0000001161045"                                                                                                              // purpose-local:id                                                                                                                                                                    

* agent[user].extension[assurance-level].valueCodeableConcept = https://begrep.difi.no/Felles/sikkerhetsnivaa#4  "H??yeste sikkerhetsniv??"                           // subject:assurance-level:system, :code and :name.  :assigner ignoreres siden Coding-datatypen ikke har assigner

* agent[user].role[+] = urn:oid:2.16.578.1.12.4.1.1.9060#LE "Lege"                                                                                                  // subject:qualification-role:system, :id, :name. :assigner ignoreres siden Coding-datatypen ikke har assigner
* agent[user].role[+] = urn:oid:2.16.578.1.12.4.3.1.40.5.3#1027 "Legespesialist"                                                                                    // subject:role:system, :id, :name. :assigner ignoreres siden Coding-datatypen ikke har assigner
* agent[user].role[+] = urn:oid:2.16.578.1.12.4.3.1.40.5.1#Overlege "Overlege"                                                                                      // subject:functional-role:system, :id: :name. :assigner ignoreres siden Coding-datatypen ikke har assigner

* source.site = "server.example.com"
* source.type = http://terminology.hl7.org/CodeSystem/security-source-type#4 "Application Server"
* source.observer = Reference(Device/ex-device)

* entity[patient].type = http://terminology.hl7.org/CodeSystem/audit-entity-type#1 "Person"
* entity[patient].role = http://terminology.hl7.org/CodeSystem/object-role#1 "Patient"
* entity[patient].what.type = 	http://hl7.org/fhir/resource-types#Patient
* entity[patient].what.identifier.value = "12057900499"                                                                                                             // resource:id (FNR/DNR)
* entity[patient].what.identifier.system = "urn:oid:2.16.578.1.12.4.1.4.1"                                                                                          // resource:system
* entity[patient].what.identifier.assigner.identifier.value = "https://www.skatteetaten.no/person/folkeregister/"                                                   // resource:assigner
* entity[patient].what.display = "Ole Olsen"                                                                                                                        // resource:name  Hva med ?? benytte entity[patient].name i stedet?

* entity[patient].extension[facility].extension[id].valueIdentifier.system = $RESHID                                                                                // resource:facility:system (RESH-ID)
* entity[patient].extension[facility].extension[id].valueIdentifier.value = "974589095"                                                                             // resource:facility:id
* entity[patient].extension[facility].extension[id].valueIdentifier.assigner.identifier.value =  "https://register.nhn.no/resh"                                     // resource:facility:assigner NB! Feil i p??stander.xlsx?
* entity[patient].extension[facility].extension[name].valueString = "Hjertemedisinsk avdeling"                                                                      // resource:facility:name

* entity[patient].extension[child-organization].extension[id].valueIdentifier.system = $ORGNR                                                                       // resource:child-organization:system (Br??nn??ysund organisasjonsnummer - niv?? 2 av subject:organization)
* entity[patient].extension[child-organization].extension[id].valueIdentifier.value = "700386"                                                                      // resource:child-organization:id
* entity[patient].extension[child-organization].extension[id].valueIdentifier.assigner.identifier.value =  "https://www.brreg.no/"                                  // resource:child-organization:assigner
* entity[patient].extension[child-organization].extension[name].valueString = "Oslo universitetssykehus HF Ullev??l ??? somatikk"                                      // resource:child-organization:name
