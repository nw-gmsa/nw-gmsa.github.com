Instance: assigner
InstanceOf: SearchParameter
Usage: #definition
Description: "Search parameter for searching resource identifier for assigning authority"
* name = "assigner"
* status = #active
* description = "Search parameter for searching resource identifier for assigning authority"
* purpose = "Used for find which organisation (ODS Code) assigned the identifier"
* base[+] = #Patient
* base[+] = #ServiceRequest
* base[+] = #DiagnosticReport
* base[+] = #Observation
* base[+] = #DocumentReference
* base[+] = #Condition
* code = #assigner
* type = #string
* expression = "identifier.assigner.value"
