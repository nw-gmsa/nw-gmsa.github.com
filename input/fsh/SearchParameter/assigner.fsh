Instance: assigner
InstanceOf: SearchParameter
Usage: #definition
Description: "Search parameter for searching resource identifier for assigning authority"
* name = "assigner"
* status = #active
* description = "Search parameter for searching resource identifier for assigning authorit"
* purpose = "Searching resource identifier for assigning authority"
* base[+] = #Patient
* base[+] = #ServiceRequest
* base[+] = #DiagnosticReport
* base[+] = #Observation
* code = #assigner
* type = #string
* expression = "identifier.assigner.value"
* comparator[+] = #eq
