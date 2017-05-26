class: Workflow
cwlVersion: v1.0
dct:creator: {'@id': 'http://orcid.org/0000-0002-7681-6415', 'foaf:mbox': beccyl@synapse.org,
  'foaf:name': beccyl}
doc: 'SMC-RNA challenge fusion detection submission

  jaffa workflow'
hints: []
id: main
inputs:
- {id: REFERENCE_GENOME, type: File}
- {id: TUMOR_FASTQ_1, type: File}
- {id: TUMOR_FASTQ_2, type: File}
- {id: jaffa_reference, type: File}
name: main
outputs:
- {id: OUTPUT, outputSource: converttobedpe/fusionout, type: File}
steps:
- id: converttobedpe
  in:
  - {id: input, source: jaffa/jaffa_fusions_list}
  - {default: output.bedpe, id: output}
  out: [fusionout]
  run: converter.cwl
- id: jaffa
  in:
  - {default: '75', id: annotation}
  - {id: fastq1, source: TUMOR_FASTQ_1}
  - {id: fastq2, source: TUMOR_FASTQ_2}
  - {default: '%_*.fq.gz', id: fastqInputFormat}
  - {default: GRCh37, id: genome}
  - {id: genomeFasta, source: REFERENCE_GENOME}
  - {default: /opt/JAFFA/JAFFA_direct.groovy, id: pipeline}
  - {id: refBase, source: tar/output}
  - {default: 2, id: threads}
  out: [jaffa_fusions_list]
  run: jaffa.cwl
- id: tar
  in:
  - {id: input, source: jaffa_reference}
  out: [output]
  run: tar.cwl
