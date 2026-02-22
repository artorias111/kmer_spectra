include { count_kmers } from './bin/jellyfish.nf'
include { kmer_db_to_histogram_counts } from './bin/jellyfish.nf'

include { plot_kmer_spectra } from './bin/genomescope.nf'



workflow {
  // Input: directory path; glob all .fastq.gz files in it
  reads = Channel.fromPath("${params.reads}/*.fastq.gz", checkIfExists: true)

  count_kmers(reads)
  kmer_db_to_histogram_counts(count_kmers.out.jellyfish_binary)
  plot_kmer_spectra(kmer_db_to_histogram_counts.out.histogram_counts)
}