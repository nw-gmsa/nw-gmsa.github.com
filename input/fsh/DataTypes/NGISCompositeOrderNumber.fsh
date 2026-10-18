Profile:        NGISCompositeOrderNumber
Parent:         OrderIdentifier
Id:             NGISCompositeOrderNumber
Title:          "NGIS Composite Order Number"
Description:    """
Order number for one participant's Distributed WGS (dWGS) sub-order, built from the two identifiers TOMS (Test Order
Management System, Genomics England) returns: `referral_id` + `-` + `patient_ngis_id`, e.g. `r2026000203-p2026000104`.
Both are assigned by Genomics England Limited (ODS `8J834`). It is not known whether `patient_ngis_id` is Genomics
England's primary patient key (an MRN) or a system-specific patient identifier.
"""

* obeys ngis-composite-order-number
* type = $v2-0203#FILL
* value ^short = "referral_id + '-' + patient_ngis_id"
* value ^example.label = "dWGS Trio proband"
* value ^example.valueString = "r2026000203-p2026000104"
* assigner ^short = "Genomics England (TOMS)"
* assigner.identifier.value = "8J834"

Invariant:      ngis-composite-order-number
Description:    "The value SHOULD be referral_id + '-' + patient_ngis_id"
Expression:     "value.matches('^r[0-9]+-p[0-9]+$')"
Severity:       #warning
