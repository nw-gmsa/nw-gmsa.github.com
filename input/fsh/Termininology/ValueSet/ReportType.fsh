ValueSet: ReportType
Id: ReportType
Title: "ReportType"
Description: """
Copy of [UKCoreReportCode](https://simplifier.net/hl7fhirukcorer4/valueset-ukcore-reportcode)
"""

* ^experimental  = false

* include codes from system $sct where concept descendent-of "371525003"
