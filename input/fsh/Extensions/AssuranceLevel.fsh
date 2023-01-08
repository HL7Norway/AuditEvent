Extension: AssuranceLevel
Title: "subject:assurance-level"
Description: """
The assuranceLevel element carries various types of Assurance level. May be an Identity Assurance (IAL), an Authentication Assurance Level (AAL), a Federation Assurance Level (FAL), or other. 

In SAML this is [defined to be carried](https://docs.oasis-open.org/security/saml/v2.0/saml-authn-context-2.0-os.pdf) in the `saml:AuthnContextClassRef`, but may be carried elsewhere based on the use-case and profiling of SAML.

The Vocabulary is not defined here. Some sources of vocabulary:
- HL7 v3 [Security Trust Assurance ValueSet](https://terminology.hl7.org/3.0.0/ValueSet-v3-SecurityTrustAssuranceObservationValue.html). These include ISO-7498-2, NIST 800-63-1, and NIST-800-63-2.
- [idmanagement.gov](https://developers.login.gov/saml/#specifying-attributes-and-assurance-levels) published on login.gov
  - this is defined to be carried in the saml:AuthnContextClassRef
- OASIS [Authentication Context for SAML](https://docs.oasis-open.org/security/saml/v2.0/saml-authn-context-2.0-os.pdf)
- An example of a customized and purpose defined small set of codes can be found in the HL7 [SMART Health Cards](http://build.fhir.org/ig/HL7/fhir-shc-vaccination-ig/) defines a [valueset](http://hl7.org/fhir/uv/shc-vaccination/ValueSet/identity-assurance-level)
"""
* value[x] only CodeableConcept
* valueCodeableConcept from  http://terminology.hl7.org/ValueSet/v3-SecurityTrustAssuranceObservationValue (preferred)
* valueCodeableConcept 1..1