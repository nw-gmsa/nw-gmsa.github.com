ValueSet: Specialty
Id: specialty
Title: "Specialty"
Description: """
`NHS Data Model and Dictionary` [MAIN SPECIALTY CODE](https://www.datadictionary.nhs.uk/attributes/main_specialty_code.html)

- [UKCorePracticeSettingCode](https://simplifier.net/hl7fhirukcorer4/valueset-ukcore-practicesettingcode)
  - OID 2.16.840.1.113883.2.1.6.8
- [HL7 Practice Setting Code Value Set](https://hl7.org/fhir/R4/valueset-c80-practice-codes.html)
"""

* ^experimental  = false

* include codes from system https://fhir.hl7.org.uk/CodeSystem/UKCore-PracticeSettingCode
* include codes from valueset http://hl7.org/fhir/ValueSet/c80-practice-codes


