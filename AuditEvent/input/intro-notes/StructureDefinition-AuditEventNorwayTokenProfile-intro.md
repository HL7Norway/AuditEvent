
The attributes are those described in "Tillitsrammeverk" [here](https://github.com/NorskHelsenett/Tillitsrammeverk/blob/main/specs/informasjons_og_datamodell.md#424-oppsummering-av-informasjonselementer).

From versjon -6:

| Kategori         | Attributt                | Beskrivelse                                                                                       | 
|------------------|--------------------------|---------------------------------------------------------------------------------------------------| 
| practitioner     | "identifier"             | Helsepersonellets fødselsnummer og navn fra folkeregisteret                                       | 
| practitioner     | "hpr-nr"                 | Helsepersonellets HPR-nummer, dersom det finnes                                                   | 
| practitioner     | "authorization"     	  | Helsepersonellets autorisasjon, dersom den finnes                                                 | 
| practitioner     | "legal-entity"           | Hovedenheten (den juridisk ansvarlige virksomheten) hvor helsepersonellet jobber sitt org.nr og navn.            | 
| practitioner     | "point-of-care"          | Behandlingsstedets org.nr. og navn.<br>Kan være lik verdi som i "legal-entity"                    | 
| practitioner     | "department"             | Avdeling/org.enhet hvor helsepersonellet yter helsehjelp                                          | 
| care-relation    | "healthcare-service"     | Helsetjenestetyper som leveres ved virksomheten                                                   | 
| care-relation    | "purpose-of-use"         | Helsepersonellets formål med helseopplysningene (til hva de skal brukes)                          | 
| care-relation    | "purpose-of-use-details" | Detaljert beskrivelse av helsepersonellets formål med helseopplysningene (til hva de skal brukes) | 
| care-relation    | "decision-ref"           | Referanse til lokal tilgangsbeslutning                                                            | 
| patient          | "identifier"             | Unik identifikator for pasienten                                                                  | 
| patient          | "point-of-care"  	      | Virksomheten hvor pasienten mottar behandling <br>Kan være lik verdi som i "legal-entity"         | 
| patient          | "department"             | Avdeling/org.enhet hvor pasienten mottar helsehjelp                                        	      |

Most of the attributes are mapped to extentions to Agent and Entity, and only who.identifier and what.identifiser are actually mapping to existing attributes. This is deliberatebly done to minimize the chance of conflicting profiles when combining this  profile with other profiles which is a typical use case for this profile.

The mappings to AuditEvent fields are described in the "Description & Constraint" column. 


