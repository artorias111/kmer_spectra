process plot_kmer_spectra {
  conda params.genomescope_env
  publishDir '.', mode: 'copy'

  input:
  path histogram_counts

  output:
  path 'genomescope_out', emit: genomescope_out

  
  script:
  """
  ${params.genomescope_dir}/genomescope.R -i ${histogram_counts} -o genomescope_out -k ${params.ksize}
  """
}
