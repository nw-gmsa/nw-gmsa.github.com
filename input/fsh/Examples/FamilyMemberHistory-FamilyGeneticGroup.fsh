Instance: FamilyMemberHistory-London-Mother
InstanceOf: FamilyMemberHistory
Title: "FamilyMemberHistory - Cersei London (mother of Baby London)"
Description: "FamilyMemberHistory for Cersei London, mother of the proband Baby London. Referenced from the London Family Genetic Groups."
Usage: #example

* status = #completed
* identifier[0].use = #official
* identifier[0].type = $v2-0203#NH
* identifier[0].system = $nhs-number
* identifier[0].value = "9737383230"
* patient = Reference(Patient-FetusLondon)
* patient.display = "Baby London"
* relationship = $v3-RoleCode#MTH "mother"
* name = "Cersei London"
* sex = http://hl7.org/fhir/administrative-gender#female
* bornDate = "1973-10-03"

Instance: FamilyMemberHistory-London-Father
InstanceOf: FamilyMemberHistory
Title: "FamilyMemberHistory - Jaime Lancaster (father of Baby London)"
Description: "FamilyMemberHistory for Jaime Lancaster, father of the proband Baby London. Referenced from the London Trio Family Genetic Group."
Usage: #example

* status = #completed
* identifier[0].use = #official
* identifier[0].type = $v2-0203#NH
* identifier[0].system = $nhs-number
* identifier[0].value = "9737383214"
* patient = Reference(Patient-FetusLondon)
* patient.display = "Baby London"
* relationship = $v3-RoleCode#FTH "father"
* name = "Jaime Lancaster"
* sex = http://hl7.org/fhir/administrative-gender#male
* bornDate = "1970-07-27"

Instance: FamilyMemberHistory-dWGS-Trio-r26000000203-p26000000105
InstanceOf: FamilyMemberHistory
Title: "FamilyMemberHistory - Thirteen Editestpatient (p26000000105)"
Description: "FamilyMemberHistory for Thirteen Editestpatient, family member of the dWGS Trio r26000000203 proband Gilly Brough."
Usage: #example

* status = #completed
* identifier[0].use = #official
* identifier[0].type = $v2-0203#NH
* identifier[0].system = $nhs-number
* identifier[0].value = "9999999581"
* patient.identifier.system = $nhs-number
* patient.identifier.value = "9737383362"
* patient.display = "Gilly Brough (p26000000104)"
* relationship = $v3-RoleCode#FAMMEMB "family member"
* name = "Thirteen Editestpatient"
* bornDate = "1960-01-01"

Instance: FamilyMemberHistory-dWGS-Trio-r26000000203-p26000000106
InstanceOf: FamilyMemberHistory
Title: "FamilyMemberHistory - Six Editestpatient (p26000000106)"
Description: "FamilyMemberHistory for Six Editestpatient, family member of the dWGS Trio r26000000203 proband Gilly Brough."
Usage: #example

* status = #completed
* identifier[0].use = #official
* identifier[0].type = $v2-0203#NH
* identifier[0].system = $nhs-number
* identifier[0].value = "9999999514"
* patient.identifier.system = $nhs-number
* patient.identifier.value = "9737383362"
* patient.display = "Gilly Brough (p26000000104)"
* relationship = $v3-RoleCode#FAMMEMB "family member"
* name = "Six Editestpatient"
* bornDate = "1988-01-14"
