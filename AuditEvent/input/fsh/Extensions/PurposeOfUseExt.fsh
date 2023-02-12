Extension: PurposeOfUseExt
Title: "Extension of purpose:* and purpose-local:* attribute"
Description: """
Extension of PurposeOfUse to hold attributes values purpose-local:id, purpose:reason, purpose-local:reason, purpose:assigner and purpose-local:assigner
"""
* extension contains
    assigner 0..1 and
    reason 0..1 and
    id 0..1 
* extension[assigner] ^short = "purpose:assigner and purpose-local:assigner"
* extension[assigner].value[x] only string
* extension[reason] ^short = "purpose:reason and purpose-local:reason"
* extension[reason].value[x] only string
* extension[id] ^short = "purpose-local:id"
* extension[id].value[x] only string
