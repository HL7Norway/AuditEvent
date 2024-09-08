# AuditEvent
This is a release candidate for a Norwegian implementation guide for AuditEvent.

## Local build - how to

Before building using sushi and _genonce, you need to download snapshot version of dependent package hl7.fhir.no.basis manually and put it into local FHIR package cache. If not, you will get error message  *"..is missing a snapshot. Snapshot is required for import."* when you try to build with sushi.

1. Manually download snapshot package `hl7.fhir.no.basis-2.2.0-snapshots.tgz` from [hl7.fhir.no.basis](https://simplifier.net/packages/hl7.fhir.no.basis/2.2.0/).
2. Extract the content of `package` directory to local FHIR cache `<User home dir>\.fhir\packages\hl7.fhir.no.basis#2.2.0\package`
3. Build with sush as normal







