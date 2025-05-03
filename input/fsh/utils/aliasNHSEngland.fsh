Alias: $nhs-number = https://fhir.nhs.uk/Id/nhs-number
Alias: $ods-code = https://fhir.nhs.uk/Id/ods-organization-code
Alias: $ucum = http://unitsofmeasure.org
Alias: $Obligation = http://hl7.org/fhir/StructureDefinition/obligation
Alias: $test-directory = https://fhir.nhs.uk/CodeSystem/England-GenomicTestDirectory
Alias: $bcp13 = urn:ietf:bcp:13
Alias: $epic = http://fhir.epic.mft.nhs.uk
Alias: $NOS = https://fhir.nw-gmsa.nhs.uk/CodeSystem/NotOtherwiseSpecified
Alias: $EthnicEngland = https://fhir.hl7.org.uk/CodeSystem/UKCore-EthnicCategoryEngland
Alias: $EthnicWales = https://fhir.hl7.org.uk/CodeSystem/UKCore-EthnicCategoryWales
Alias: $GTD = https://fhir.nhs.uk/CodeSystem/England-GenomicTestDirectory
Alias: $GSC = https://fhir.hl7.org.uk/CodeSystem/UKCore-GenomeSequencingCategory

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
