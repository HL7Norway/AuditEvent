Instance: ex-tokemapping-norway-V2
InstanceOf: NorwayProfileV2
Title: "Audit Example of with token mapping V2"
Description: "<TODO>"
Usage: #example

* type = DCM#110100 "Application Activity"
* recorded = 2021-12-03T09:49:00.000Z
* purposeOfEvent[+].coding = $VOLVEN_HELSEHJELPSOMRAADE#S08 "Anestesiologi/smertebehandling"                                                                        // healthcareservice:system, :id, :name. :assigner ignoreres siden Coding-datatypen ikke har assigner.

* agent[user].requestor = true
// * agent[user].type = UserAgentTypesCS#TokenBased  // User slice - automatically implied.
* agent[user].who.identifier.value = "ux34234234"                                                                                                                   // subject:id
* agent[user].who.identifier.system = "urn:oid:2.16.578.1.12.4.3.1.40.25.1"                                                                                         // subject:system
* agent[user].who.identifier.assigner.identifier.value = "https://www.helse-sorost.no"                                                                              // subject:assigner
* agent[user].who.display = "Kari Normann"                                                                                                                          // subject:name                                                                                                                                                                   // purpose-local:reason - NB: ingen mapping av denne
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
* agent[user].who.extension[application-role].extension[name].valueString  = ""                                                                                     // subject:application-role:name - NB! Ikke i bruk fra DIPS. Lagt til for ordens skyld.

* agent[user].extension[organization].extension[id].valueIdentifier.system = $ORGNR                                                                                 // subject:organization:system
* agent[user].extension[organization].extension[id].valueIdentifier.value = "993467049"                                                                             // subject:organization:id
* agent[user].extension[organization].extension[id].valueIdentifier.assigner.identifier.value = "https://www.brreg.no/"                                             // subject:organization:assigner. 
* agent[user].extension[organization].extension[name].valueString = "Oslo universitetssykehus HF"                                                                   // subject:organization:name

* agent[user].extension[child-organization].extension[id].valueIdentifier.system =  $RESHID                                                                         // subject:child-organization:system (RESH-ID)
* agent[user].extension[child-organization].extension[id].valueIdentifier.value = "974589095"                                                                       // subject:child-organization:id
* agent[user].extension[child-organization].extension[id].valueIdentifier.assigner.identifier.value =  "https://register.nhn.no/resh"                               // subject:child-organization:assigner NB! Feil i påstander.xlsx?.
* agent[user].extension[child-organization].extension[name].valueString = "Hjertemedisinsk avdeling"                                                                // subject:child-organization:name

* agent[user].extension[facility].extension[id].valueIdentifier.system =  $ORGNR                                                                                    // subject:facility:system (Brønnøysund organisasjonsnummer - nivå 2 av subject:organization)
* agent[user].extension[facility].extension[id].valueIdentifier.value = "700386"                                                                                    // subject:facility:id
* agent[user].extension[facility].extension[id].valueIdentifier.assigner.identifier.value =  "https://www.brreg.no/"                                                // subject:facility:assigner. 
* agent[user].extension[facility].extension[name].valueString = "Oslo universitetssykehus HF Ullevål – somatikk"                                                    // subject:facility:name

* agent[user].purposeOfUse[+].coding[+] = urn:oid:2.16.840.1.113883.5.8#TREAT "Treatment"                                                                           // purpose:system, :id, :name.  :assigner ignoreres siden Coding-datatypen ikke har assigner
* agent[user].purposeOfUse[=].text = ""                                                                                                                             // purpose:description
                                                                                                                                                                    // NB! purpose:reason er ikke støttet

* agent[user].purposeOfUse[+].coding[+] = CareRelationCS#BELEGG "Inneliggende pasient"                                                                              // purpose-local:system, :id, :name. 
* agent[user].purposeOfUse[=].coding[=].userSelected = false                                                                                                        // purpose-local:userSelected
* agent[user].purposeOfUse[=].text = "Inneliggende pasient på avdeling <X>, post <Y>, inntid 5.1.23"                                                                // purpose-local:description
                                                                                                                                                                    // NB! purpose-local:reason er ikke støttet                                                                                                                                                                 

* agent[user].extension[assurance-level].valueCodeableConcept = https://begrep.difi.no/Felles/sikkerhetsnivaa#4  "Høyeste sikkerhetsnivå"                           // subject:assurance-level:system, :code and :name.  :assigner ignoreres siden Coding-datatypen ikke har assigner

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
* entity[patient].what.display = "Ole Olsen"                                                                                                                        // resource:name  Hva med å benytte entity[patient].name i stedet?

* entity[patient].extension[child-organization].extension[id].valueIdentifier.system = $RESHID                                                                      // resource:child-organization:system (RESH-ID)
* entity[patient].extension[child-organization].extension[id].valueIdentifier.value = "974589095"                                                                   // resource:child-organization:id
* entity[patient].extension[child-organization].extension[id].valueIdentifier.assigner.identifier.value =  "https://register.nhn.no/resh"                           // resource:child-organization:assigner NB! Feil i påstander.xlsx?
* entity[patient].extension[child-organization].extension[name].valueString = "Hjertemedisinsk avdeling"                                                            // resource:child-organization:name

* entity[patient].extension[facility].extension[id].valueIdentifier.system = $ORGNR                                                                                 // resource:facility:system (Brønnøysund organisasjonsnummer - nivå 2 av subject:organization)
* entity[patient].extension[facility].extension[id].valueIdentifier.value = "700386"                                                                                // resource:facility:id
* entity[patient].extension[facility].extension[id].valueIdentifier.assigner.identifier.value =  "https://www.brreg.no/"                                            // resource:facility:assigner
* entity[patient].extension[facility].extension[name].valueString = "Oslo universitetssykehus HF Ullevål – somatikk"                                                // resource:facility:name
