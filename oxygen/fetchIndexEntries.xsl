<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
    <xsl:template match="/">
        <xsl:call-template name="start"/>
    </xsl:template>
    <xsl:template name="start">
        <xsl:variable name="entries" select="doc('http://127.0.0.1:8080/exist/restxq/stb/indices/listperson.xml/xml')//*:person
            | doc('file:/C:/Users/pandorfer/Dropbox/wiener_grundbuecher/grundbuecher_tei/data/indices/listplace.xml')//*:place"/>
        <items action="replace">
            <xsl:apply-templates select="$entries">
                <xsl:sort select="@xml:id"/>
            </xsl:apply-templates>
        </items>
    </xsl:template>
    <xsl:template match="*:person | *:place">
        <item value="ln:{normalize-space()}#{@xml:id}" annotation="{normalize-space()}"/>
    </xsl:template>
</xsl:stylesheet>