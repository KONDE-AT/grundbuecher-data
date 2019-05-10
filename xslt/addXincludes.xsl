<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.tei-c.org/ns/1.0"
    xmlns:xi="http://www.w3.org/2001/XInclude"
    xmlns:tei="http://www.tei-c.org/ns/1.0" version="2.0">
    <xsl:output method="xml" indent="yes" omit-xml-declaration="yes"/>
    
    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="tei:encodingDesc">
        <encodingDesc>
            <xsl:apply-templates/>

                <p>
                    <xsl:element name="xi:include">
                        <xsl:attribute name="href">../indices/listperson.xml</xsl:attribute>
                        <xsl:attribute name="xpointer">listperson</xsl:attribute>
                        <xsl:element name="fallback" namespace="http://www.w3.org/2001/XInclude">File to include couldn't be found</xsl:element>
                    </xsl:element>
                    <xsl:element name="xi:include">
                        <xsl:attribute name="href">../indices/listplace.xml</xsl:attribute>
                        <xsl:attribute name="xpointer">listplace</xsl:attribute>
                        <xsl:element name="fallback" namespace="http://www.w3.org/2001/XInclude">File to include couldn't be found</xsl:element>
                    </xsl:element>
                    <xsl:element name="xi:include">
                        <xsl:attribute name="href">../indices/listorg.xml</xsl:attribute>
                        <xsl:attribute name="xpointer">listorg</xsl:attribute>
                        <xsl:element name="fallback" namespace="http://www.w3.org/2001/XInclude">File to include couldn't be found</xsl:element>
                    </xsl:element>
                </p>
        </encodingDesc>
    </xsl:template>

</xsl:stylesheet>