# Seek Key Academic Papers & Forensic Working Papers Archive

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.22761113.svg)](https://doi.org/10.5281/zenodo.22761113)
[![Compile Papers (LaTeX to PDF)](https://github.com/Seek-Key-LTD/papers/actions/workflows/compile-papers.yml/badge.svg)](https://github.com/Seek-Key-LTD/papers/actions/workflows/compile-papers.yml)
[![License: CC BY 4.0](https://img.shields.io/badge/License-CC_BY_4.0-lightgrey.svg)](https://creativecommons.org/licenses/by/4.0/)

> **Official Sovereign Academic Archive**  
> **Entity**: Seek Key Ltd (United Kingdom)  
> **Consortium**: The Seek Key Research Consortium (Singapore Macro Desk & Beijing Forensic Accounting Laboratory)  
> **Repository Mirrors**: 
> - Public & Zenodo Mirror: [https://github.com/Seek-Key-LTD/papers](https://github.com/Seek-Key-LTD/papers)  
> - Internal Tea / Gitea Forge: `git@gitea.capitaltrain.cn:seekkey/papers.git`

---

## 🏛️ Overview

This repository hosts the official preprint manuscripts, formal scientific working papers, mathematical proofs, and forensic balance-sheet investigations produced across the Seek Key multi-agent ecosystem and the *San Geng Dao Chang* (*Kunpengzhi*) research group.

All manuscripts are authored in rigorous, reproducible LaTeX (`.tex`) with complete BibTeX citation chains, vector figures, and mathematical derivations.

### Automated Cloud Publishing Pipeline

```
  Local Agent / Researcher Push (.tex)
                 │
                 ▼
      Internal Gitea ("茶叶")
                 │
                 ▼ (Mirror / Sync)
        GitHub (Seek-Key-LTD)
                 │
        ┌────────┴────────┐
        ▼                 ▼
 GitHub Actions CI      Zenodo (CERN / OpenAIRE)
 (Auto-compile PDF)     (Permanent Global DOI Assignment)
```

---

## 📚 Papers Index

| Paper ID | Title | Topics | Status | PDF |
| :--- | :--- | :--- | :--- | :--- |
| **SK-WP-2026-001** | **Temporal Asymmetry, Derivative Traps, and Capital Training in Fragmented Asian Equity Markets** | Market Microstructure, Calendar Asymmetry, CFFEX IF300, Behavioral Heuristics, Forensic Epistemology | `Preprint v1.0` | [Download PDF](../../releases) |

---

## 💻 Local Compilation

To compile any paper locally without full TeXLive installation, we recommend `tectonic` or VS Code with `LaTeX Workshop`:

```bash
# Using tectonic (fast, self-downloading packages)
cd papers/01-temporal-asymmetry-and-capital-training
tectonic main.tex

# Or using standard latexmk
latexmk -xelatex -pdf main.tex
```

---

## 📜 Citation

To cite this repository or any working paper from the Seek Key Research Consortium:

```bibtex
@techreport{seekkey2026temporal,
  author      = {{The Seek Key Research Consortium}},
  title       = {Temporal Asymmetry, Derivative Traps, and Capital Training in Fragmented Asian Equity Markets},
  institution = {Seek Key Ltd},
  year        = {2026},
  number      = {SK-WP-2026-001},
  url         = {https://github.com/Seek-Key-LTD/papers}
}
```

---

## ⚖️ License

The written academic papers and documentation in this repository are licensed under a [Creative Commons Attribution 4.0 International License (CC BY 4.0)](https://creativecommons.org/licenses/by/4.0/). Code, scripts, and build workflows are licensed under the [MIT License](LICENSE).
