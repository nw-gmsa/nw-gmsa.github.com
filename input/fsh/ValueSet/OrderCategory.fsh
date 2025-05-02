ValueSet: OrderCategory
Id: order-category
Title: "Order Category"
Description: """
Top level classification of Genomic Test Directory
"""

* ^experimental  = false

* $sct#1186936003 "Storage of specimen (procedure)"
* $NOS#rare-disease "Rare Disease"
* $NOS#rare-and-inherited-disease "Rare and Inherited Disease"
* $NOS#solid-tumour "Solid Tumour"
* $NOS#haematological-cancer "Haematological Cancer"
* $NOS#somatic-cancer "Somatic Cancer"
