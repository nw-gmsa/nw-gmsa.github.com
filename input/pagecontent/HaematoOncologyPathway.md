<div class="alert alert-danger" role="alert">
This is currently being elaborated and subject to change.
</div>

A haemato-oncology order comms system (HODS) orchestrates pathology and genomics
reflex testing for a single referral - see [Inter Laboratory Workflow
(ILW)](ILW.html) for the generic sub-order/reflex pattern this follows
(`LAB-35`/`LAB-36`), and [Cheshire and Merseyside
Pathology](CheshireAndMerseysidePathology.html) for the related pathology-LIMS
(CFT Shire) reflex scenario without HODS orchestration.

### Haematological Malignancy Diagnostic Services

```mermaid
sequenceDiagram


participant EPR as Order Placer
participant LIMS as Order Filler (HODS)
participant LIMSP as Order Filler (Pathology)
participant LIMSG as Order Filler (Genomics)


EPR ->> LIMS: Submit Laboratory Order O21 (LAB-1)

opt Order Filler (HODS) creates Pathology Order


    LIMS ->> LIMSP: Submit Pathology Reflex Order O21 (LAB-35)
    LIMS -->> LIMSP: Send Specimen (not a technical interaction)
    LIMSP -->> LIMSP : Performs Test
    LIMSP ->> LIMS: Send Pathology Report R01 (LAB-36)
end

opt Order Filler (HODS) creates Genomic Order

   
    LIMS ->> LIMSG: Submit Genomic Reflex Order O21 (LAB-35)
    LIMSP -->> LIMSG: Send Specimen (unsure of workflow)
    LIMSG -->> LIMSG : Performs Test
    LIMSG ->> LIMS: Send Genomic Report R01 (LAB-36)
end
LIMS -->> LIMS: Write Report
LIMS ->> EPR: Send Laboratory Report R01 (LAB-3)
```

This pathway can also apply to children's cancer referrals - see [Cancer
NOS](CancerNOS.html#nhs-north-west-children-cancer-example) for the NHS North
West Children Cancer notification example.
