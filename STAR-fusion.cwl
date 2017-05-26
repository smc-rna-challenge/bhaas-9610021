arguments:
- {position: 0, prefix: --genome_lib_dir, valueFrom: $(inputs.index.path)}
baseCommand: [STAR-Fusion]
class: CommandLineTool
cwlVersion: v1.0
hints: []
inputs:
- {id: index, type: Directory}
- id: J
  inputBinding: {position: 1, prefix: -J}
  type: File
- id: output_dir
  inputBinding: {position: 2, prefix: --output_dir}
  type: string
- id: threads
  inputBinding: {position: 2, prefix: --CPU}
  type: ['null', int]
- id: min_sum_frags
  inputBinding: {position: 2, prefix: --min_sum_frags}
  type: ['null', int]
name: STAR-fusion.cwl
outputs:
- id: output
  outputBinding: {glob: $(inputs.output_dir+'/star-fusion.fusion_candidates.final.abridged')}
  type: File
package: file:///home/bhaas/Winterfell_SMC_RNA_DREAM2016/STAR_Fusion/cwl/tools/STAR-fusion.cwl
requirements:
- {class: InlineJavascriptRequirement}
- {class: DockerRequirement, dockerPull: 'winterfelldream2016/fusionpipe:0.0.2'}
