class: Workflow
cwlVersion: v1.0
dct:creator: {'@id': 'http://orcid.org/0000-0002-7681-6415', 'foaf:mbox': bhaas@synapse.org,
  'foaf:name': bhaas}
doc: 'SMC-RNA challenge fusion detection submission

  '
hints: []
id: main
inputs:
- {id: TUMOR_FASTQ_1, type: File}
- {id: TUMOR_FASTQ_2, type: File}
- {id: index, type: File}
name: main
outputs:
- {id: OUTPUT, outputSource: converttobedpe/fusionout, type: File}
steps:
- id: converttobedpe
  in:
  - {id: input, source: starfusion/output}
  - {default: output.bedpe, id: output}
  out: [fusionout]
  run: converter.cwl
- id: star
  in:
  - {default: -1, id: align2}
  - {default: 5, id: align3}
  - {default: 5, id: align4}
  - {default: 200000, id: alignIntronMax}
  - {default: 200000, id: alignMatesGapMax}
  - {default: 10, id: alignSJDBoverhangMin}
  - {default: 5, id: alignSJstitchMismatchNmax}
  - {default: 3, id: chim2}
  - {default: 10, id: chimJunctionOverhangMin}
  - {default: 10, id: chimSegmentMin}
  - {default: parameter, id: chimSegmentReadGapMax}
  - {id: fastq1, source: TUMOR_FASTQ_1}
  - {id: fastq2, source: TUMOR_FASTQ_2}
  - {id: index, source: tar/output}
  - {default: '31532137230', id: limitBAMsortRAM}
  - {default: None, id: outReadsUnmapped}
  - {default: SortedByCoordinate, id: outSAMsecond}
  - {default: BAM, id: outSAMtype}
  - {default: zcat, id: readFilesCommand}
  - {default: 5, id: runThreadN}
  - {default: Basic, id: twopassMode}
  out: [output]
  run: STAR.cwl
- id: starfusion
  in:
  - {id: J, source: star/output}
  - {id: index, source: tar/output}
  - {default: 2, id: min_sum_frags}
  - {default: starOut, id: output_dir}
  - {default: 5, id: threads}
  out: [output]
  run: STAR-fusion.cwl
- id: tar
  in:
  - {id: index_name, source: index}
  out: [output]
  run: tar.cwl
