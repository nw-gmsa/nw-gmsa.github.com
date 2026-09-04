This Questionnaire `derivedFrom`/extends [Genomic Test
Order](Questionnaire-GenomicTestOrder.html) - see [Order Entry
Questions](Questionnaire-GenomicTestOrder.html#order-entry-questions). It
structures the NW GLH paper **Request for Genetic Testing for
Haemoglobinopathies** form (DOC4544) - see [NW Genomics paper test request
forms](Questionnaire-GenomicTestOrder.html#nw-glh-paper-test-request-forms)
for how this compares to the other paper forms.

## Summary

| Item | Paper Form Field | FHIR |
|---|---|---|
| Test Code | R361.1/R361.2/R372.1/R93.1/R93.2 (tick boxes) | `ServiceRequest.code` |
| Antenatal patient / gestation | Yes/no + weeks | `Observation.valueBoolean` / `Observation.valueQuantity` |
| Laboratory results | Hb, RBC, MCV, MCH, Ferritin, Hb A2 %, Hb F %, Other Hb % | `Observation.valueQuantity`, one per analyte |
| Relative/partner | Name/DOB, affected/carrier status, known variant | `ServiceRequest.supportingInfo` -> `RelatedPerson`, `Observation` |
{:.grid}

The **Laboratory Results** group is unusual among these forms: it submits
*prior* full blood count/HPLC results **with** the request, to help interpret
the genetic result, rather than being an outcome the genomic test itself
produces. No Order Placer Number, Account Number/Hospital Spell Identifier,
or clinician professional identifier (GMC/GMP) field is present on the paper
form.
