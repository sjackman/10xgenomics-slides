---
title: Efficient Assembly of Large Genomes
subtitle: Journal Club, 10x Genomics, Pleasanton, California
author: Shaun Jackman
date: 2019-Oct-25
hash: true
slideNumber: true
---

## Shaun Jackman

| Computational Biology, 10x Genomics
| Vancouver, Canada
| [\@sjackman][] &middot; [github.com/sjackman][] &middot; [sjackman.ca][]

[![Photo](images/sjackman.jpg)][sjackman.ca]

[\@sjackman]: https://twitter.com/sjackman
[github.com/sjackman]: https://github.com/sjackman
[sjackman.ca]: https://sjackman.ca

------------------------------------------------------------

![Dr. Shaun Jackman<br>UBC 2019-May-27](images/DrShaunJackman.jpg){height=500px}

## Efficient Assembly<br>of Large Genomes

1. Introduction
2. **ABySS 2.0**
3. **Tigmint**
4. UniqTag
5. ORCA
6. Organellar genomes of white spruce
7. Mitochondrial genome of Sitka spruce
8. **Genome assembly of western redcedar**
9. Conclusion

------------------------------------------------------------

::: {.columns style="font-size: 18pt"}
:::: column
| **Tigmint**
| *BMC Bioinformatics*
| 2018 [doi.org/cwfh](https://doi.org/cwfh)
| [![Tigmint](images/Tigmint-BMC.png){height=100px}](https://doi.org/10.1186/s12859-018-2425-6)
| **ABySS 2.0**
| *Genome Research*
| 2017 [doi.org/f9x8qp](https://doi.org/f9x8qp)
| [![ABySS 2.0](images/ABySS-2.0-2017.png){height=100px}](https://doi.org/10.1101/gr.214346.116)
| **ORCA**
| *Bioinformatics*
| 2019 [doi.org/c4mw](https://doi.org/c4mw) 
| [![ORCA](images/orca-paper.png){height=100px}](https://doi.org/10.1093/bioinformatics/btz278)
::::
:::: column
| **Sitka Spruce Mitochondrion**
| *bioRxiv*
| 2019 [doi.org/c4mv](https://doi.org/c4mv)
| [![Sitka Spruce Mitochondrion](images/psitchensismt-paper.png){height=100px}](https://doi.org/10.1101/601104)
| **White Spruce Organelles**
| *Genome Biology and Evolution*
| 2016 [doi.org/f8bxck](https://doi.org/f8bxck)
| [![Organellar Genomes of White Spruce](images/white-spruce-organelles.png){height=100px}](https://doi.org/10.1093/gbe/evv244)
| **UniqTag**
| *PLOS ONE*
| 2015 [doi.org/c3m3](https://doi.org/c3m3)
| [![UniqTag](images/UniqTag-PLOSONE-small.png){height=100px}](https://doi.org/10.1371/journal.pone.0128026)
::::
:::

## Publications

- Five first-author (or joint) papers
- One paper each year from 2015 through 2019
- Collaborated on 32 papers since 2009
- 29 papers with at least 10 citations
- ABySS has been cited over 2,900 times!

[![Citations of ABySS (Google Scholar)](images/abyss-citations.png)](https://scholar.google.ca/citations?user=wFl3qXAAAAAJ&hl=en)

## Short Read Genome Assembly

| ABySS 1.0 (2009) was the first to assemble
| a human genome from short reads (42 bp!)

[![ABySS 1.0 paper](images/abyss-paper.png)](https://doi.org/10.1101/gr.089532.108)

----------------------------------------

[![ABySS 1.0 logo](images/abyss-logo.png)](https://github.com/bcgsc/abyss)

- de Bruijn graph assembler
- Stored *k*-mers in a hash table
- Distributed the hash table over many machines
- Used MPI to aggregate sufficient memory
- Assembles large genomes

----------------------------------------

### Challenges

1. Uses lots of memory
2. Network communication is super slow
3. Message passing is also slow

### Solution

1. | A memory-efficient data structure
   | reduces memory usage
2. | Fitting entire graph in a single machine
   | eliminates network communication
3. | Using shared memory (OpenMP)
   | eliminates message passing (MPI)

----------------------------------------

[![ABySS 2.0 logo](images/abyss2-logo.png)](https://github.com/bcgsc/abyss)

| ABySS 2.0 reduces the memory
| usage of ABySS by ten fold.

[![ABySS 2.0 paper](images/ABySS-2.0-2017.png)](https://doi.org/10.1101/gr.214346.116)

----------------------------------------

![Memory efficient de Bruijn graph using a Bloom filter<br>Memory usage is independent of *k*](images/abyss2-data-structures.png){height=550px}

----------------------------------------

![Navigating a Bloom filter de Bruijn graph](images/abyss2-bloom-dbg-nav.png)

----------------------------------------

![Sequencing errors and Bloom filter false positives](images/abyss2-error-correction.png)


## Spruce genome assemblies

| ABySS          | 1.3.5     | 2.0.0
|----------------|-----------|----------
| Spruce species | Interior  | Sitka
| Machines       | 115       | 1
| RAM (GB)       | 4,300     | 500
| CPU cores      | 1,380     | 64
| CPU time\*     | 6.0 years | 3.2 years

<small>\* Time of unitig assembly without scaffolding</small>

----------------------------------------

![Human: 42 Mbp NG50 with linked reads and BioNano](images/abyss2-ideogram.png){height=600px}

## ABySS 2.0 Conclusions

- | ABySS 2.0 reduces memory usage by 10 fold
  | from 418 GB to 34 GB for human
  | from 4,300 GB to 500 GB for spruce
- | High-throughput short-read sequencing
  | combined with large molecule scaffolding
  | such as linked reads and optical mapping
  | permits cost effective assembly of large genomes

------------------------------------------------------------

## Linked Reads

| ![Linked reads](images/linked-reads.png)

## Contigs and scaffolds<br>come to an end due to...

| repeats
| sequencing gaps
| structural variation
| **misassemblies**

----------------------------------------

| ![Elephant jigsaw puzzle](images/elephant-puzzle.jpg){height=600px}

----------------------------------------

| ![Misassembled](images/tigmint-diagram-1.png)
| Correct misassemblies
| ![Correct misassemblies](images/tigmint-diagram-2.png)
| Scaffold
| ![Scaffold](images/tigmint-diagram-3.png)

----------------------------------------

[![Tigmint](images/tigmint.png){height=150px}](https://github.com/bcgsc/tigmint)

![](images/tigmint-depth.png){height=400px}

----------------------------------------

[![Jupiter plot of human HG004](images/tigmint-jupiter.png)](https://github.com/JustinChu/JupiterPlot)

<small><https://github.com/JustinChu/JupiterPlot></small>

----------------------------------------

| ![Human genome assembly (GIAB HG004 NA24143)](images/tigmint-metrics-abyss.png){height=400px}

::: {style="font-size: 18pt"}

| Assembly Tools             | NGA50  | 
|----------------------------|-------:|
| ABySS 2.0                  | 3 Mbp  |
| ABySS 2.0 + ARCS           | 8 Mbp  |
| ABySS 2.0 + Tigmint + ARCS | 16 Mbp |

Tigmint reduced misassemblies by 216 (27% reduction)

:::

----------------------------------------

![Corrects and improves long read assemblies too!](images/tigmint-metrics-sms.png)

| Sequencing   | <span style="color: #24a17b">Nanopore</span> | <span style="color: #d95900">PacBio</span> |
| ------------ | -------: | -------: |
| Assembler    | <span style="color: #24a17b">Canu</span> | <span style="color: #d95900">Falcon</span> |
| NGA50 before | 5.4 Mbp  | 4.2 Mbp  |
| NGA50 after  | 10.9 Mbp | 12.0 Mbp |
| Improvement  | 2.0 fold | 2.9 fold |

## Tigmint Conclusions

Scaffolding after correcting with Tigmint yields an assembly both more correct and more contiguous

Linked reads permit cost-effective assembly of large genomes using high-throughput sequencing

## Western redcedar (*Thuja plicata*)

![Western redcedar (*Thuja plicata*)](images/western-redcedar.jpg){height=500px}
![Range](images/western-redcedar-range.png){height=500px}

## Western Redcedar Methods

| ![Flowchart of western redcedar methods](images/redcedar-flowchart.png){height=500px}

::: notes

- Trim adapters with **Trimadap** and **NxTrim**
- Count k-mers with **ntCard**
- Estimate genome size **GenomeScope**
- Assemble PE and MP reads with **ABySS 2.0**
- Correct assembly errors \
  with Chromium reads using **Tigmint**
- Scaffold with Chromium reads using **ARCS**
- Assess genome completeness using **BUSCO**

:::

## Conifer Assemblies

::: {style="font-size: 18pt"}

| Year | Species                 | Scaffold N50 |
|-----:|-------------------------|-------------:|
| 2018 | **Western redcedar**    |    2,310 kbp |
| 2017 | Sugar pine^2^           |    2,510 kbp |  
| 2017 | Douglas fir             |      341 kbp |
| 2017 | Loblolly pine^2^        |      108 kbp |
| 2016 | Sugar pine^1^           |      247 kbp |
| 2015 | Interior white spruce^2^|       83 kbp |
| 2015 | White spruce            |       20 kbp |
| 2014 | Loblolly pine^1^        |       67 kbp |
| 2013 | Interior white spruce^1^|       20 kbp |
| 2013 | Norway spruce           |        5 kbp |

^1^initial assembly ^2^improved assembly

:::

## Efficient Assembly<br>of Large Genomes

1. Introduction
2. **ABySS 2.0** <small>([doi.org/f9x8qp](https://doi.org/f9x8qp))</small>
3. **Tigmint** <small>([doi.org/cwfh](https://doi.org/cwfh))</small>
4. UniqTag <small>([doi.org/c3m3](https://doi.org/c3m3))</small>
5. ORCA <small>([doi.org/c4mw](https://doi.org/c4mw))</small>
6. Organellar genomes of white spruce <small>([doi.org/f8bxck](https://doi.org/f8bxck))</small>
7. Mitochondrial genome of Sitka spruce <small>([doi.org/c4mv](https://doi.org/c4mv))</small>
8. **Genome assembly of western redcedar**
9. Conclusion

----------------------------------------

**Think of each molecule of linked reads as a long read.**

Can we assemble these molecules using \
an overlap-layout-consensus approach \
without first assembling the reads?

----------------------------------------

![Physical Map of Linked Read Molecules](images/physlr-logo.png)

## **Overlap** Layout Consensus

- Each barcode of linked reads is a bag of *k*-mers
- Keep only the minimizers of each read for efficiency
- Reduce a hundred *k*-mers per read to five minimizers
- Discard most frequent minimizers, likely repetitive
- Count shared minimizers per pair of barcodes

## Barcode Overlap Graph

- Each barcode is a vertex
- Each edge is the overlap between two barcodes
- Edge weight is number of shared minimizers

----------------------------------------

![Physlr contig of the Sitka spruce plastid (120 kbp)](images/physlr-plastid.png)

## Separate Molecules

- We have the barcode overlap graph \
  but we want the molecule overlap graph
- Separate each barcode into its component molecules
- Look at the neighborhood graph of each barcode \
  (vertex-induced subgraph of its immediate neighbors)
- Each community is one molecule

----------------------------------------

![Neighborhood graph of one barcode with two molecules](images/physlr-molecules.png)

## Overlap **Layout** Consensus

- A layout is a linear ordering of molecules
- Find a path through the molecule overlap graph
- Solve the traveling salesman problem
- Optimal solution is NP-hard
- Approximate solution is good enough
- Start with a maximum spanning tree (MST)

----------------------------------------

![Maximum spanning tree of fruit fly chr4 (1.35 Mbp)](images/physlr-mst.png){height=400px}

## Maximum Spanning Tree (MST)

- Compute the maximum spanning tree
- Prune short branches of the MST
- Assemble contigs from simple non-branching paths
- Inspired by MSTmap used for genetic linkage maps

<br>

MSTmap: Efficient and Accurate Construction of Genetic Linkage Maps from the Minimum Spanning Tree of a Graph \
Wu *et. al* (2018) [doi.org/d4sqs8](https://doi.org/d4sqs8)

----------------------------------------

![Physlr physical map of fruit fly (138 Mbp)](images/physlr-fly.png)

----------------------------------------

![Zebrafish (1.35 Gbp)](images/physlr-zebrafish.png)

12.7 Mbp NG50, 25 chromosomes in 144 contigs \
4.8 Mbp NG50 for Supernova

----------------------------------------

![Human (3.09 Gbp)](images/physlr-human.png)

40.9 Mbp NG50, 23 chromosomes in 95 contigs \
38.5 Mbp NG50 for Supernova 

## Scaling Up to Larger Genomes

### Western redcedar (12 Gbp)
### Sitka spruce (20 Gbp)

## Overlap Layout **Consensus**

- Scaffold by mapping contigs to the physical map
- Targeted assembly of a chromosome, or a smaller region
- Assemble the complete genome using multiple targeted assemblies

----------------------------------------

![Vancouver, Canada](images/vancouver.jpg)

<small>Photo by Martin Krzywinski</small>

## fin

## Supplemental Slides

----------------------------------------

[![Google Scholar profile of Shaun Jackman](images/google-scholar-20190318.png){height=650px}](https://scholar.google.ca/citations?user=wFl3qXAAAAAJ)

## Physlr Run Time

| ![Run time](images/physlr-time.png)

## Physlr Memory Usage

| ![Memory usage](images/physlr-memory.png)

----------------------------------------

![Physlr contig of fruit fly chr4 (1.35 Mbp)](images/physlr-flychr4.png)

## First-author Publications

::: {style="font-size: 18pt"}

- Largest Complete Mitochondrial Genome of a Gymnosperm, Sitka Spruce (*Picea sitchensis*), Indicates Complex Physical Structure \
    <small>
    **SD Jackman**, L Coombe, RL Warren, H Kirk, E Trinh, T McLeod, S Pleasance, P Pandoh, Y Zhao, RJ Coope, J Bousquet, J Bohlmann, SJM Jones, I Birol \
    *bioRxiv* 2019
    </small>
- ORCA: A Comprehensive Bioinformatics Container Environment for Education and Research \
    <small>
    **SD Jackman**, T Mozgacheva, S Chen, B O'Huiginn, L Bailey, I Birol, SJM Jones \
    *Bioinformatics* 2019
    </small>
- Tigmint: correcting assembly errors using linked reads from large molecules \
    <small>
    **SD Jackman**, L Coombe, J Chu, RL Warren, BP Vandervalk, ... \
    *BMC Bioinformatics* 2018
    </small>
- ABySS 2.0: resource-efficient assembly of large genomes using a Bloom filter \
    <small>
    **SD Jackman**^\*^, BP Vandervalk^\*^, H Mohamadi, J Chu, S Yeo, SA Hammond, ... \
    *Genome Research* 2017
    </small>
- Organellar genomes of white spruce (*Picea glauca*): assembly and annotation \
    <small>
    **SD Jackman**, RL Warren, EA Gibb, BP Vandervalk, H Mohamadi, J Chu, ... \
    *Genome Biology and Evolution* 2015
    </small>
- UniqTag: content-derived unique and stable identifiers for gene annotation \
    <small>
    **SD Jackman**, J Bohlmann, I Birol \
    *PLOS ONE* 2015
    </small>

:::

## Selected Publications

- Assembly of the complete Sitka spruce chloroplast...
    <small>
    L Coombe, RL Warren, **SD Jackman**, C Yang, BP Vandervalk, ..., I Birol \
    *PloS one* 2016
    </small>
- Spaced seed data structures for de novo assembly \
    <small>
    I Birol, J Chu, H Mohamadi, **SD Jackman**, K Raghavan, ..., RL Warren \
    *International journal of genomics* 2015
    </small>
- Konnector v2.0: pseudo-long reads from PE sequencing \
    <small>
	BP Vandervalk, C Yang, Z Xue, K Raghavan, J Chu, H Mohamadi, **SD Jackman**, ..., I Birol \
	*BMC medical genomics* 2015
	</small>
- Sealer: a scalable gap-closing application... \
	<small>
	D Paulino, RL Warren, BP Vandervalk, A Raymond, **SD Jackman**, I Birol \
	*BMC Bioinformatics* 2015
	</small>
- On the representation of de Bruijn graphs \
	<small>
	R Chikhi, A Limasset, **SD Jackman**, JT Simpson, P Medvedev \
	*Journal of Computational Biology* 2015
	</small>
- Improved white spruce (*Picea glauca*) genome... \
	<small>
	RL Warren, CI Keeling, MMS Yuen, A Raymond, GA Taylor, ..., J Bohlmann \
	*The Plant Journal* 2015
	</small>
- Assembling the 20Gb white spruce genome... \
	<small>
	I Birol, A Raymond, **SD Jackman**, S Pleasance, R Coope, ..., SJM Jones \
	*Bioinformatics* 2013
	</small>

## ABySS 1.0

|             | Human       | Spruce
|-------------|-------------|----------
| Genome size | 3 Gbp       | 20 Gbp
| RAM         | 418 GB      | 4.3 TB
| CPU cores   | 64          | 1,380
| Wall time   | 14 hours    | 12 days
| Year        | 2009 & 2017 | 2013
| Short DOI   | [doi.org/f9x8qp](https://doi.org/f9x8qp) | [doi.org/f4zzrr](https://doi.org/f4zzrr)

----------------------------------------

![Solid reads are extended using the Bloom filter de Bruijn graph to assemble unitigs](images/abyss2-read-extension.png)

----------------------------------------

![ABySS 2.0 reduces memory usage by 10 fold vs ABySS 1.0 for human genome assembly (GIAB HG004 NA24143)](images/abyss2.mem-vs-time.png){height=550px}

## Spruce genome assemblies

| ABySS              | 1.3.5    | 2.0.0
|--------------------|----------|----------
| Spruce species     | Interior | Sitka
| Machines           | 115      | 1
| RAM (GB)           | 4,300    | 500
| CPU cores          | 1,380    | 64
| CPU time\* (years) | 6.0      | 3.2
| Wall time\* (days) | 1.6      | 18
| Year               | 2013     | 2017
| Short DOI          | [doi:f4zzrr](https://doi.org/f4zzrr) | NA

<small>\* Time of unitig assembly without scaffolding</small>

----------------------------------------

![Contiguity and correctness are comparable](images/abyss2-metrics.png){height=600px}

## Tools for Linked Reads

| **Align linked reads**
| Lariat (Long Ranger) &middot; EMA
| **Structural variants**
| Long Ranger &middot; GROC-SVs &middot; NAIBR &middot; SVenX &middot; Topsorter
| **Phase variants**
| Long Ranger
| **Genome sequence assembly**
| Supernova
| **Scaffolding**
| ARCS &middot; Architect &middot; Fragscaff &middot; Scaff10x

<https://github.com/johandahlberg/awesome-10x-genomics>

## Tigmint Method

- Map reads to the assembly
- Group reads within *d* bp of each other (*d* = 50 kbp)
- Infer start and end coordinates of molecules
- Construct an interval tree of the molecules
- Each *w* bp region ought to be spanned by *n* molecules \
  (*w* = 1 kbp, *n* = 20)
- Identify regions with fewer than *n* spanning molecules
- Cut sequences at regions with insufficient coverage

----------------------------------------

| ![Human genome assemblies (GIAB HG004 NA24143)](images/tigmint-metrics.png){height=500px}

Note: Supernova used only linked reads, others PE+MP+LR.

## Tigmint Time and Memory

| **`bwa mem`** Map reads to assembly
| 5&frac12; hours, 17 GB RAM, 48 threads
| **`tigmint-molecule`** Group reads into molecules
| 3&frac14; hours, 0.08 GB RAM, 1 thread
| **`tigmint-cut`** Identify misassemblies and cut sequences
| 7 minutes, 3.3 GB RAM, 48 threads

## Western Redcedar Assembly

- 12.5 Gbp genome size estimated by flow cytometry \
  (Hizume *et al.* 2001 [doi.org/d89svf](https://doi.org/d89svf))
- 9.8 Gbp genome size estimated by GenomeScope
- 8.0 Gbp assembled in scaffolds 1 kbp or larger

[![GenomeScope results](images/redcedar-genomescope.png){height=300px}](http://qb.cshl.edu/genomescope/analysis.php?code=Tt3dme47ZFnwHPqVkqqT)

## Western Redcedar BUSCO

60.4% of core single-copy genes present (BUSCO)

- 53.9% complete
- 6.5% fragmented
- 39.6% missing
