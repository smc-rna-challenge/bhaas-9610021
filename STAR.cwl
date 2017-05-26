arguments:
- {position: 0, prefix: --genomeDir, valueFrom: $(inputs.index.path + "/ref_genome.fa.star.idx")}
baseCommand: [STAR]
class: CommandLineTool
cwlVersion: v1.0
hints: []
inputs:
- {id: index, type: Directory}
- id: fastq1
  inputBinding: {position: 1, prefix: --readFilesIn}
  type: File
- id: fastq2
  inputBinding: {position: 2}
  type: File
- id: twopassMode
  inputBinding: {position: 3, prefix: --twopassMode}
  type: ['null', string]
- id: outReadsUnmapped
  inputBinding: {position: 4, prefix: --outReadsUnmapped}
  type: ['null', string]
- id: chimSegmentMin
  inputBinding: {position: 5, prefix: --chimSegmentMin}
  type: ['null', int]
- id: chimJunctionOverhangMin
  inputBinding: {position: 6, prefix: --chimJunctionOverhangMin}
  type: ['null', int]
- id: alignSJDBoverhangMin
  inputBinding: {position: 7, prefix: --alignSJDBoverhangMin}
  type: ['null', int]
- id: alignMatesGapMax
  inputBinding: {position: 8, prefix: --alignMatesGapMax}
  type: ['null', int]
- id: alignIntronMax
  inputBinding: {position: 9, prefix: --alignIntronMax}
  type: ['null', int]
- id: chimSegmentReadGapMax
  inputBinding: {position: 10, prefix: --chimSegmentReadGapMax}
  type: ['null', string]
- id: chim2
  inputBinding: {position: 11}
  type: ['null', int]
- id: alignSJstitchMismatchNmax
  inputBinding: {position: 12, prefix: --alignSJstitchMismatchNmax}
  type: ['null', int]
- id: align2
  inputBinding: {position: 13}
  type: ['null', int]
- id: align3
  inputBinding: {position: 14}
  type: ['null', int]
- id: align4
  inputBinding: {position: 15}
  type: ['null', int]
- id: runThreadN
  inputBinding: {position: 16, prefix: --runThreadN}
  type: ['null', int]
- id: limitBAMsortRAM
  inputBinding: {position: 17, prefix: --limitBAMsortRAM}
  type: ['null', string]
- id: outSAMtype
  inputBinding: {position: 18, prefix: --outSAMtype}
  type: ['null', string]
- id: outSAMsecond
  inputBinding: {position: 19}
  type: ['null', string]
- id: readFilesCommand
  inputBinding: {position: 20, prefix: --readFilesCommand}
  type: ['null', string]
name: STAR.cwl
outputs:
- id: output
  outputBinding: {glob: Chimeric.out.junction}
  type: File
package: file:///home/bhaas/Winterfell_SMC_RNA_DREAM2016/STAR_Fusion/cwl/tools/STAR.cwl
requirements:
- {class: InlineJavascriptRequirement}
- {class: DockerRequirement, dockerPull: 'winterfelldream2016/fusionpipe:0.0.2'}
- {class: ResourceRequirement, coresMin: 8, ramMin: 80000}
