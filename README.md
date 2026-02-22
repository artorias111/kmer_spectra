# kmer_spectra

Nextflow pipeline for k-mer counting (Jellyfish) and genome spectrum fitting (GenomeScope).

## Quick run

Run directly from GitHub:

```bash
nextflow run artorias111/kmer_spectra --reads /path/to/dir/with/fastq.gz --id sequence_id
```

This uses the default parameters. The pipeline will pick up all `*.fastq.gz` files in the given directory.

## Parameters

| Parameter   | Default | Description                          |
|------------|---------|--------------------------------------|
| `--reads`  | (required) | Directory containing `*.fastq.gz` files |
| `--id`     | null    | Sample/output prefix                 |
| `--ksize`  | 21      | K-mer size                           |
| `--memory` | 100G    | Jellyfish hash size                  |
| `--threads`| 18      | Number of threads                    |
| `--canonical` | true | Use canonical k-mers (Jellyfish -C)  |

## Requirements

- Nextflow
- Jellyfish
- GenomeScope (R; Conda env set in `params.genomescope_env`)
