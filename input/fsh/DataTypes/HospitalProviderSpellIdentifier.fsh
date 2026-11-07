Profile:        HospitalProviderSpellIdentifier
Parent:         CorrelationIdentifier
Id:             HospitalProviderSpellIdentifier
Title:          "Hospital Provider Spell Identifier"
Description:    """
Identifier for a NHS Hospital Provider Spell. HL7 has no Hospital Provider Spell concept, so the identifier type `AN` (Account number) is used as an interim workaround - it is not technically correct, as `AN` identifies an account rather than an encounter.
"""

//* ^keyword[+] = #NHSDataDictionary "NHS Data Dictionary"

// Workaround: v2-0203 has no Hospital Provider Spell code; AN (Account number) is used until a better code is agreed.
* type = $v2-0203#AN (exactly)
* type ^short = "AN (Account number) - interim workaround, HL7 has no Hospital Provider Spell identifier type"
* type ^comment = "HL7 v2 Table 0203 has no code for a Hospital Provider Spell. `AN` (Account number) is used as a workaround; strictly it identifies an account (v2 PID-18, FHIR Account.identifier) rather than an encounter. `VN` (Visit number) is the closest encounter-level code but is already used by the VisitNumber profile. This binding may change."
* assigner 1..1
