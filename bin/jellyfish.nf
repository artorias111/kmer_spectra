process count_kmers {
  input: 
  path reads

  output: 
  path *.jf, emit: jellyfish_binary

  script:
  if (params.canonical == true) {
    """
    jellyfish count <(pigz -dc ${reads}) -C -m ${params.ksize} -s ${params.memory} -t ${params.threads} -o ${params.id}.${params.ksize}.jf
    """
  } else {
    """
    jellyfish count <(pigz -dc ${reads}) -m ${params.ksize} -s ${params.memory} -t ${params.threads} -o ${params.id}.${params.ksize}.noncanonical.jf
    """
  }
}


process kmer_db_to_histogram_counts {
  input:
  path jellyfish_db
  publishDir '.', mode: 'copy'

  output:
  path *.histo, emit: histogram_counts

  script:
  """
  jellyfish histo ${jellyfish_db} > ${params.id}.${params.ksize}.histo
  """
}

