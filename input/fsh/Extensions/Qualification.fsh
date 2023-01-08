Extension: Qualification
Title: "AuditEvent qualification (HPR)"
* extension contains
    id 1..1 and
    name 0..1 
* extension[id] ^short = "Health Care personel qualification ID (HPR-nummer)"
* extension[id].value[x] only Identifier
* extension[name] ^short = "Health Care personel name"
* extension[name].value[x] only string