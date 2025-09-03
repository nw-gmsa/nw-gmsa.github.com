Alias: $nhs-number = https://fhir.nhs.uk/Id/nhs-number
Alias: $ods-code = https://fhir.nhs.uk/Id/ods-organization-code
Alias: $ucum = http://unitsofmeasure.org
Alias: $Obligation = http://hl7.org/fhir/StructureDefinition/obligation
Alias: $test-directory = https://fhir.nhs.uk/CodeSystem/England-GenomicTestDirectory
Alias: $bcp13 = urn:ietf:bcp:13
Alias: $nwgmsa = https://nw-gmsa.github.io/CodeSystem/NWGMSA
Alias: $MFTEPIC = https://nw-gmsa.github.io/CodeSystem/MFTQuestionIds
Alias: $EthnicEngland = https://fhir.hl7.org.uk/CodeSystem/UKCore-EthnicCategoryEngland
Alias: $EthnicWales = https://fhir.hl7.org.uk/CodeSystem/UKCore-EthnicCategoryWales
Alias: $GTD = https://fhir.nhs.uk/CodeSystem/England-GenomicTestDirectory
Alias: $GSC = https://fhir.hl7.org.uk/CodeSystem/UKCore-GenomeSequencingCategory
Alias: $GCC = https://nw-gmsa.github.io/CodeSystem/GenomicConditionCode
Alias: $GTOC = https://nw-gmsa.github.io/CodeSystem/GenomicTestOutcomeCode

RuleSet: Obligation(code, actor)
* ^extension[$Obligation][+].extension[code].valueCode = {code}
* ^extension[$Obligation][=].extension[actor].valueCanonical = "{actor}"


RuleSet: ObligationServer(expectation, actor)
* rest.resource[=]
  * extension[+]
    * url = Canonical(http://hl7.org/fhir/StructureDefinition/obligation)
    * extension[+]
      * url = "code"
      * valueCode = {expectation}
    * extension[+]
      * url = "actor"
      * valueCode = {actor}
