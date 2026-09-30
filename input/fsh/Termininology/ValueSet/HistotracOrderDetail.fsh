ValueSet: HistotracOrderDetail
Id: HistotracOrderDetail
Title: "Histotrac Order Detail Codes"
Description: """
All codes from the [Histotrac](CodeSystem-Histotrac.html) CodeSystem - the Patient
Test(s) order-detail restatement codes Histotrac itself uses alongside its Test Code
(OBR-4). Bound to `ServiceRequest.orderDetail` - see
[Histocompatibility and Immunogenetics](https://github.com/nw-gmsa/nw-gmsa-use-cases/blob/main/HistocompatibilityAndImmunogenetics.md) for
the worked examples this covers.
"""
* ^experimental = false

* include codes from system $Histotrac
