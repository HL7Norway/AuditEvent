The mappings defined here are based on the list of attributes defined by [Tillitsrammeverk](https://github.com/NorskHelsenett/Tillitsrammeverk/blob/main/specs/informasjons_og_datamodell.md#42-datamodell).

### Mapping to FHIR AuditEvent {#auditevent}
Profile: [no-basis-Auditevent](StructureDefinition-no-basis-Auditevent.html)

| FHIR Attribute | Trust Framework Mapping |
|-----------|---------|
| `purposeOfEvent[0..1].coding.code` | `care-relationship:purpose-of-use:code` and `care-relationship:purpose-of-use-details:code` |
| `purposeOfEvent[0..1].coding.system` | `care-relationship:purpose-of-use:system` and `care-relationship:purpose-of-use-details:system` |
| `purposeOfEvent[0..1].coding.display` | `care-relationship:purpose-of-use:text` and `care-relationship:purpose-of-use-details:text` |
| `_careRelationMetaData.decision-ref-id` | `care-relationship:decision-ref:id` |
| `_careRelationMetaData.decision-ref-description` | `care-relationship:decision-ref:description` |
| `_careRelationMetaData.decision-ref-user-selected` | `care-relationship:decision-ref:user-selected` |
| `_careRelationMetaData.toa` | `toa` |


### Mapping to FHIR Practitioner {#practitioner}
Profile: [no-basis-Practitioner](https://simplifier.net/hl7norwayno-basis/nobasispractitioner)

| FHIR attribute                   | Trust Framework Mapping                       |
| --------------------------- | ----------------------------- |
| `identifier[0..1].id`               | `practitioner:identifier` and `practitioner:hpr-nr`        |
| `identifier[0..1].system`           | `practitioner:identifier:system` and `practitioner:hpr-nr:system` |
| `identifier[0..1].assigner.display` | `practitioner:identifier:authority` and `practitioner:hpr-nr:authority` |
| `name.text`                        |  `practitioner:identifier:name`      |
| `qualification.code.coding.code` | `practitioner:authorization:code` |
| `qualification.code.coding.system` | `practitioner:authorization:system` |
| `qualification.code.coding.display` | `practitioner:authorization:text` |

### Mapping to FHIR Patient {#patient}
Profile: [no-basis-Patient](https://simplifier.net/hl7norwayno-basis/nobasispatient)

NOTE! Single auditevent per patient, i.e. need to duplicate auditevent for each patient in list.

| FHIR attribute                   | Trust Framework Mapping                       |
| --------------------------- | ----------------------------- |
| `identifier.id`               | `patients:identifier:id`        |
| `identifier.system`           | `patients:identifier:system` |
| `identifier.assigner.display` | `patients:identifier:authority` |
| `name.text`                        | `patients:identifier:name`      |

### Mapping to FHIR Organization 
Profile: [no-basis-Organization](https://simplifier.net/hl7norwayno-basis/nobasisorganization)

#### Role as practitioner legal entity {#organization-legal-entity}
The health care managing organization (legal entity) of the health care auditevent practitioner actor.

| FHIR attribute                   | Trust Framework Mapping                       |
| --------------------------- | ----------------------------- |
| `identifier.id`               | `practitioner:legal-entity:id`        |
| `identifier.system`           | `practitioner:legal-entity:system` |
| `identifier.assigner.display` | `practitioner:legal-entity:authority` |
| `name.text`                        | `practitioner:legal-entity:name`      |

#### Role as practitioner department {#organization-practitioner-department}
The health care department of the health care auditevent practitioner actor.

| FHIR attribute                   | Trust Framework Mapping                       |
| --------------------------- | ----------------------------- |
| `identifier.id`               | `practitioner:department:id`        |
| `identifier.system`           | `practitioner:department.system` |
| `identifier.assigner.display` | `practitioner:department:authority` |
| `name.text`                        | `practitioner:department:name`      |
| `partOf`                      | `practitioner:legal-entity:*` |

#### Role as practitioner point of care organization {#organization-practitioner-point-of-care}
The point of care managing organization of auditevent health care practitioner actor.

| FHIR attribute                   | Trust Framework Mapping                       |
| --------------------------- | ----------------------------- |
| `identifier.id`               | `practitioner:point-of-care:id`        |
| `identifier.system`           | `practitioner:point-of-care:system` |
| `identifier.assigner.display` | `practitioner:point-of-care:authority` |
| `name.text`                        | `practitioner:point-of-care:name`      |

#### Role as encounter service provider department {#organization-encounter-department}
The service provider department of auditevent encounter.

NOTE! Single auditevent per patient, i.e. need to duplicate auditevent for each patient in list.

| FHIR attribute                   | Trust Framework Mapping                       |
| --------------------------- | ----------------------------- |
| `identifier.id`               | `patients:department:id`        |
| `identifier.system`           | `patients:department:system` |
| `identifier.assigner.display` | `patients:department:authority` |
| `name.text`                   | `patients:department:name`      |

#### Role as encounter point of care organization {#organization-encounter-point-of-care}
The point of care managing organization of the auditevent encounter.

NOTE! Single auditevent per patient, i.e. need to duplicate auditevent for each patient in list.

| FHIR attribute                   | Trust Framework Mapping                       |
| --------------------------- | ----------------------------- |
| `identifier.id`               | `patients:point_of_care_patient:id`        |
| `identifier.system`           | `patients:point_of_care_patient:system` |
| `identifier.assigner.display` | `patients:point_of_care_patient:authority` |
| `name.text`                        | `patients:point_of_care_patient:name`      |

### Mapping to FHIR Encounter {#encounter}
Profile: [auditevent-encounter](StructureDefinition-auditevent-encounter.html)

| FHIR attribute                   | Trust Framework Mapping                       |
| --------------------------- | ----------------------------- |
| `serviceType.coding.code`               | `care-relation:healthcare-service:code`        |
| `serviceType.coding.system`           | `care-relation:healthcare-service:system` |
| `serviceType.coding.display` | `care-relation:healthcare-service:text` |



