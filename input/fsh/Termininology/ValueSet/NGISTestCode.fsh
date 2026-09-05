ValueSet: NGISTestCodeVS
Id: NGISTestCodeVS
Title: "NGIS Test Code"
Description: """
All codes from the NHS England [Genomic Test Code](CodeSystem-GenomicTestCode.html)
CodeSystem (the National Genomic Informatics System (NGIS) test directory) - used to
answer the NGIS Test Code question on [WGS Local Test Order Ask At Order
Entry](Questionnaire-WGSLocalTestOrderAskAtOrderEntry.html). Unlike
[GenomicTestCodes](ValueSet-GenomicTestCodes.html), this does not also pull in the
Digital Genomic Test Services, NW-local, or Histotrac CodeSystems, since NGIS Test
Code is specifically the national test directory code.
"""
* ^experimental = false

* include codes from system $GTD
