Instance: HaemoglobinopathyPrenatalAskAtOrderEntry
InstanceOf: NWQuestionnaire
Title: "Prenatal Haemoglobinopathy Ask At Order Entry Questions"
Description: """
**Ask At Order Entry Questions** for the NW GLH paper **Request for Prenatal
Diagnosis of Haemoglobinopathies** form (DOC4544), used alongside the [common
core order form](Questionnaire-GenomicTestOrder.html) - see [Order Entry
Questions](Questionnaire-GenomicTestOrder.html#order-entry-questions). This
form is unusual among the paper forms in naming **two** patients (maternal
and paternal) rather than one - the common core's own Patient group is
completed for the mother (the proband/referral subject), and this
Questionnaire adds a reference to the father.
"""
Usage:  #definition

* title = "Prenatal Haemoglobinopathy Ask At Order Entry Questions"
* status = #draft
* url = "https://fhir.nwgenomics.nhs.uk/Questionnaire/HaemoglobinopathyPrenatalAskAtOrderEntry"
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
    * type = #reference
    * linkId = "NOS/PaternalPatient"
    * text = "Paternal details (name, DOB, NHS/hospital number, if known)"
    * definition = "http://hl7.org/fhir/StructureDefinition/ServiceRequest#ServiceRequest.supportingInfo"
    * extension[referenceProfile].valueCanonical = "http://hl7.org/fhir/StructureDefinition/Patient"

  * item[+]
    * type = #string
    * linkId = "NOS/ParentalGenotypesReason"
    * text = "Parental genotypes/reason for referral"
    * definition = "http://hl7.org/fhir/StructureDefinition/ServiceRequest#ServiceRequest.reasonCode.text"

  * item[+]
    * type = #integer
    * linkId = "SNM/598151000005105-prenatal-haem"
    * code[+] = $sct#57036006 "Fetal gestational age"
    * extension[unit].valueCoding = $ucum#wk "Wk"
    * text = "Gestation of pregnancy"
    * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.valueQuantity"

  * item[+]
    * type = #date
    * linkId = "SNM/161714006-prenatal-haem"
    * code[+] = $sct#161714006 "Estimated date of delivery"
    * text = "Estimated date of delivery (EDD)"
    * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.valueDateTime"

  * item[+]
    * type = #dateTime
    * linkId = "NOS/FetalSampleTaken"
    * text = "Date fetal sample taken and sample type"
    * definition = "http://hl7.org/fhir/StructureDefinition/Specimen#Specimen.collection.collectedDateTime"
