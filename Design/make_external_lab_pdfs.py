"""Generate the two fictitious external laboratory report PDFs used by the
Results from other laboratories examples of the Composition Genomic Report.

Usage (needs PyMuPDF: pip install pymupdf):

    python3 Design/make_external_lab_pdfs.py input/images

The PDFs are published from input/images and linked from the profile page.
The same PDFs are embedded, base64 encoded, in the Binary instances
input/fsh/Examples/Somatic/Binary-ExternalLab-Germany-EML4-ALK.fsh and
input/fsh/Examples/WGS/Binary-ExternalLab-RepeatExpansion.fsh, so update their
data element if the PDFs are regenerated.
"""
import sys
import fitz

W, H = 595, 842  # A4 points
M = 50


def report(path, lab, lab_lines, title, patient_rows, sections, results=None, signed=None):
    doc = fitz.open()
    page = doc.new_page(width=W, height=H)
    y = M

    def text(s, size=10, bold=False, color=(0, 0, 0), x=M):
        nonlocal y
        font = "hebo" if bold else "helv"
        page.insert_text((x, y), s, fontsize=size, fontname=font, color=color)
        y += size + 5

    def para(s, size=10):
        nonlocal y
        line = ""
        for word in s.split():
            trial = (line + " " + word).strip()
            if fitz.get_text_length(trial, fontname="helv", fontsize=size) > W - 2 * M:
                page.insert_text((M, y), line, fontsize=size, fontname="helv")
                y += size + 4
                line = word
            else:
                line = trial
        page.insert_text((M, y), line, fontsize=size, fontname="helv")
        y += size + 10

    # Banner
    page.draw_rect(fitz.Rect(W - M - 150, M - 14, W - M, M + 6), color=(0.8, 0, 0), width=1)
    page.insert_text((W - M - 143, M), "FICTITIOUS EXAMPLE", fontsize=10, fontname="hebo", color=(0.8, 0, 0))
    text(lab, 14, bold=True)
    for line in lab_lines:
        text(line, 9, color=(0.3, 0.3, 0.3))
    y += 6
    page.draw_line((M, y), (W - M, y), color=(0, 0, 0), width=1.5)
    y += 20
    text(title, 13, bold=True)
    y += 4
    for label, value in patient_rows:
        page.insert_text((M, y), label, fontsize=10, fontname="hebo")
        page.insert_text((M + 140, y), value, fontsize=10, fontname="helv")
        y += 15
    y += 6
    page.draw_line((M, y), (W - M, y), color=(0.6, 0.6, 0.6), width=0.5)
    y += 18
    for heading, body in sections:
        text(heading, 11, bold=True)
        para(body)
        if heading == "Results" and results:
            header, rows = results
            cols = [M, M + 150, M + 260, M + 370]
            for i, h in enumerate(header):
                page.insert_text((cols[i], y), h, fontsize=9, fontname="hebo")
            y += 13
            for row in rows:
                for i, v in enumerate(row):
                    page.insert_text((cols[i], y), v, fontsize=9, fontname="helv")
                y += 12
            y += 8
    if signed:
        y += 6
        text("Authorised by", 11, bold=True)
        para(signed)
    page.insert_text((M, H - 30), "Page 1 of 1", fontsize=8, fontname="helv", color=(0.4, 0.4, 0.4))
    page.insert_text((W - M - 230, H - 30), patient_rows[0][1] + ", " + patient_rows[1][1],
                     fontsize=8, fontname="helv", color=(0.4, 0.4, 0.4))
    doc.save(path, garbage=4, deflate=True)


out = sys.argv[1]

report(
    f"{out}/ExternalLab-Germany-EML4-ALK-Report.pdf",
    "Institut für Molekularpathologie Musterstadt",
    ["Musterstraße 1, 12345 Musterstadt, Germany"],
    "Molecular Pathology Report - RNA Fusion Analysis",
    [("Patient", "Tommen BIRMINGHAM"), ("Date of birth", "07-Sep-1999"),
     ("Report number", "MP-2025-004711"), ("Report date", "12-Mar-2025"),
     ("Specimen", "FFPE lung biopsy, collected 04-Mar-2025"), ("Tumour content", "60%")],
    [("Clinical question", "Lung adenocarcinoma. Testing for gene fusions to guide first-line treatment."),
     ("Results", "EML4-ALK fusion detected: EML4 exon 13 :: ALK exon 20 (variant 1). "
                 "No ROS1, RET, NTRK1, NTRK2 or NTRK3 fusion and no MET exon 14 skipping detected."),
     ("Interpretation", "This ALK rearrangement is predictive of response to ALK tyrosine kinase inhibitors."),
     ("Method and limitations", "Targeted RNA-based next generation sequencing fusion panel (ALK, ROS1, RET, "
                                "NTRK1-3, MET exon 14 skipping). Fusions with partners or breakpoints not covered "
                                "by the panel may not be detected.")],
    signed="Dr. med. Erika Mustermann, Consultant Pathologist (Fachärztin für Pathologie)",
)

report(
    f"{out}/ExternalLab-RepeatExpansion-Report.pdf",
    "Regional Neurogenetics Laboratory",
    ["Example Hospital, Example Road, Exampletown"],
    "Neurogenetics Report - Repeat Expansion Testing",
    [("Patient", "Robert BLACKBURN"), ("Date of birth", "14-Jan-1965"),
     ("NHS number", "973 738 3370"), ("Report number", "NG24-01873"), ("Report date", "14-May-2024"),
     ("Specimen", "Peripheral blood (EDTA), received 22-Apr-2024")],
    [("Clinical question", "Progressive cerebellar ataxia from age 55, no family history. "
                           "Testing for the common repeat expansion ataxias."),
     ("Results", "All alleles tested are within the normal range."),
     ("Interpretation", "These results exclude spinocerebellar ataxia types 1, 2, 3, 6, 7 and 17, "
                        "DRPLA and Friedreich ataxia as the cause of this patient's ataxia."),
     ("Method and limitations", "Fluorescent PCR and fragment analysis, with repeat-primed PCR for FXN. "
                                "Other repeat expansion loci, including RFC1 (CANVAS), were not tested. "
                                "Normal ranges in this example are illustrative.")],
    results=(["Gene (disorder)", "Repeat", "Alleles", "Normal range"],
             [["ATXN1 (SCA1)", "CAG", "29, 30", "35 or fewer"],
              ["ATXN2 (SCA2)", "CAG", "22, 22", "31 or fewer"],
              ["ATXN3 (SCA3)", "CAG", "23, 27", "44 or fewer"],
              ["CACNA1A (SCA6)", "CAG", "11, 13", "18 or fewer"],
              ["ATXN7 (SCA7)", "CAG", "10, 12", "27 or fewer"],
              ["TBP (SCA17)", "CAG/CAA", "36, 38", "40 or fewer"],
              ["ATN1 (DRPLA)", "CAG", "15, 17", "35 or fewer"],
              ["FXN (Friedreich ataxia)", "GAA", "9, 17", "33 or fewer"]]),
    signed="Dr A Example, Consultant Clinical Scientist",
)
print("ok")
