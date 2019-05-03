<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs"
    version="3.0">
    
    <!-- created 2018-10-02 dario.kampkaspar@oeaw.ac.at -->
    <xsl:template match="tei:teiCorpus">
        <xsl:apply-templates select="tei:TEI" />
    </xsl:template>
    
    <xsl:template match="tei:TEI">
        <xsl:variable name="nrCurrens">
            <xsl:value-of select="format-number(position(), '00000')" />
        </xsl:variable>
        <xsl:variable name="name" select="$nrCurrens||'-'||substring(translate(lower-case(normalize-space(tei:teiHeader//tei:title[@type='main'])), ' :?', '_'), 1, 30)|| '.xml'" />
        <xsl:result-document href="../../editions/{$name}">
            <xsl:copy-of select="."/>
        </xsl:result-document>
    </xsl:template>
</xsl:stylesheet>