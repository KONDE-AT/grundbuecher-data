<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.tei-c.org/ns/1.0"
    xmlns:tei="http://www.tei-c.org/ns/1.0" version="2.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="#all">
    <xsl:output method="xml" indent="yes" omit-xml-declaration="yes"/>
       
    <xsl:variable name="startpage">1r</xsl:variable>
    <xsl:variable name="endpage">200v</xsl:variable>
    <xsl:template match="/">
        <teiCorpus xmlns="http://www.tei-c.org/ns/1.0">
            <teiHeader>
                <fileDesc>
                    <titleStmt>
                        <title type="main">Digitale Edition der Wiener Grundbücher</title>
                        <title type="sub">Digitale Edition Grundbuch 1577, C</title>
                        <respStmt>
                            <resp>Transkription</resp>
                            <name><rs type="person" ref="#mustermann_max">Max Mustermann</rs></name>
                        </respStmt>
                        <respStmt>
                            <resp>Transkription</resp>
                            <name><rs type="person" ref="#musterfrau_hanni">Hanni Musterfrau</rs></name>
                        </respStmt>
                        <respStmt>
                            <resp>Annotation</resp>
                            <name><rs type="person" ref="#musterfrau_hanni">Hanni Musterfrau</rs></name>
                        </respStmt>
                        <respStmt>
                            <resp>Kommentar</resp>
                            <name><rs type="person" ref="#musterfrau_hanni">Hanni Musterfrau</rs></name>
                        </respStmt>
                    </titleStmt>
                    <publicationStmt>
                        <publisher>whatever you think fit bests here</publisher>
                        <availability>
                            <licence target="https://creativecommons.org/licenses/by-sa/4.0/">
                                <p>The (CC BY-SA 4.0)-License applies to this document.</p>
                                <p>You are allowed to share (copy and redistribute the material in any medium or format) and adapt (remix, transform, and build upon the material) for any purpose, even commercially.</p>
                                <p>You must give appropriate credit, provide a link to the license, and indicate if changes were made. You may do so in any reasonable manner, but not in any way that suggests the licensor endorses you or your use.</p>
                                <p>ShareAlike — If you remix, transform, or build upon the material, you must distribute your contributions under the same license as the original.</p>
                            </licence>
                        </availability>
                    </publicationStmt>
                    <sourceDesc>
                        <msDesc type="invetory">
                            <msIdentifier>
                                <institution>Wiener Stadt- und Landesarchiv (WStLA)</institution>
                                <repository>Grundbürcher</repository>
                            </msIdentifier>                            
                        </msDesc>
                    </sourceDesc>
                </fileDesc>
                <encodingDesc>
                    <p>
                        <xsl:element name="xi:include" xmlns:xi="http://www.w3.org/2001/XInclude">
                            <xsl:attribute name="href">../indices/listperson.xml</xsl:attribute>
                            <xsl:attribute name="xpointer">listperson</xsl:attribute>
                            <xsl:element name="fallback" namespace="http://www.w3.org/2001/XInclude">
                                <p>File to include couldn't be found</p>
                            </xsl:element>
                        </xsl:element>
                        <xsl:element name="xi:include" xmlns:xi="http://www.w3.org/2001/XInclude">
                            <xsl:attribute name="href">../indices/listplace.xml</xsl:attribute>
                            <xsl:attribute name="xpointer">listplace</xsl:attribute>
                            <xsl:element name="fallback" namespace="http://www.w3.org/2001/XInclude">
                                <p>File to include couldn't be found</p>
                            </xsl:element>
                        </xsl:element>
                    </p>
                </encodingDesc>
            </teiHeader>
            <xsl:for-each select="//tei:p[@rend='Urkundendatum']">
                <xsl:variable name="datum">
                    <xsl:value-of select="replace(replace(., '\[', ''), '\]', '')"/>
                </xsl:variable>
                <TEI>
                    <teiHeader>
                        <fileDesc>
                            <titleStmt>
                                <title type="main">Eintrag vom <xsl:value-of select="$datum"/></title>
                                <title type="sub">Digitale Edition der Wiener Grundbücher</title>
                                <respStmt>
                                    <resp>Transkription</resp>
                                    <name>
                                        <rs type="person" ref="#">
                                            <xsl:apply-templates select="./preceding::tei:p[@rend='Seitenautor'][1]"/>
                                        </rs>
                                    </name>
                                </respStmt>
                            </titleStmt>
                            <publicationStmt>
                                <publisher>whatever you think fit bests here</publisher>
                                <availability>
                                    <licence target="https://creativecommons.org/licenses/by/4.0/">
                                        <p>some text</p>
                                    </licence>
                                </availability>
                            </publicationStmt>
                            <sourceDesc>
                                <msDesc type="invetory">
                                    <msIdentifier>
                                        <institution>Wiener Stadt- und Landesarchiv (WStLA)</institution>
                                        <repository>Grundbücher</repository>
                                    </msIdentifier>
                                    <msContents>
                                        <msItem>
                                            <locus>
                                                <xsl:attribute name="from">
                                                    <xsl:value-of select="preceding::tei:p[@rend='Folioangabe'][1]"/>
                                                </xsl:attribute>
                                                <xsl:attribute name="to">
                                                    <xsl:value-of select="following::tei:p[@rend='Folioangabe'][1]"/>
                                                </xsl:attribute>
                                            </locus>
                                            <p>
                                                <xsl:value-of select="preceding::tei:p[@rend='Folioangabe'][1]"/> - <xsl:value-of select="following::tei:p[@rend='Folioangabe'][1]"/>
                                            </p>
                                        </msItem>
                                    </msContents>
                                    <history>
                                        <origin>
                                            <xsl:attribute name="notBefore">
                                                <xsl:value-of select="$datum"/>
                                            </xsl:attribute>      
                                        </origin>
                                    </history>
                                </msDesc>
                            </sourceDesc>
                            <sourceDesc>
                                <p>Information about the source</p>
                            </sourceDesc>
                        </fileDesc>
                    </teiHeader>
                    <text>
                        <body>
                            <div type="entry">
                                <div type="Rubrik">
                                    <p>
                                        <xsl:value-of select="preceding::tei:p[@rend='Rubrik'][1]"/>
                                    </p>
                                </div>
                                <div type="content">
                                    <p>
                                        <xsl:apply-templates select="./following-sibling::tei:p[1]"/>
                                    </p>
                                </div>
                                <div type="summa">
                                    <p>
                                        <xsl:apply-templates select="./following-sibling::tei:p[@rend='Summa'][1]"/>
                                    </p>
                                </div>
                                <div type="Nachtrag">
                                    <p>
                                        <xsl:apply-templates select="following::tei:p[@rend='Nachtrag'][1]"/>
                                    </p>
                                </div>
                            </div>
                        </body>
                    </text>
                </TEI>
            </xsl:for-each>
        </teiCorpus>
        
    </xsl:template>

    
    <xsl:template match="tei:head"/>
    
    <xsl:template match="tei:hi[@rend='background(yellow)']">
        <unclear><xsl:apply-templates/></unclear>
    </xsl:template>
    
    <xsl:template match="tei:note">
        <note><xsl:apply-templates select="./*"/></note>
    </xsl:template>
    
    <xsl:template match="tei:anchor"/>
    
    <xsl:template match="tei:p[@rend='Folioangabe']">
        <HALLO>
            <xsl:value-of select="."/>
        </HALLO>
    </xsl:template>
    
    <xsl:template match="tei:hi[@rend='background(cyan)']">
        <rs type="person"><xsl:apply-templates/></rs>
    </xsl:template>
    
    <xsl:template match="tei:hi[@rend='underline background(darkYellow)']">
        <rs type="org"><xsl:apply-templates/></rs>
    </xsl:template>
    
    <xsl:template match="tei:hi[@rend='background(darkYellow)']">
        <rs type="org"><xsl:apply-templates/></rs>
    </xsl:template>
    
    <xsl:template match="tei:hi[@rend='background(red)']">
        <rs type="book"><xsl:apply-templates/></rs>
    </xsl:template>
    
    
</xsl:stylesheet>