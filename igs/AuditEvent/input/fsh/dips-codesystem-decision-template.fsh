CodeSystem: DIPSDecisionTemplate
Id: decisiontemplate
Title: "DIPS decision template codes used as basis of care relation between health care personel and patient."
Description: """
These are templates with various justifications that can be used as a basis for accessing the patient's medical record at hospitals that utilize DIPS as their journal system.

Templates that user, if authorized, can select manually as reason for accessing patient's medical record are marked as '(Eksplisitt mal)'.

NB! This code system is currently vendor specific (DIPS) and defined in this profile temporarily until a more suitable place is found. 

"""
* ^url = "https://terminology.dips.com/decisiontemplate"
* ^caseSensitive = true
* ^experimental = true
* ^publisher = "DIPS AS"
/*
select '* #' || bm.kortnavn as code, '"' || bm.decisiontemplatename || '"' as display, '"' || replace(bm.description,'"','\"') || nvl2(em.decisiontemplategid, ' (Eksplisitt mal)', null) || '"' as definition, '// ID: ' || bm.decisiontemplategid as ID
from DIPSCOREDB.COBTBESLUTNINGSMAL bm
left outer join dipscoredb.cobteksplisittmal em on em.decisiontemplategid = bm.decisiontemplategid
where bm.decisiontemplategid not in ('utvonn+0000000000083', 'aadonn+0000000000020');
*/
* #KONSSERIE	"Åpen konsultasjonsserie"	"Åpen konsultasjonsserie"	// ID: utvonn+0000000000189
* #LEDSBEL	"Inneliggende ledsager"	"Ledsageren er inneliggende."	// ID: utvonn+0000000000191
* #VURDHENV	"Vurdert henvisning"	"Henvisning som er vurdert"	// ID: utvonn+0000000000209
* #ITSYSARB	"IT-Systemarbeid"	"IT systemarbeid er en besluttningsmal som kan benyttes for å gi tilgang til journaldata når it-personell (på sykehuset / eller personell fra DIPS ASA), må gjøre systemarbeid - feilretting o.l. - på journaldataene. (Eksplisitt mal)"	// ID: aadonn+0000000000023
* #TILSYN	"Tilsyn på annen avdeling."	"\"Tilsyn på annen avdeling\" kan benyttes når en behandler bes om å foreta et tilsyn på en annen avdeling, og behandleren av den grunn ikke har ordinær tilgang til journalen.  Det kan angis hvilken rekvirent som har bedt om at tilsyn skal foretas. (Eksplisitt mal)"	// ID: aadonn+0000000000022
* #ARBFLYT	"Oppgave i arbeidsflyt"	"Beslutning som slår til dersom det finnes en ikke utført oppgave i arbeidsflyt.  Gjelder alle oppgavetyper.  "	// ID: aadonn+0000000000021
* #BEHANDLER	"Bruker har behandlingsansvar for pasienten"	"""Brukeren er behandler for pasienten. Eksempler på hva som gjør at malen slår til er:
a) Bruker er registrert som ansvarlig behandler på poliklinisk besøk.
b) Bruker er registrert som behandler på planlagt kontakt.
c) Bruker er registrert som ansvarlig lege på et postopphold. 
d) Bruker er registrert som ansvarlig behandler for omsorgsserie i psykiatrien.
e) Bruker er registrert som koterapeut til en poliklinisk konsultasjon (gjelder psykiatri).
f) Bruker er registrert som deltaker (ressurs) i en planlagt aktivitet i pasientens timebok."""	// ID: aadonn+0000000000005
* #INFOANSV	"Bruker er informasjonsansvarlig for pasienten"	"Brukeren er informasjonsansvarlig for pasienten."	// ID: aadonn+0000000000007
* #JOURANSV	"Bruker er journalansvarlig for pasienten"	"Brukeren er journalansvarlig for pasienten."	// ID: aadonn+0000000000009
* #PASANSV	"Bruker er koordinator for pasienten"	"Brukeren er koordinator for pasienten."	// ID: aadonn+0000000000011
* #HENVISNING	"Henvisning til vurdering"	"Henvisning som enda ikke er vurdert."	// ID: aadonn+0000000000013
* #BELEGG	"Innlagt pasient"	"Pasienten er innlagt."	// ID: aadonn+0000000000015
* #PLANOPP	"Planlagt oppmøte"	"""Planlagt oppmøte for pasienten.
"""	// ID: aadonn+0000000000017
* #POLBESOK	"Poliklinisk besøk"	"Poliklinisk konsultasjon."	// ID: aadonn+0000000000019
* #TILSYN2	"Tilsyn med helsepersonellets virksomhet"	"Tilsyn med helsepersonellets virksomhet. (Eksplisitt mal)"	// ID: aadonn+0000000000029
* #INNSYN	"Pasientinnsyn"	"Pasientens innsyn i egen journal. (Eksplisitt mal)"	// ID: aadonn+0000000000010
* #OFFBEST	"Bestilling av dokumenter fra offentlige og juridiske instanser og forsikringselskap"	"Bestilling av dokumenter fra offentlige og juridiske instanser og forsikringselskap. (Eksplisitt mal)"	// ID: aadonn+0000000000030
* #HENV_PAS	"Henvendelse fra pasienten"	"Henvendelse fra pasienten selv. (Eksplisitt mal)"	// ID: aadonn+0000000000031
* #HENVPER	"Åpen henvisningsperiode"	"Åpen henvisningsperiode."	// ID: aadonn+0000000000001
* #PLANKONT	"Ventende pasient"	"Pasienten har en planlagt kontakt som ikke er avsluttet."	// ID: aadonn+0000000000002
* #PRIMKONT	"Bruker er pasientens primærkontakt"	"Bruker er pasientens primærkontakt."	// ID: aadonn+0000000000003
* #HENV_BEH	"Henvendelse fra pasientens behandler"	"Henvendelse fra pasientens behandler. (Eksplisitt mal)"	// ID: aadonn+0000000000027
* #HENV_PAA	"Henvendelse fra pasientens pårørende"	"Henvendelse fra pasientens pårørende. (Eksplisitt mal)"	// ID: aadonn+0000000000028
* #MELDT	"Meldt pasient"	"Meldt pasient (for eksempel fra legevakta eller ambulansen). (Eksplisitt mal)"	// ID: aadonn+0000000000026
* #EKSTSVAR	"Eksternt prøvesvar/notat til vurdering"	"Det er behov for å se på et eksternt prøvesvar eller notat som har kommet inn på pasienten (Eksplisitt mal)"	// ID: utvonn+0000000000162
* #OPRPLAN	"Pasienten finnes på operasjonsoversikten"	"Pasienten finnes på operasjonsoversikten i DIPS"	// ID: utvonn+0000000000161
* #EGENLAER	"Egen læring/kvalitetssikring av gitt behandling"	"Begrunnelse forankret i Helsepersonellovens §29 c (Eksplisitt mal)"	// ID: utvonn+0000000000311
* #DELBEHAN	"Deltar i behandlingen av pasienten"	"Deltar i behandlingen av pasienten. (Eksplisitt mal)"	// ID: utvonn+0000000000320
* #TILSYN3	"Statlig tilsyn"	"Statlig tilsyn er forankret i  Helsetilsynsloven, Spesialisthelsetjenesteloven §6-2 og Pasientjournalloven §26. (Eksplisitt mal)"	// ID: utvonn+0000000000330
* #BLAALYS	"Blålys"	"Bruk av blålys - akutt helsehjelp (Eksplisitt mal)"	// ID: utvonn+0000000000141
* #KVAL	"Internkontroll/Kvalitetssikring"	"Noen ansatte har som oppgave å kontrollere koder og andre registreringer i DIPS, kanskje også se på hvordan det registreres/dokumenteres m.m uten at brukeren deltar i behandling av pasient.   Da kan denne beslutningsmalen brukes. (Eksplisitt mal)"	// ID: utvonn+0000000000186
* #FORSK	"Forskning"	"\"Forskning\" er en beslutningsmal som kan benyttes for å gi tilgang til pasientdata i forbindelse med Forskning. (Eksplisitt mal)"	// ID: utvonn+0000000000229
* #ETTERARB	"Etterarbeide"	"\"Etterarbeide\" er en beslutningsmal som kan benyttes for å gi tilgang til pasientdata i forbindelse med Etterarbeide. (Eksplisitt mal)"	// ID: utvonn+0000000000231
* #UNDERVISN	"Undervisning"	"\"Undervisning\" er en besluttningsmal som kan benyttes for å gi tilgang til pasientdata i forbindelse med undervisning. (Eksplisitt mal)"	// ID: utvonn+0000000000232
* #NYPAS	"Pasientadministrasjon"	"Pasientadministrasjon, f.eks registrering av ny pasient"	// ID: utvonn+0000000000250
* #ROLPAS	"Bruker har rolle overfor pasient"	"Bruker har rolle overfor pasient"	// ID: utvonn+0000000000270
* #HHJELANPAS	"Yte helsehjelp til annen pasient"	"\"Yte helsehjelp til annen pasient\" kan benyttes for å gi tilgang til pasientopplysninger på en pasient for å yte helsehjelp til annen pasient, jf. helsepersonelloven §25 b. (Eksplisitt mal)"	// ID: utvonn+0000000000371
* #PASADM	"Administrasjon"	"For administrative oppgaver som feks skanning av dokumenter, endring av pasientopplysninger, kodekontroll o.l."	// ID: utvonn+0000000000391


