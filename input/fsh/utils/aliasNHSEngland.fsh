Alias: $nhs-number = https://fhir.nhs.uk/Id/nhs-number
Alias: $ode-code = https://fhir.nhs.uk/Id/ods-organization-code
Alias: $SCT = http://snomed.info/sct
Alias: $UCUM = http://unitsofmeasure.org
Alias: $Obligation = http://hl7.org/fhir/StructureDefinition/obligation

RuleSet: Obligation(code, actor)
* ^extension[$Obligation][+].extension[code].valueCode = {code}
* ^extension[$Obligation][=].extension[actor].valueCanonical = "{actor}"
