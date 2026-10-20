Instance:  GenomicAnalysisAndInterpretation
InstanceOf: ActorDefinition
Title:   "Genomic Analysis and Interpretation"
Usage:  #definition

* name = "GenomicAnalysisAndInterpretation"
* type = http://hl7.org/fhir/examplescenario-actor-type#system
* status = http://hl7.org/fhir/publication-status#draft
* description = """
Analyses and interprets raw genomic data. Implemented by bioinformatics pipelines and Decision Support Systems (DSS), e.g. Omics DSS, or the Genomics England bioinformatics pipeline, interpretation services and Interpretation Portal.
"""
* documentation = """
Receives raw genomic data (e.g. sequence data or satellite LIMS results) produced by analysers, together with the work order and its case context (e.g. pedigree, phenotype, clinical indication and panels).
Processes the raw data into variants and prioritises them (bioinformatics pipeline).
Supports interpretation, often with a clinical scientist involved, to select and classify the reportable variants.
Returns the reportable variants and a summary interpretation (e.g. a genomic report) to the Order Filler.
This actor may later be split into a Bioinformatics Processor and an Interpretation / Decision Support actor.
"""
