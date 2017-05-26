baseCommand: [convert_jaffa_to_bedpe.py]
class: CommandLineTool
cwlVersion: v1.0
doc: Convert jaffa fusion output to bedpe format
hints:
- {class: DockerRequirement, dockerPull: 'quay.io/smc-rna-challenge/beccyl-7997358-jaffa:1.0.0'}
inputs:
- id: input
  inputBinding: {position: 1}
  type: File
- {id: output, type: string}
outputs:
- id: fusionout
  outputBinding: {glob: $(inputs.output)}
  type: File
requirements:
- {class: InlineJavascriptRequirement}
stdout: $(inputs.output)
