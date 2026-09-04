ValueSet: GMSWGSGuideHPOTermsVS
Id: GMSWGSGuideHPOTermsVS
Title: "GMS WGS Rare Disease Form - Guide HPO Terms"
Description: """
The 38 example HPO terms shown as a guide (image, not selectable text) on
page 2 of the [GMS WGS Test Request Form - Rare
Disease](https://mft.nhs.uk/app/uploads/2026/05/GMS-WGS-Test-Order-Form-Rare-Disease.pdf),
grouped by clinical specialty - see
[GMSWGSGuideHPOTerms](CodeSystem-GMSWGSGuideHPOTerms.html) for why these
are **local** codes, not real HPO IDs. Bound as `#open-choice` on
[Questionnaire-GMSWGSRareDisease](Questionnaire-GMSWGSRareDisease.html)
so these 38 terms are offered as quick picks without preventing free-text
entry of any other HPO term, consistent with the source form's own "guide
... not an exhaustive list" wording.
"""
* ^experimental = true
* include codes from system GMSWGSGuideHPOTerms
