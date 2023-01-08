Extension: NationalIdentifier
Title: "Agent national identifier (FNR/DNR)"
* extension contains
    id 1..1 and
    name 0..1 
* extension[id] ^short = "Health care personel national ID (FNR/DNR)"
* extension[id].value[x] only Identifier
* extension[name] ^short = "Healt care person name"
* extension[name].value[x] only string