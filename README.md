# Grundbücher
Data creation/curation repo of **Grundbücher**.

## processing pipeline

Transkription is done in MS-Word using dedicated 'Formatvorlagen'

### word to generic TEI

* .docx stored in `{root}/word` are transformed with oxygen transformation scenario DOCX2TEI to a generic TEI
* results of those transformations are stored in `{root}/fromOxgarage`

### generic TEI to to custom TEI

* the generic tei located in `{root}/fromOxgarage` is further processed with `{root}/xslt/oxgarage2tei.xsl`
* results of those transformations are stored in `{root}/data/tmp/editions`

### split custom TEI to single files

* the custom TEI located in `{root}/data/tmp/editions` is finally splitted into singel TEI documents with `{root}/xslt/splitCorpus.xsl`
* results of those transformations are stored in `{root}/data/editions`

### XIinclude index files

* apply `{root}/xslt/addXIincludes.xsl` adds index files via xi:include
* script overrides files located in `{root}/data/editions`. Also be aware that this script should not be run several times since it will multiply the include statements. 

## Manual Annotation

* Manual Work is done in the `{root}/data/editions` collection. After everything is done in a file, move the file to `{root}/data/done`. Documents stored in `{root}/data/editions` will be frequently imported into the web application. 
* Documents stored in `{root}/data/editions` MUST NOT have any XInclude statements.