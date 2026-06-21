ValueSet: SpecimenType
Id: specimen-type
Title: "Specimen Type"
Description: """
A subset of [HL7 Europe Laboratory Report ValueSet: Specimen Types](https://build.fhir.org/ig/hl7-eu/laboratory/ValueSet-lab-specimenType-eu-lab.html)
Local codes are provided for backward compatability, SNOMED codes are preferred.
"""

* ^experimental  = false
* $sct#119297000
* $sct#119373006
* $sct#309201001
* $sct#258580003
* $sct#122552005
* $sct#122556008
* $sct#737357006
* $sct#122555007
* $sct#440500007
* $sct#119359002
* $sct#733104004

* $sct#258450006
* $sct#258565009
// 30Apr25 * $NOS#ctDNA "ctDNA"
* $sct#702451000
* $sct#309147000
* $sct#258566005
* $sct#441652008

* $sct#3040001000004100	 "Paraffin embedded tissue block specimen"

* $sct#1003517007 "Freeze dried specimen"
* $sct#122571007 "Pericardial fluid specimen"
* $sct#418564007 "Pleural fluid specimen"
* $sct#119342007 "Saliva specimen"
// 30Apr25 * $NOS#StoredDNA "Stored DNA"
* $sct#441479001 "Fresh tissue specimen"
* $sct#16214131000119100 "Frozen tissue section specimen"
* $sct#122575003 "Urine specimen"
* $sct#441673008 "Ribonucleic acid specimen (specimen)"

* include codes from system $igene

//* $igene#"SAMPLE: Cell Pellet" "Cell Pellet"
//* $igene#"SAMPLE: Liquid Biopsy" "Liquid Biopsy"
//* $igene#"SAMPLE: FFPE-SH" "FFPE - Shavings"
//* $igene#"SAMPLE: FFPE-SL" "FFPE - Slides"
//* $igene#"SAMPLE: FFPE-PCS" "FFPE - Positively Charged Slides"
//* $igene#"SAMPLE: FFPE-WB" "FFPE - Wax block"
//* $igene#"SAMPLE: UNK" "Unknown"

