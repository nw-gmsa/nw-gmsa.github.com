See [North West Genomics HL7 v2 and FHIR Implementation Guide](https://interop-nwengland.github.io/LTW-Genomics/)

Related links:
 - [NW LTW IG using HL7 igPublisher](https://build.fhir.org/ig/Interop-NWEngland/LTW-Genomics/branches/main/index.html)
 - [HL7 FHIR Implementation Guide Build Notications](https://chat.fhir.org/#narrow/stream/179297-committers.2Fnotification)

## Sending HL7 v2 Message

Note files must use CR or CRLF (not unix/mac LF)

### Mac

curl --request POST --data-binary "@OML_O21_PDF.txt" http://192.168.1.50:9980
curl --request POST --data-binary "@ORU_R01_PDF.txt" http://192.168.1.50:9980 

### Windows 

Invoke-RestMethod -Method POST -Uri http://192.168.1.50:9980 -InFile "OML_O21_PDF.txt"
Invoke-RestMethod -Method POST -Uri http://192.168.1.50:9980 -InFile "ORU_R01_PDF.txt"
