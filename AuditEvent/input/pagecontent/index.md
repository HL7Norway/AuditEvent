# Implementation guide for AuditEvent in a cross organization scenario

In a scenario where a healthcare organization (such as a hospital or GP) needs to access patient health data from another healthcare organization or national service, both the consumer and service provider organizations are legally required to maintain proper audit logs for future analysis. These audit logs necessitate some contextual information, including details about the practitioner (agent), patient identification, organizational affiliation, and a component known as the ‘care relationship’ that explains why the practitioner accessed the patient’s data. This contextual information is stored in the consumer’s system, and a portion of it is transferred to the service provider in the form of a security token, typically JWT or SAML

When audit logs are analyzed, the FHIR AuditEvent is a recommended resource to be used in Norway. AuditEvents, typically retrieved from a consumer system, often contain bundles of references to other FHIR Resources such as PractitionerRole, Practitioner, Patient, and Encounter that exist within the consumer system. However, since these resources are not available on the service provider’s side, the AuditEvent must rely solely on the attributes contained within a security token. These attributes within the security token are described in [Tillitsrammeverk](https://github.com/NorskHelsenett/Tillitsrammeverk/blob/main/specs/informasjons_og_datamodell.md#42-datamodell). 

This implementation guide contains two profiles:
1. [AuditEvent from a consumer organization perspective](StructureDefinition-AuditEventNorwayTokenProfileConsumer.html). 
2. [AuditEvent from a API service organization perspective](StructureDefinition-AuditEventNorwayTokenProfile.html).


You can also download:

* [this entire guide](full-ig.zip),
* the definition resources in [json](definitions.json.zip), [xml](definitions.xml.zip), [ttl](definitions.ttl.zip), or [csv](csvs.zip) format, or
* the example resources in [json](examples.json.zip), [xml](examples.xml.zip) or [ttl](examples.ttl.zip) format.

The source code for this Implementation Guide can be found on [GitHub](https://github.com/HL7Norway/AuditEvent)

