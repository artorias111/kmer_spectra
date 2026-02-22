process count_kmers {
  shell '/bin/bash', '-euo', 'pipefail'

  input:
  path reads

  output:
  path "*.jf", emit: jellyfish_binary

  script:
  def canonical = params.canonical ? "-C" : ""
  def outname   = params.canonical ? "${params.id}.${params.ksize}.jf" : "${params.id}.${params.ksize}.noncanonical.jf"

  """
  pigz -dc ${reads} | jellyfish count /dev/stdin ${canonical} -m ${params.ksize} -s ${params.memory} -t ${params.threads} -o ${outname}
  """
}


process kmer_db_to_histogram_counts {
  input:
  path jellyfish_db
  publishDir '.', mode: 'copy'

  output:
  path "*.histo", emit: histogram_counts

  script:
  """
  jellyfish histo ${jellyfish_db} > ${params.id}.${params.ksize}.histo
  """
}
