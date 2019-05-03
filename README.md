# Grundbücher
Data creation/curation repo of **Grundbücher**.

## processing pipeline

Transkription is done in MS-Word using dedicated 'Formatvorlagen'

### word to generic TEI

* .docx stored in `{root}/word` are transformed with oxygen transformation scenario DOCX2TEI to a generic TEI
* results of those transformations are stored in `{root}/fromOxgarage`

### generic TEI to to custom TEI

* the generic tei located in `{root}/fromOxgarage` is further processed with `{root}/oxgarage2tei.xsl`
* results of those transformations are stored in `{root}/data/tmp/editions`

### split custom TEI to single files

* the custom TEI located in `{root}/data/tmp/editions` is finally splitted into singel TEI documents with `{root}/splitCorpus.xsl`
* results of those transformations are stored in `{root}/data/editions`


## annotation

The files in `{root}/data/editions` are manually enriched/annotated and uploaded into the web app.
