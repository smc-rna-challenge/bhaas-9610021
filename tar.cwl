baseCommand: [tar, xvzf]
class: CommandLineTool
cwlVersion: v1.0
hints: []
inputs:
- id: index_name
  inputBinding: {position: 1}
  type: File
name: tar.cwl
outputs:
- id: output
  outputBinding: {glob: SMCRNA_DREAM2017_CTAT_GENOME_LIB}
  type: Directory
package: file:///home/bhaas/Winterfell_SMC_RNA_DREAM2016/STAR_Fusion/cwl/tools/tar.cwl
