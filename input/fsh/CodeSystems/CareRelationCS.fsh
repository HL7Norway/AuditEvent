CodeSystem: CareRelationCS
Id: carerelation
Title: "Care relation code system"
Description: """
Dette er beslutningsmalene som benyttes for å avgjøre om sluttbruker har tilgang, samt dokumentere begrunnelse for tilgang til pasientens journal.
"""
* #HENV_BEH "Henvendelse fra pasientens behandler" "Henvendelse fra pasientens behandler." // ID: "aadonn+0000000000027"
* #HENV_PAA "Henvendelse fra pasientens pårørende" "Henvendelse fra pasientens pårørende." // ID: "aadonn+0000000000028"
* #MELDT "Meldt pasient" "Meldt pasient (for eksempel fra legevakta eller ambulansen)." // ID: "aadonn+0000000000026"
* #BLAALYS "Blålys" "Bruk av blålys - akutt helsehjelp" // ID: "utvonn+0000000000141"
* #EKSTSVAR "Eksternt prøvesvar/notat til vurdering" "Det er behov for å se på et eksternt prøvesvar eller notat som har kommet inn på pasienten" // ID: "utvonn+0000000000162"
* #KVAL  "Internkontroll/Kvalitetssikring" "Noen ansatte har som oppgave å kontrollere koder og andre registreringer i DIPS, kanskje også se på hvordan det registreres/dokumenteres m.m uten at brukeren deltar i behandling av pasient.   Da kan denne beslutningsmalen brukes." // ID: "utvonn+0000000000186"
* #OPRPLAN "Pasienten finnes på operasjonsoversikten" "Pasienten finnes på operasjonsoversikten i DIPS" // ID: "utvonn+0000000000161"
* #KONSSERIE "Åpen konsultasjonsserie" "Åpen konsultasjonsserie" // ID: "utvonn+0000000000189"
* #LEDSBEL "Inneliggende ledsager" "Ledsageren er inneliggende." // ID: "utvonn+0000000000191"
* #VURDHENV "Vurdert henvisning" "Henvisning som er vurdert" // ID: "utvonn+0000000000209"
* #ITSYSARB  "IT-Systemarbeid" "IT systemarbeid er en besluttningsmal som kan benyttes for å gi tilgang til journaldata når it-personell (på sykehuset / eller personell fra DIPS ASA), må gjøre systemarbeid - feilretting o.l. - på journaldataene." // ID: aadonn+0000000000023
* #TILSYN  "Tilsyn på annen avdeling." "\"Tilsyn på annen avdeling\" kan benyttes når en behandler bes om å foreta et tilsyn på en annen avdeling, og behandleren av den grunn ikke har ordinær tilgang til journalen.  Det kan angis hvilken rekvirent som har bedt om at tilsyn skal foretas."  // ID: "aadonn+0000000000022"
* #ARBFLYT "Oppgave i arbeidsflyt" "Beslutning som slår til dersom det finnes en ikke utført oppgave i arbeidsflyt.  Gjelder alle oppgavetyper." // ID: "aadonn+0000000000021"
* #BEHANDLER "Bruker har behandlingsansvar for pasienten" "Brukeren er behandler for pasienten. Eksempler på hva som gjør at malen slår til er:
a) Bruker er registrert som ansvarlig behandler på poliklinisk besøk.
b) Bruker er registrert som behandler på planlagt kontakt.
c) Bruker er registrert som ansvarlig lege på et postopphold. 
d) Bruker er registrert som ansvarlig behandler for omsorgsserie i psykiatrien.
e) Bruker er registrert som koterapeut til en poliklinisk konsultasjon (gjelder psykiatri).
f) Bruker er registrert som deltaker (ressurs) i en planlagt aktivitet i pasientens timebok." // ID: "aadonn+0000000000005"
* #INFOANSV "Bruker er informasjonsansvarlig for pasienten" "Brukeren er informasjonsansvarlig for pasienten." // ID: "aadonn+0000000000007"
* #JOURANSV "Bruker er journalansvarlig for pasienten" "Brukeren er journalansvarlig for pasienten." // ID: "aadonn+0000000000009"
* #PASANSV "Bruker er koordinator for pasienten" "Brukeren er koordinator for pasienten." // ID: aadonn+0000000000011
* #HENVISNING "Henvisning til vurdering" "Henvisning som enda ikke er vurdert." // ID: "aadonn+0000000000013"
* #BELEGG "Inneliggende pasient" "Pasienten er inneliggende." // ID: "aadonn+0000000000015"
* #PLANOPP "Planlagt oppmøte" "Planlagt oppmøte for pasienten." //  ID: "aadonn+0000000000017"
* #POLBESOK "Poliklinisk besøk" "Poliklinisk konsultasjon." // ID: "aadonn+0000000000019"
* #TILSYN2 "Tilsyn med helsepersonellets virksomhet" "Tilsyn med helsepersonellets virksomhet." // ID: "aadonn+0000000000029"
* #INNSYN "Pasientinnsyn" "Pasientens innsyn i egen journal." // ID: "aadonn+0000000000010"
* #OFFBEST "Bestilling av dokumenter fra offentlige og juridiske instanser og forsikringselskap" "Bestilling av dokumenter fra offentlige og juridiske instanser og forsikringselskap." // ID: "aadonn+0000000000030"
* #HENV_PAS "Henvendelse fra pasienten" "Henvendelse fra pasienten selv." // ID: "aadonn+0000000000031"
* #HENVPER "Åpen henvisningsperiode" "Åpen henvisningsperiode." // ID: "aadonn+0000000000001"
* #PLANKONT "Ventende pasient" "Pasienten har en planlagt kontakt som ikke er avsluttet." // ID: "aadonn+0000000000002"
* #PRIMKONT "Bruker er pasientens primærkontakt" "Bruker er pasientens primærkontakt." // ID: "aadonn+0000000000003"
* #DELBEHAN "Deltar i behandlingen av pasienten" "Deltar i behandlingen av pasienten." // ID: "utvonn+0000000000320"
* #TILSYN3 "Statlig tilsyn" "Statlig tilsyn er forankret i  Helsetilsynsloven, Spesialisthelsetjenesteloven §6-2 og Pasientjournalloven §26." // ID: "utvonn+0000000000330"
* #HHJELANPAS "Yte helsehjelp til annen pasient" "\"Yte helsehjelp til annen pasient\" kan benyttes for å gi tilgang til pasientopplysninger på en pasient for å yte helsehjelp til annen pasient, jf. helsepersonelloven §25 b." // ID: "utvonn+0000000000371"
* #NYPAS "Pasientadministrasjon" "Pasientadministrasjon, f.eks registrering av ny pasient" // ID: "utvonn+0000000000250"
* #ROLPAS "Bruker har rolle overfor pasient" "Bruker har rolle overfor pasient" // ID: "utvonn+0000000000270"
* #EGENLAER "Egen læring/kvalitetssikring av gitt behandling" "Begrunnelse forankret i Helsepersonellovens §29 c" // ID: "utvonn+0000000000311"