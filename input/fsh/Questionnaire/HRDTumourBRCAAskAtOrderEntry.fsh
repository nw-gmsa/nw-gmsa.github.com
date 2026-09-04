Instance: HRDTumourBRCAAskAtOrderEntry
InstanceOf: NWQuestionnaire
Title: "HRD and Tumour BRCA Ask At Order Entry Questions"
Description: """
**Ask At Order Entry Questions** for the NW GLH paper **HRD and Tumour BRCA Test
Request Form** (GB-27189), used alongside the [common core order
form](Questionnaire-GenomicTestOrder.html) - see [Order Entry
Questions](Questionnaire-GenomicTestOrder.html#order-entry-questions). This
form is specific to newly-diagnosed advanced high-grade epithelial ovarian,
fallopian tube or primary peritoneal cancer (HRD test, performed by Myriad
Genetics Inc. in the United States) and its relapsed-disease tumour BRCA-only
pathway.
"""
Usage:  #definition

* title = "HRD and Tumour BRCA Ask At Order Entry Questions"
* status = #draft
* url = "https://fhir.nwgenomics.nhs.uk/Questionnaire/HRDTumourBRCAAskAtOrderEntry"
* derivedFrom = "https://fhir.nwgenomics.nhs.uk/Questionnaire/GenomicTestOrder"
* derivedFrom.extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/questionnaire-derivationType"
  * valueCoding = http://hl7.org/fhir/questionnaire-derivationType#extends

* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/artifact-versionAlgorithm"
  * valueCoding = http://hl7.org/fhir/version-algorithm#semver

* item[+]
  * type = #group
  * linkId = "AskAtOrderEntry"
  * text = "Ask At Order Entry Questions"

  * item[+]
    * type = #choice
    * linkId = "NOS/HRDPathway"
    * text = "Pathway"
    * required = true
    * definition = "http://hl7.org/fhir/StructureDefinition/ServiceRequest#ServiceRequest.code"
    * answerOption[+].valueCoding = $GTD#M2.5 "HRD status (includes tumour BRCA results)"
    * answerOption[+].valueCoding = $GTD#M2.1 "Tumour BRCA test only"

  * item[+]
    * type = #boolean
    * linkId = "NOS/NewlyDiagnosedAdvancedDiseaseConfirmation"
    * code[+] = $nwgmsa#NewlyDiagnosedAdvancedDiseaseConfirmation
    * text = "Confirm the patient has newly diagnosed, advanced (FIGO stages III and IV) high-grade epithelial ovarian, fallopian tube or primary peritoneal cancer"
    * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.valueBoolean"
    * enableWhen[+]
      * question = "NOS/HRDPathway"
      * operator = #=
      * answerCoding = $GTD#M2.5

  * item[+]
    * type = #boolean
    * linkId = "NOS/RelapsedDiseaseConfirmation"
    * code[+] = $nwgmsa#RelapsedDiseaseConfirmation
    * text = "Confirm the patient has relapsed high-grade epithelial ovarian, fallopian tube or primary peritoneal cancer and has already received one or more treatment for their disease (second line or beyond)"
    * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.valueBoolean"
    * enableWhen[+]
      * question = "NOS/HRDPathway"
      * operator = #=
      * answerCoding = $GTD#M2.1

  * item[+]
    * type = #boolean
    * linkId = "NOS/MyriadInternationalTransferConsent"
    * code[+] = $nwgmsa#MyriadInternationalTransferConsent
    * text = "Consent obtained for tissue, pathology report and personal details (name, NHS number, date of birth) to be sent to Myriad laboratory in the United States for analysis"
    * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.valueBoolean"
    * enableWhen[+]
      * question = "NOS/HRDPathway"
      * operator = #=
      * answerCoding = $GTD#M2.5

  * item[+]
    * type = #string
    * linkId = "NOS/PathologistName"
    * code[+] = $nwgmsa#PathologistName
    * text = "Pathologist"
    * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.valueString"

  * item[+]
    * type = #string
    * linkId = "NOS/PathologyHospital"
    * code[+] = $nwgmsa#PathologyHospital
    * text = "Pathology hospital"
    * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.valueString"

  * item[+]
    * type = #quantity
    * linkId = "NOS/NeoplasticCellContent"
    * code[+] = $nwgmsa#NeoplasticCellContent
    * text = "Approximate % neoplastic nuclei in tumour area highlighted"
    * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.valueQuantity"
    * extension[unit].valueCoding = $ucum#% "%"
    * item[+]
      * linkId = "NOS/NeoplasticCellContent-designNote"
      * type = #display
      * text = "Specimen.accessionIdentifier (pathology block/sample number) is already captured by the common core order form's Specimen group - not repeated here."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help
