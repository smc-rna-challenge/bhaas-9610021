baseCommand: [convert_star_to_bedpe.py]
class: CommandLineTool
cwlVersion: v1.0
hints: []
inputs:
- id: input
  inputBinding: {position: 1}
  type: File
- {id: output, type: string}
name: converter.cwl
outputs:
- id: fusionout
  outputBinding: {glob: $(inputs.output)}
  type: File
package: file:///home/bhaas/Winterfell_SMC_RNA_DREAM2016/STAR_Fusion/cwl/tools/converter.cwl
requirements:
- {class: InlineJavascriptRequirement}
- {class: DockerRequirement, dockerPull: dreamchallenge/star}
stdout: $(inputs.output)
