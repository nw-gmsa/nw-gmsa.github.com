ValueSet: OrderCategory
Id: order-category
Title: "Order Category"
Description: """
Top level classification of Genomic Test Directory
"""

* ^experimental  = false

* $NOS#RareAndInheritedDiseasesGeneticTesting "Rare and inherited diseases Genetic Testing (procedure)"
* $sct#1186936003 "Storage of specimen (procedure)"
* $NOS#PreNatalGeneticTesting "Pre Natal Genetic Testing (procedure)"
* $NOS#HaemoglobinopathyGeneticTesting "Haemoglobinopathy Genetic Testing (procedure)"
* $NOS#CancerGeneticTesting "Cancer Genetic Testing (procedure)"
