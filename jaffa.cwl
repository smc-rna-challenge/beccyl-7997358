arguments:
- {position: 3, valueFrom: -p}
- {position: 5, valueFrom: -p}
- {position: 7, valueFrom: -p}
- {position: 9, valueFrom: -p}
- {position: 11, valueFrom: -p}
baseCommand: [bpipe, run]
class: CommandLineTool
cwlVersion: v1.0
doc: 'Jaffa: Just Another Fusion Finding Algorithm'
hints:
- {class: DockerRequirement, dockerOutputDirectory: /usr/local/jaffa/batch, dockerPull: 'quay.io/smc-rna-challenge/beccyl-7997358-jaffa:1.0.0'}
inputs:
- id: annotation
  inputBinding: {position: 12, prefix: annotation=, separate: false}
  type: string
- id: fastq1
  inputBinding: {position: 14}
  type: File
- id: fastq2
  inputBinding: {position: 15}
  type: File
- id: fastqInputFormat
  inputBinding: {position: 8, prefix: fastqInputFormat=, separate: false}
  type: string
- id: genome
  inputBinding: {position: 10, prefix: genome=, separate: false}
  type: string
- id: genomeFasta
  inputBinding: {position: 6, prefix: genomeFasta=, separate: false}
  type: File
- id: pipeline
  inputBinding: {position: 13}
  type: string
- id: refBase
  inputBinding: {position: 4, prefix: refBase=, separate: false}
  type: Directory
- doc: 'Change number of threads used

    '
  id: threads
  inputBinding: {position: 2, prefix: -n}
  type: ['null', int]
label: JAFFA
outputs:
- id: jaffa_fusions_fasta
  outputBinding: {glob: jaffa_results.fasta}
  type: File
- id: jaffa_fusions_list
  outputBinding: {glob: jaffa_results.csv}
  type: File
- {id: output, type: stdout}
requirements:
- {class: InlineJavascriptRequirement}
stdout: log.txt
